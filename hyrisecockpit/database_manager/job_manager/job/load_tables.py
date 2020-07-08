"""This job loads tables."""
from multiprocessing import Value
from typing import List, Optional, Tuple, Union

from hyrisecockpit.database_manager.job.execute_queries_parallel import (
    execute_queries_parallel,
)
from hyrisecockpit.database_manager.job.get_loaded_tables import (
    get_loaded_tables_for_scale_factor,
)
from hyrisecockpit.database_manager.table_names import table_names as _table_names


def _generate_table_loading_queries(
    tables: List[str], benchmark: str, scale_factor: str
) -> List[Tuple[str, Tuple[Tuple[Union[str, int], Optional[str]], ...]]]:
    """Generate queries in tuple form that load tables."""
    return [
        (
            "COPY %s_%s_%s FROM '/usr/local/hyrise/cached_tables/%s_%s/%s.bin';",
            (
                (table, "as_is"),
                (benchmark, "as_is"),
                (scale_factor, "as_is"),
                (benchmark, "as_is"),
                (scale_factor, "as_is"),
                (table, "as_is"),
            ),
        )
        for table in tables
    ]


def load_tables(
    database_blocked: Value,
    folder_name: str,
    connection_factory,
    background_job_manager,
) -> None:
    """Load tables."""
    benchmark, scale_factor = folder_name.split("_", maxsplit=1)
    table_names: List[str] = _table_names[benchmark]
    loaded_tables: List[str] = get_loaded_tables_for_scale_factor(
        table_names, benchmark, scale_factor, connection_factory
    )
    tables_to_load: List[str] = [
        table for table in table_names if table not in set(loaded_tables)
    ]
    tables_loading_queries = _generate_table_loading_queries(
        tables_to_load, benchmark, scale_factor
    )
    background_job_manager.pause()
    execute_queries_parallel(tables_loading_queries, connection_factory)
    background_job_manager.resume()
    database_blocked.value = False
