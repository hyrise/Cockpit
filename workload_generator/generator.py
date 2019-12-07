"""Module for generating workloads.

Includes the main WorkloadGenerator, which uses multiple WorkloadProducers.
The WorkloadGenerator manages the WorkloadProducers.
The WorkloadProducers have IPC connections to a database interface.
"""

import json
import random

import zmq
from flask import Flask, Response
from flask_cors import CORS

PUBLISHER_SOCKET_URL = ""  # please add url here
BACKEND_HOST = ""
BACKEND_PORT = ""

app = Flask(__name__)
cors = CORS(app)
app.config["CORS_HEADERS"] = "Content-Type"

context = zmq.Context()
publisher = context.socket(zmq.PUB)
publisher.bind(PUBLISHER_SOCKET_URL)


def generate_simple_workload():
    """Generate simple workload."""
    workload = []
    for _ in range(100000):
        workload.append("SELECT 1;")
    dictionary = {}
    dictionary["Content"] = workload
    data = json.dumps(dictionary)
    return data


def generate_random():
    """Return a simple query with a random number."""
    return (
        """SELECT *
    FROM nation
    WHERE n_nationkey = ?;""",
        (random.randint(0, 24),),  # nosec
    )


def generate_heavy_workload(scale):
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
                AND .07 AND l_quantity < 24;""",
                None,
            ),
            generate_random(),
        ],
        weights=[1, 1, 100],
        k=1000 * scale,
    )
    dictionary = {}
    dictionary["Content"] = queries
    data = json.dumps(dictionary)
    return data


@app.route("/simple_workload")
def execute_simple_workload():
    """Send simple workload to subscribers."""
    workload = generate_simple_workload()
    publisher.send_string(workload)
    return Response(status=200)


@app.route("/heavy_workload")
def execute_heavy_workload():
    """Send heavy workload to subscribers."""
    workload = generate_heavy_workload(20)
    publisher.send_string(workload)
    return Response(status=200)


if __name__ == "__main__":
    app.run(host=BACKEND_HOST, port=BACKEND_PORT)
