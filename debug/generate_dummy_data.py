"""Generate dummy data for the dash demo."""
from random import randint

with open("influx.csv", "w") as f:
    print("ID", "THROUGHPUT", sep=",", file=f)
    for id in range(25000):
        tp = randint(10000, 16000)  # nosec
        print(id, tp, sep=",", file=f)
