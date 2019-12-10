"""Module for generating workloads.

Includes the main WorkloadGenerator, which uses multiple WorkloadProducers.
The WorkloadGenerator manages the WorkloadProducers.
The WorkloadProducers have IPC connections to a database interface.
"""

import json
import random
import secrets
from os import getenv

import zmq
from flask import Flask, Response
from flask_cors import CORS

WORKLOAD_GENERATOR_PUBLISHER_SOCKET_URL = getenv(
    "WORKLOAD_GENERATOR_PUBLISHER_SOCKET_URL"
)
WORKLOAD_GENERATOR_BACKEND_HOST = getenv("WORKLOAD_GENERATOR_BACKEND_HOST")
WORKLOAD_GENERATOR_BACKEND_PORT = getenv("WORKLOAD_GENERATOR_BACKEND_PORT")

app = Flask(__name__)
cors = CORS(app)
app.config["CORS_HEADERS"] = "Content-Type"

context = zmq.Context()
publisher = context.socket(zmq.PUB)
publisher.bind(WORKLOAD_GENERATOR_PUBLISHER_SOCKET_URL)


def generate_simple_workload(number_queries):
    """Generate simple workload."""
    queries = []
    for _ in range(number_queries):
        queries.append(("SELECT 1;", None))
    return queries


def generate_random():
    """Return a simple query with a random number."""
    query = """SELECT * FROM nation WHERE n_nationkey = (%s);"""
    return (query, (secrets.randbelow(24),))


def generate_heavy_workload(number_queries):
    """Generate heavy workload."""
    queries = random.choices(
        [
            (
                """SELECT
            l_returnflag,
            l_linestatus,
            SUM(l_quantity) as sum_qty,
            SUM(l_extendedprice) as sum_base_price,
            SUM(l_extendedprice*(1.0-l_discount)) as sum_disc_price,
            SUM(l_extendedprice*(1.0-l_discount)*(1.0+l_tax)) as sum_charge,
            AVG(l_quantity) as avg_qty, AVG(l_extendedprice) as avg_price,
            AVG(l_discount) as avg_disc, COUNT(*) as count_order
            FROM lineitem
            WHERE l_shipdate <= '1998-12-01'
            GROUP BY l_returnflag, l_linestatus
            ORDER BY l_returnflag, l_linestatus;""",
                None,
            ),
            (
                """SELECT
            sum(l_extendedprice*l_discount) AS REVENUE
            FROM lineitem
            WHERE l_shipdate >= '1994-01-01'
                AND l_shipdate < '1995-01-01'
                AND l_discount BETWEEN .05
                AND .07 AND l_quantity < 24.0;""",
                None,
            ),
            generate_random(),
        ],
        weights=[1, 1, 100],
        k=number_queries,
    )

    return queries


def create_heavy_workload_packages(number_packages, number_queries):
    """Create packages with heavy queries."""
    dictionary = {}
    packages = []
    for _ in range(number_packages):
        packages.append(generate_heavy_workload(number_queries))
    dictionary["Content"] = packages
    data = json.dumps(dictionary)
    return data


def create_simple_workload_packages(number_packages, number_queries):
    """Create packages with simple queries."""
    dictionary = {}
    packages = []
    for _ in range(number_packages):
        packages.append(generate_simple_workload(number_queries))
    dictionary["Content"] = packages
    data = json.dumps(dictionary)
    return data


@app.route("/simple_workload")
def execute_simple_workload():
    """Send simple workload to subscribers."""
    workload = create_simple_workload_packages(10, 20000)
    publisher.send_string(workload)
    return Response(status=200)


@app.route("/heavy_workload")
def execute_heavy_workload():
    """Send heavy workload to subscribers."""
    workload = create_heavy_workload_packages(10, 1000)
    publisher.send_string(workload)
    return Response(status=200)


if __name__ == "__main__":
    app.run(host=WORKLOAD_GENERATOR_BACKEND_HOST, port=WORKLOAD_GENERATOR_BACKEND_PORT)
