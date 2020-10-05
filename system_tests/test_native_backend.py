"""Module to test back-end running natively.

This test will start the back-end running natively.
After the back-end is running the test will execute the user scenario
defined in test_backend.
"""
from signal import SIGINT
from subprocess import Popen  # nosec
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

TIME_OUT = 10
TestSystem.__test__ = False  # type: ignore


def start_backend(output_file, error_file):
    """Start cockpit natively.

    This function starts the cockpit in a subprocess.

    Note:
        The User needs to take care that the Influx and Hyrise is running.
    """
    return Popen(
        ["cockpit", "--backend"], stderr=error_file, stdout=output_file
    )  # nosec


def shutdown_backend(subprocess):
    """Stop backend.

    This function sends an interrupt signal to the back-end.
    """
    subprocess.send_signal(SIGINT)  # nosec
    subprocess.wait(timeout=TIME_OUT)


class TestNative(TestSystem):
    """Back-end system tests for a back-end running natively."""

    __test__ = True  # Tell pytest to use TestNative as the test starting point.

    @classmethod
    def setup_class(cls):
        """Start back-end running natively.

        This method starts the back-end. After a wait time it will initialize
        the Influx Client so that the System test defined in (TestSystem) can check the
        Influx. A BackendHandler is also initialized so that the System test can interact with the
        back-end. The BackendHandler simply interacts with the API of the back-end. The output
        of the back-end subprocess is redirected to files.
        """
        cls.error_file = open("cockpit_stderr.txt", "w")
        cls.output_file = open("cockpit_stdout.txt", "w")
        cls.subprocess = start_backend(cls.error_file, cls.output_file)
        sleep(SETUP_TIMEOUT)
        cls.influx_client = InfluxDBClient(
            STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD
        )
        cls.backend = BackendHandler(BACKEND_HOST, BACKEND_PORT)

    @classmethod
    def teardown_class(cls):
        """Tear-down back-end and close file handlers."""
        shutdown_backend(cls.subprocess)
        cls.error_file.close()
        cls.output_file.close()
