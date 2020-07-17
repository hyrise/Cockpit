"""This job delete tables."""
from multiprocessing import Value
from typing import Dict, List

from hyrisecockpit.database_manager.job.execute_queries_parallel import (
    execute_queries_parallel,
)
from hyrisecockpit.database_manager.job.get_loaded_tables import get_loaded_tables


def delete_tables(
    database_blocked: Value,
    workload_type: str,
    scalefactor: float,
    connection_factory,
    workload_drivers,
) -> None:
    """Delete tables."""
    delete_queries: Dict = workload_drivers[workload_type].get_delete_queries(
        scalefactor
    )
    table_names = list(delete_queries.keys())
    loaded_tables: List[str] = get_loaded_tables(table_names, connection_factory)
    queries = [delete_queries[table] for table in loaded_tables]
    print("Delete queries")
    print(queries)

    execute_queries_parallel(queries, connection_factory)

    database_blocked.value = False
