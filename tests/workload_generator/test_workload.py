"""Tests for the workload_generator module's workload."""

from random import choice, choices, getstate, setstate, uniform
from typing import Dict, List

from pytest import fixture

from hyrisecockpit.workload_generator.workload import Query, Workload


@fixture(params=[0, 1, 100])
def frequency(request) -> int:
    """Get a frequency."""
    return request.param


@fixture(
    params=[
        {"query1": ["SELECT 0;", "SELECT 1;"]},
        {"query1": ["SELECT 0;", "SELECT 1;"], "query 2": ["DROP TABLE mytable;"]},
    ]
)
def queries(request) -> Dict[str, List[str]]:
    """Get a query dictionary."""
    return request.param


@fixture(params=[0.0, 1.0, (0.0, 100.0)])
def weights(request, queries: Dict[str, List[str]]) -> Dict[str, float]:
    """Get a weights distribution."""
    if isinstance(request.param, float):
        return {key: request.param for key in queries.keys()}
    else:
        return {key: uniform(*request.param) for key in queries.keys()}


@fixture
def workload(frequency: int, queries: Dict[str, List[str]]) -> Workload:
    """Get a Workload."""
    return Workload(frequency, queries)


class TestWorkload:
    """Test for workload class."""

    def test_creates(self, workload: Workload):
        """Test whether it can be created."""
        assert workload

    def test_initializes(
        self, workload: Workload, frequency: int, queries: Dict[str, List[str]]
    ):
        """Test whether initial attributes are set correctly."""
        assert workload.frequency == frequency
        assert workload._queries == queries
        assert workload.weights == {key: 1.0 for key in queries.keys()}

    def test_sets_weights(self, workload: Workload, weights: Dict[str, float]):
        """Test whether weights can be set."""
        workload.weights = weights
        assert workload.weights == weights

    def test_does_not_set_weights_with_incompatible_keys(self, workload: Workload):
        """Test whether weights are set with incompatible keys."""
        previous_weights = workload.weights
        new_weights = {key + "f": value for key, value in previous_weights.items()}
        workload.weights = new_weights
        assert previous_weights == workload.weights != new_weights

    def test_sets_negative_weights_to_0(self, workload: Workload):
        """Test whether negative weights are set to 0."""
        workload.weights = {
            key: -(i + 1) for i, key in enumerate(workload.weights.keys())
        }
        for value in workload.weights.values():
            assert value >= 0

    def test_deletes_weights(self, workload: Workload, weights: Dict[str, float]):
        """Test whether weights a reset with delete."""
        previous_weights = workload.weights
        workload.weights = weights
        del workload.weights
        assert workload.weights == previous_weights

    def test_gets_workload(
        self, workload: Workload, frequency: int, queries: Dict[str, List[str]]
    ):
        """Test whether a workload can be generated."""
        state = getstate()
        expected_workload = [
            Query(query=choice(queries[query_type]), args=None, query_type=query_type)
            for query_type in choices(population=list(queries.keys()), k=frequency)
        ]
        setstate(state)
        received_workload = workload.get()
        assert received_workload == expected_workload

    def test_gets_workload_with_weights(
        self,
        workload: Workload,
        frequency: int,
        queries: Dict[str, List[str]],
        weights: Dict[str, float],
    ):
        """Test whether a workload can be generated with weights."""
        workload.weights = weights
        state = getstate()
        expected_workload = [
            Query(query=choice(queries[query_type]), args=None, query_type=query_type)
            for query_type in choices(
                population=list(queries.keys()),
                weights=list(weights.values()),
                k=frequency,
            )
        ]
        setstate(state)
        received_workload = workload.get()
        assert received_workload == expected_workload
