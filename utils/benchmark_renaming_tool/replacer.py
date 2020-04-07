"""This module todo."""
import re
from os import fsencode, listdir

from table_names import table_names as tables
from utils.endpoint_benchmark.print_colors import print_green, print_yellow


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
        rep = {}
        for table in tables[self.workload]:
            rep[table] = f"{table}_{self.workload}_{self.scale}"
        return rep

    def _get_file_names(self, path):
        return [name.decode("utf-8") for name in listdir(fsencode(path))]

    def _check_if_folder_exists(self):
        folder_names = self._get_file_names(self.path_to_new)
        if f"{self.workload}_{self.scale}" not in folder_names:
            raise NotExistingWorkloadFolderException(
                f"Workload {workload} directory is empty"
            )

    def start(self):
        """Start replacing of table names."""
        try:
            self._check_if_folder_exists()
        except BaseException:
            return

        pattern = re.compile("|".join(self.replacement_dict.keys()))

        file_names = self._get_file_names(
            f"{self.path_to_original}/{self.workload}_{self.scale}"
        )

        for file_name in file_names:

            with open(
                f"{self.path_to_original}/{self.workload}_{self.scale}/{file_name}", "r"
            ) as f_read:
                with open(
                    f"{self.path_to_new}/{self.workload}_{self.scale}/{file_name}", "w"
                ) as f_write:
                    row_queries = f_read.read()
                    new_queries = pattern.sub(
                        lambda m: self.replacement_dict[m.group(0)], row_queries
                    )
                    f_write.write(new_queries)
                    print_green(f"{file_name} " + "\N{check mark}")


if __name__ == "__main__":

    workloads = [("tpch", 1,), ("tpch", 0.1,), ("tpcds", 1,)]

    for workload in workloads:
        config = {
            "path_to_original": "",
            "path_to_new": "",
            "workload": workload[0],
            "scale": workload[1],
        }
        print_yellow(f"\nReplace {workload[0]} tables to scale {workload[1]} \n")
        Replacer(config).start()  # type: ignore

    print("\nAll done" + " \N{grinning face with smiling eyes}\n")
