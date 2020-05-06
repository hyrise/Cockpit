"""Module to get commandline arguments and start replacer."""
from utils.benchmark_renaming_tool.rename_argument_parser import ArgumentParser
from utils.benchmark_renaming_tool.replacer import Replacer
from utils.endpoint_benchmark.print_colors import print_yellow

if __name__ == "__main__":
    argp = ArgumentParser()
    config = argp.get_configuration()
    if not config:
        exit()

    print_yellow(f"\nReplace {config['workload']} tables to scale {config['scale']} \n")
    Replacer(config).start()

    print("\nAll done" + " \N{grinning face with smiling eyes}\n")
