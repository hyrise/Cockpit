"""This module todo."""
from os import fsencode, listdir

from hyrisecockpit.database_manager.table_names import table_names as tables
from utils.endpoint_benchmark.print_colors import print_green, print_red


class NotExistingWorkloadFolderException(Exception):
    """Exception raised for empty workload folder."""

    def __init__(self, message: str):
        """Initialize a NotExistingWorkloadFolderException."""
        super().__init__(message)


class Replacer:
    """Replace table names."""

    def __init__(self, config):
        """Init replacer."""
        self.path_to_original = config["path_to_original"]
        self.path_to_new = config["path_to_new"]
        self.workload = config["workload"]
        self.scale = config["scale"]
        self.replacement_dict = self._build_replacement_dict()

    def _build_replacement_dict(self):
        return {table: f"{table}_{self.workload}_{self.scale}" for table in tables[self.workload]}

    def _get_file_names(self, path):
        return [name.decode("utf-8") for name in listdir(fsencode(path))]

    def _check_if_folder_exists(self):
        folder_names = self._get_file_names(self.path_to_new)
        if f"{self.workload}_{self.scale}" not in folder_names:
            raise NotExistingWorkloadFolderException(
                f"Workload {self.workload} directory is empty"
            )

    def _basic_renaming(self, queries, old_table_name, new_table_name):
        """Baisc renaming for TPCH and JOB."""
        queries = queries.replace(f" {old_table_name},", f" {new_table_name},")
        queries = queries.replace(f" {old_table_name}\n", f" {new_table_name}\n ")
        queries = queries.replace(f" {old_table_name} ", f" {new_table_name} ")
        return queries

    def _tpcds_specific_renaming(self, queries, old_table_name, new_table_name):
        """Specific renaming for TPCDS."""
        queries = queries.replace(f" {old_table_name}.", f" {new_table_name}.")
        queries = queries.replace(f"({old_table_name}.", f"({new_table_name}.")
        queries = queries.replace(f"{old_table_name})", f"{new_table_name})")
        queries = queries.replace(f"\n{old_table_name},", f"\n{new_table_name},")
        queries = queries.replace(f"\n{old_table_name}\n", f"\n{new_table_name}\n")
        queries = queries.replace(f"\n{old_table_name} ", f"\n{new_table_name} ")
        queries = queries.replace(f"\t{old_table_name},", f"\t{new_table_name},")
        queries = queries.replace(f"\t{old_table_name}\n", f"\t{new_table_name}\n")
        queries = queries.replace(f"\t{old_table_name} ", f"\t{new_table_name} ")
        queries = queries.replace(f",{old_table_name}", f",{new_table_name}")
        queries = queries.replace(f"AS {new_table_name}", f"AS {old_table_name}")
        return queries

    def replace(self, file_names):
        """Replace table names."""
        for file_name in file_names:
            with open(
                f"{self.path_to_original}/{self.workload}_{self.scale}/{file_name}", "r"
            ) as f_read:
                queries = f_read.read()

            for old_table_name, new_table_name in self.replacement_dict.items():
                if self.workload == "tpcds":
                    basic_renamed_queries = self._basic_renaming(
                        queries, old_table_name, new_table_name
                    )
                    queries = self._tpcds_specific_renaming(
                        basic_renamed_queries, old_table_name, new_table_name
                    )
                else:
                    queries = self._basic_renaming(
                        queries, old_table_name, new_table_name
                    )

            with open(
                f"{self.path_to_new}/{self.workload}_{self.scale}/{file_name}", "w"
            ) as f_write:
                f_write.write(queries)
                print_green(f"{file_name} " + "\N{check mark}")

    def start(self):
        """Start replacing of table names."""
        try:
            self._check_if_folder_exists()
        except BaseException:
            return

        file_names = self._get_file_names(
            f"{self.path_to_original}/{self.workload}_{self.scale}"
        )

        if self.path_to_original != self.path_to_new:
            self.replace(file_names)
        else:
            print_red(
                "Destination and source are the same. Files will be irrevocable overwritten.\n"
            )
            answer = input("Do you want to continue? [Y/N]  ").upper()  # nosec
            if answer == "Y":
                self.replace(file_names)
