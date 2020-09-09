"""Module to test backend running in docker."""
from subprocess import run  # nosec
from time import sleep

from influxdb import InfluxDBClient
from system_tests.backend_handler import BackendHandler
from system_tests.settings import (
    BACKEND_HOST,
    BACKEND_PORT,
    SETUP_TIMEOUT,
    STORAGE_HOST,
    STORAGE_PASSWORD,
    STORAGE_PORT,
    STORAGE_USER,
)
from system_tests.test_backend import TestSystem

SETUP_TIMEOUT = int(SETUP_TIMEOUT)
TestSystem.__test__ = False  # type: ignore


def start_container():
    """Build and start docker container."""
    run(["docker-compose", "build", "--no-cache", "backend"])  # nosec
    run(["docker-compose", "up", "-d", "backend", "influxdb", "hyrise_1"])  # nosec


def log_container_output():
    """Save container output to files."""
    for component in ["backend", "influxdb", "hyrise_1"]:
        run(  # nosec
            f"docker-compose logs --no-color {component} > {component}_docker_log.txt",
            shell=True,
        )


def shutdown_container():
    """Stop and shutdown docker container."""
    run(["docker-compose", "down"])  # nosec


class TestDocker(TestSystem):
    """Test for the backend running in docker."""

    __test__ = True

    @classmethod
    def setup_class(cls):
        """Start backend."""
        start_container()
        sleep(SETUP_TIMEOUT)
        cls.influx_client = InfluxDBClient(
            STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD
        )
        cls.backend = BackendHandler(BACKEND_HOST, BACKEND_PORT)

    @classmethod
    def teardown_class(cls):
        """Run after every test."""
        log_container_output()
        shutdown_container()
