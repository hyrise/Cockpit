"""Entry point for the app."""
from dash.dependencies import Input, Output
from dash_core_components import Location
from dash_html_components import Div

import callback  # noqa
from app import app
from layout import layout

app.layout = Div([Location(id="url", refresh=False), Div(id="page-content")])


@app.callback(Output("page-content", "children"), [Input("url", "pathname")])
def display_page(pathname):
    """Render a layout given a path."""
    return layout


if __name__ == "__main__":
    app.run_server(debug=True)
