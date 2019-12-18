"""Generate dummy data for the dash demo."""
from random import randint

with open("influx.csv", "w") as f:
    print("ID", "THROUGHPUT", sep=",", file=f)
    for id in range(25000):
        tp = randint(10000, 16000)  # nosec
        print(id, tp, sep=",", file=f)

with open("system.csv", "w") as f:
    print("ID", "CPU", "RAM", sep=",", file=f)
    for id in range(25000):
        cpu = randint(0, 100)  # nosec
        ram = randint(0, 100)  # nosec
        print(id, cpu, ram, sep=",", file=f)
