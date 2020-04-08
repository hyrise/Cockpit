
# Benchmark Renaming Tool 

## Description 

This command-line tool is an easy and fast way to rename workload tables. The idea is to attach the workload name and the scaling factor to the table name in order to prevent problems because of overlapping table names in different workloads.

## Basic Usage


Please use this tool at the top level `Cockpit/`

```python -m utils.benchmark_renaming_tool.rename_tables -w tpch -s 1```

If you want to use a scale of 0.1 please define the argument as 0_1. 

```
Replace tpch tables to scale 1

Destination and source are the same. Files will be irrevocable overwritten.

Do you want to continue? [Y/N] 

21.sql ✓
09.sql ✓
08.sql ✓
20.sql ✓
22.sql ✓
18.sql ✓
19.sql ✓
14.sql ✓
15.sql ✓
01.sql ✓
17.sql ✓
03.sql ✓
02.sql ✓
16.sql ✓
12.sql ✓
06.sql ✓
07.sql ✓
13.sql ✓
05.sql ✓
11.sql ✓
10.sql ✓
04.sql ✓

All done 😁
```
It is also possible to set a path to the source files and to the new destination.

```python -m utils.benchmark_renaming_tool.rename_tables -w tpch -s 1 --source /foo --destination /world```

You need to create a benchmark folder at the destination (in this case tpch with scale 1):

```cd /world && mkdir tpch_1 ```

All the files at the source will be unchanged.

## Command Line Options

```
optional arguments:
  -h, --help            show this help message and exit
  --workload [], -w []  workload to rename queries. Allowed values are tpch, tpcds, job (default: None)
  --scale [], -s []     scaling factor to rename queries. Allowed values are {"tpch": ["0.1", "1"], "tpcds": ["1"], "job": ["1"]} (default: None)
  --sourc [], -sc []    source path from orginal query files (default:
                        /foo/Cockpit/hyrisecockpit/workload_generator/workloads/workload_queries)
  --destination [], -d []
                        destination path for the renamed query files. (default:
                        /foo/Cockpit/hyrisecockpit/workload_generator/workloads/workload_queries)
```

## Add a new benchmark to the tool 

First of all please add the tablenames to `table_names.py`.
Secondly, add the new workload to `utils.benchmark_renaming_tool.rename_argument_parser-ArgumentParser.__init__`:

```python 
self._workloads = ["tpch", "tpcds", "job", "your_new_benchmark"]
self._scale = {"tpch": ["0_1", "1"], "tpcds": ["1"], "job": ["1"], "your_new_benchmark": ["42", "1"]}
```
