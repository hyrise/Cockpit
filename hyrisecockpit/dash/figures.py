"""Drawing figures."""
from json import load
from typing import Any, Dict, List

from pandas import DataFrame, read_csv
from plotly.graph_objects import Scattergl as Scatter
from plotly.graph_objects import Treemap


def get_throughput_data() -> DataFrame:
    """Read data from an InfluxDB simulating .csv file."""
    df: DataFrame = read_csv("influx.csv", index_col="ID")
    df = df.rolling(3).mean().dropna()
    return df


def get_storage_data() -> Dict[str, Any]:
    """Read storage data mock."""
    with open("storage.json", "r") as f:
        data = load(f)

    parents: List[str] = []
    labels: List[str] = []
    values: List[int] = []

    for lev_1 in data.keys():
        total = 0
        for lev_2 in data[lev_1].keys():
            size = int(data[lev_1][lev_2]["estimated_size_in_bytes"])
            total += size
            parents.append(lev_1)
            labels.append(lev_2)
            values.append(size)
        parents.append("Tables")
        labels.append(lev_1)
        values.append(total)
    result = {"parents": parents, "labels": labels, "values": values}
    return result


DATA = get_throughput_data()  # just for debug
DATA2 = get_storage_data()  # just for debug


def draw_throughput_figure(n_intervals: int = 0) -> Dict:
    """Update the symbol graph showing candlesticks for the selected symbol."""
    df: DataFrame = DATA.iloc[n_intervals : n_intervals + 100]
    trace = Scatter(x=df.index, y=df["THROUGHPUT"])
    figure = {"data": [trace]}
    return figure


def draw_storage_figure(n_intervals: int = 0) -> Dict:
    """Update the symbol graph showing candlesticks for the selected symbol."""
    trace = Treemap(
        labels=DATA2["labels"],
        parents=DATA2["parents"],
        values=DATA2["values"],
        branchvalues="total",
    )
    figure = {"data": [trace]}
    return figure
