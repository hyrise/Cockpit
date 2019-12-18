"""Component layouts for the app."""
from dash_bootstrap_components import Col, Container, NavbarSimple, Row
from dash_core_components import Graph, Interval
from dash_html_components import Div

config = {
    "displaylogo": False,
    "displayModeBar": False,
    "scrollZoom": False,
    "editable": False,
    "staticPlot": True,
    "doubleClick": False,
}
throughput_graph = Graph(id="throughput-graph", config=config,)

storage_graph = Graph(id="storage-graph", config=config,)

cpu_graph = Graph(id="cpu-graph", config=config,)
ram_graph = Graph(id="ram-graph", config=config,)

body = Container(
    [
        Interval("throughput-interval", interval=1 * 1000, n_intervals=0),
        Interval("storage-interval", interval=60 * 1000, n_intervals=0),
        Row([Col([cpu_graph], width=3), Col([throughput_graph], width=9)]),
        Row([Col([ram_graph], width=3), Col([storage_graph], width=9)]),
    ],
    fluid=True,
)

header = NavbarSimple(brand="Cockpit", fluid=True)

layout = Div([header, body])
