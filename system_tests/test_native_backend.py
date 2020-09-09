"""Module to test backend running in docker."""
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
SETUP_TIMEOUT = int(SETUP_TIMEOUT)
TestSystem.__test__ = False  # type: ignore


def start_backend():
    """Start cockpit natively."""
    return Popen(["cockpit", "--backend"])  # nosec


def shutdown_backend(subprocess):
    """Stop cockpit."""
    subprocess.send_signal(SIGINT)  # nosec
    subprocess.wait(timeout=TIME_OUT)


class TestNative(TestSystem):
    """Test for the backend running natively."""

    __test__ = True

    @classmethod
    def setup_class(cls):
        """Start backend."""
        cls.subprocess = start_backend()
        sleep(SETUP_TIMEOUT)
        cls.influx_client = InfluxDBClient(
            STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD
        )
        cls.backend = BackendHandler(BACKEND_HOST, BACKEND_PORT)

    @classmethod
    def teardown_class(cls):
        """Run after every test."""
        shutdown_backend(cls.subprocess)
