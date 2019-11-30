"""Analyzers measure databases.

An Analyzer is controlled by a database driver.
"""
from abc import ABC, abstractmethod


class Analyzer(ABC):
    """An Analyzer takes measurements of a database and stores them."""

    def __init__(self, database, storage):
        """Initialize with a database object and a storage object."""
        pass

    @abstractmethod
    def start(self, interval=1):
        """Start the analyzer."""
        pass

    @abstractmethod
    def stop(self):
        """Stop the analyzer."""
        pass


class ThroughputAnalyzer(ABC, Analyzer):
    """A ThroughputAnalyzer takes a workload and measures the throughput."""

    @abstractmethod
    def __init__(self, database, storage, workload, workers):
        """Initialize with a workload and count of workers."""
        pass


class StorageAnalyzer(ABC, Analyzer):
    """A StorageAnalyzer analyzes storage data."""

    pass
