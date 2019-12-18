"""Callbacks for the app interactivity."""
from typing import Dict

from dash.dependencies import Input, Output

from .app import app
from .figure import (
    draw_cpu_figure,
    draw_ram_figure,
    draw_storage_figure,
    draw_throughput_figure,
)


@app.callback(
    Output("throughput-graph", "figure"), [Input("throughput-interval", "n_intervals")],
)
def update_throughput_graph(n_intervals: int) -> Dict:
    """Update the throughput figure."""
    return draw_throughput_figure(n_intervals)


@app.callback(
    Output("storage-graph", "figure"), [Input("storage-interval", "n_intervals")],
)
def update_storage_graph(n_intervals: int) -> Dict:
    """Update the storage figure."""
    return draw_storage_figure(n_intervals)


@app.callback(
    Output("cpu-graph", "figure"), [Input("throughput-interval", "n_intervals")],
)
def update_cpu_graph(n_intervals: int) -> Dict:
    """Update the CPU figure."""
    return draw_cpu_figure(n_intervals)


@app.callback(
    Output("ram-graph", "figure"), [Input("throughput-interval", "n_intervals")],
)
def update_ram_graph(n_intervals: int) -> Dict:
    """Update the RAM figure."""
    return draw_ram_figure(n_intervals)
