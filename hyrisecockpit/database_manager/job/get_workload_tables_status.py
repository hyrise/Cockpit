"""Job to get workload tables status."""
from typing import List

from .get_loaded_tables_in_database import (
    get_loaded_tables_in_database as get_loaded_tables_in_database_job,
)


def workload_tables_status(tables_in_database, workload_drivers) -> List:
    """Get list of all benchmarks which are completely loaded."""
    workload_tables_status = []
    for workload_type, driver in workload_drivers.items():
        for scale_factor in driver.get_scalefactors():
            loaded_tables = []
            missing_tables = []
            workload_tables = driver.get_table_names(scale_factor)
            loaded = True
            for table_name, database_representation in workload_tables.items():
                if database_representation not in tables_in_database:
                    loaded = False
                    missing_tables.append(table_name)
                else:
                    loaded_tables.append(table_name)
            table = {
                "workload_type": workload_type,
                "scale_factor": scale_factor,
                "loaded_tables": loaded_tables,
                "missing_tables": missing_tables,
                "completely_loaded": loaded,
                "database_representation": workload_tables,
            }
            workload_tables_status.append(table)
    return workload_tables_status


def get_workload_tables_status(connection_factory, workload_drivers) -> List:
    """Get loaded benchmark data."""
    tables_in_database: List = get_loaded_tables_in_database_job(connection_factory)
    return workload_tables_status(tables_in_database, workload_drivers)
