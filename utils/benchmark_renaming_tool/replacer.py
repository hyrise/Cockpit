"""This module todo."""
import re
from os import fsencode, listdir

from utils.benchmark_renaming_tool.table_names import table_names as tables
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
                f"Workload {self.workload} directory is empty"
            )

    def replace(self, pattern, file_names):
        """Replace table names."""
        for file_name in file_names:
            with open(
                f"{self.path_to_original}/{self.workload}_{self.scale}/{file_name}", "r"
            ) as f_read:
                row_queries = f_read.read()

            new_queries = pattern.sub(
                lambda m: self.replacement_dict[m.group(0)], row_queries
            )
            with open(
                f"{self.path_to_new}/{self.workload}_{self.scale}/{file_name}", "w"
            ) as f_write:
                f_write.write(new_queries)
                print_green(f"{file_name} " + "\N{check mark}")

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

        if self.path_to_original != self.path_to_new:
            self.replace(pattern, file_names)
        else:
            print_red(
                "Destination and source are the same. Files will be irrevocable overwritten.\n"
            )
            answer = input("Do you want to continue? [Y/N]  ").upper()  # nosec
            if answer == "Y":
                self.replace(pattern, file_names)
