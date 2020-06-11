# flake8: noqa
# type: ignore
"""Module for calculating query difference."""

from datetime import datetime

from influxdb import InfluxDBClient

from plugin_evaluation.settings import (
    STORAGE_HOST,
    STORAGE_PASSWORD,
    STORAGE_PORT,
    STORAGE_USER,
)

database = "aptera"

start = "2020-06-11 15:15:36"
end = "2020-06-11 15:18:04"

startdata = datetime.strptime(start, "%Y-%m-%d %H:%M:%S")
enddata = datetime.strptime(end, "%Y-%m-%d %H:%M:%S")

startts = int(startdata.timestamp() * 1_000_000_000)
endts = int(enddata.timestamp() * 1_000_000_000)

print(f"startts: {startts}")
print(f"endts: {endts}\n")

client = InfluxDBClient(STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD)

query_before = """SELECT MEAN("latency")/1000000 AS "latency" 
    FROM successful_queries 
    WHERE time <  $startts
    GROUP BY benchmark, query_no;"""

query_after = """SELECT MEAN("latency")/1000000 AS "latency" 
    FROM successful_queries 
    WHERE time >  $endts
    GROUP BY benchmark, query_no;"""


result_before = client.query(
    query_before, database=database, bind_params={"startts": endts},
)

result_after = client.query(
    query_after, database=database, bind_params={"endts": endts},
)

latency_before = [
    {
        "benchmark": tags["benchmark"],
        "query_number": tags["query_no"],
        "latency": list(result_before[table, tags])[0]["latency"],
    }
    for table, tags in list(result_before.keys())
]

latency_after = [
    {
        "benchmark": tags["benchmark"],
        "query_number": tags["query_no"],
        "latency": list(result_after[table, tags])[0]["latency"],
    }
    for table, tags in list(result_after.keys())
]

before_total = 0.0
after_total = 0.0

for before_value, after_value in zip(latency_before, latency_after):
    if (
        before_value["benchmark"] != after_value["benchmark"]
        or before_value["query_number"] != after_value["query_number"]
    ):
        print("ERROR: MISMATCH")
        break

    query_no = before_value["query_number"]
    before_value = float("%.2f" % before_value["latency"])
    after_value = float("%.2f" % after_value["latency"])

    percent = (after_value - before_value) / before_value * 100
    percent = float("%.2f" % percent)
    symbol = "" if percent < 0 else "+"
    print(f"{query_no} & {before_value} & {after_value} & {symbol}{percent}\\% \\\\")

    before_total = before_total + before_value
    after_total = after_total + after_value

before_total = float("%.2f" % before_total)
after_total = float("%.2f" % after_total)

percent = (after_total - before_total) / before_total * 100
percent = float("%.2f" % percent)
symbol = "" if percent < 0 else "+"
print(f"Total & {before_total} & {after_total} & {symbol}{percent}\\% \\\\")
