"""Component layouts for the app."""
from dash_bootstrap_components import Col, Container, NavbarSimple, Row
from dash_core_components import Graph, Interval
from dash_html_components import Div

throughput_graph = Graph(
    id="throughput-graph",
    config={
        "displaylogo": False,
        "displayModeBar": False,
        "scrollZoom": False,
        "editable": False,
        "staticPlot": True,
        "doubleClick": False,
    },
)

storage_graph = Graph(
    id="storage-graph",
    config={
        "displaylogo": False,
        "displayModeBar": False,
        "scrollZoom": False,
        "editable": False,
        "staticPlot": True,
        "doubleClick": False,
    },
)

body = Container(
    [
        Interval("throughput-interval", interval=1 * 1000, n_intervals=0),
        Interval("storage-interval", interval=60 * 1000, n_intervals=0),
        Row(Col([throughput_graph])),
        Row(Col([storage_graph])),
    ],
    className="mt-4",
    fluid=True,
)

header = NavbarSimple(brand="Cockpit", fluid=True)

layout = Div([header, body])
