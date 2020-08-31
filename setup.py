"""`hyrisecockpit` lives on [GitHub](https://github.com/hyrise/Cockpit)."""
from setuptools import find_packages, setup

setup(
    name="hyrisecockpit",
    packages=find_packages(),
    include_package_data=True,
    entry_points={
        "console_scripts": [
            "cockpit-backend=hyrisecockpit.api.wsgi:main",
            "cockpit-manager=hyrisecockpit.database_manager.cli:main",
            "cockpit-generator=hyrisecockpit.workload_generator.cli:main",
            "cockpit=hyrisecockpit.run_backend:main",
        ],
    },
)
