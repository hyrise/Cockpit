"""`hyrisecockpit` lives on [GitHub](https://github.com/hyrise/Cockpit)."""
from setuptools import find_packages, setup

setup(
    name="hyrisecockpit",
    packages=find_packages(),
    entry_points={
        "console_scripts": [
            "cockpit-backend=hyrisecockpit.backend.cli:main",
            "cockpit-manager=hyrisecockpit.database_manager.cli:main",
            "cockpit-generator=hyrisecockpit.workload_generator.cli:main",
            "cockpit-frontend=hyrisecockpit.dash.cli:main",
        ],
    },
)
