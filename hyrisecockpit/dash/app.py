"""Example app used to demo a dashboard."""
from dash import Dash
from dash_bootstrap_components.themes import BOOTSTRAP

app = Dash(__name__, external_stylesheets=[BOOTSTRAP])
server = app.server
app.config.suppress_callback_exceptions = True
