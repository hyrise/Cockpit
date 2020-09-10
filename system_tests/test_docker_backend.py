"""Module to test back-end running in docker.

This test will start the following components in docker:
1. back-end
2. influxdb
3. hyrise_1
After the containers are running the test will execute the user scenario
defined in test_backend.
"""
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
    """Build and start docker container.

    To make sure that the changes in the back-end code are taking into account,
    the back-end docker container is always build new.

    Note:
        If the Hyrise image doesn't exist it will be pulled from docker Hub.
    """
    run(["docker-compose", "build", "--no-cache", "backend"])  # nosec
    run(["docker-compose", "up", "-d", "backend", "influxdb", "hyrise_1"])  # nosec


def log_container_output():
    """Save container output to files.

    At the end of the system test we save the logs of the container into files.
    This can come in handy for debugging purposes.
    """
    for component in ["backend", "influxdb", "hyrise_1"]:
        run(  # nosec
            f"docker-compose logs --no-color {component} > {component}_docker_log.txt",
            shell=True,
        )


def shutdown_container():
    """Stop and shutdown docker container."""
    run(["docker-compose", "down"])  # nosec


class TestDocker(TestSystem):
    """Back-end system tests for docker setup.

    This class inherits from the TestSystem class. The TestSystem call defines
    the user scenario. The TestDocker class implements the method setup_class and
    teardown_class. The setup_class method is called before the System test (user scenario)
    starts. The teardown_class at the end of the System test. The TestDocker class needs to
    implement these methods to execute the system test with the docker environment.
    """

    __test__ = True  # Tell pytest to use TestDocker as the test starting point.

    @classmethod
    def setup_class(cls):
        """Start docker environment and handler.

        This method starts the docker containers. After a wait time it will initialize
        the Influx Client so that the System test defined in (TestSystem) can check the
        Influx. A BackendHandler is also initialized so that the System test can interact with the
        back-end. The BackendHandler simply interacts with the API of the back-end.
        """
        start_container()
        sleep(SETUP_TIMEOUT)
        cls.influx_client = InfluxDBClient(
            STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD
        )
        cls.backend = BackendHandler(BACKEND_HOST, BACKEND_PORT)

    @classmethod
    def teardown_class(cls):
        """Tear-down docker containers and log output."""
        log_container_output()
        shutdown_container()
