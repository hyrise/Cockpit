"""This job loads tables."""
from multiprocessing import Value
from typing import Dict, List

from hyrisecockpit.database_manager.job.execute_queries_parallel import (
    execute_queries_parallel,
)
from hyrisecockpit.database_manager.job.get_loaded_tables import get_loaded_tables


def load_tables(
    database_blocked: Value,
    workload_type: str,
    scalefactor: float,
    connection_factory,
    workload_drivers,
) -> None:
    """Load tables."""
    load_queries: Dict = workload_drivers[workload_type].get_load_queries(scalefactor)
    table_names = list(load_queries.keys())
    loaded_tables: List[str] = get_loaded_tables(table_names, connection_factory)
    tables_to_load: List[str] = [
        table for table in table_names if table not in set(loaded_tables)
    ]
    queries = [load_queries[table] for table in tables_to_load]

    execute_queries_parallel(queries, connection_factory)

    database_blocked.value = False
