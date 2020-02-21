
# Benchmark Tool 

## Description 

This command-line tool is an easy and fast way to benchmark the endpoints of the backend.  The main idea is to use plug-ins that are defining the benchmark.  The default Plugin for the moment is the `wrk` benchmark. We can define any time new Plugins (custom benchmarks) in `plugins.py` and run them with the tool. 

## Basic Usage

```python benchmark.py -ep storage -t 20 -p wrk```

This runs the wrk benchmark for 20 seconds on the storage endpoint.

```
......................................................................
Run WrkPlugin:

Run workload tpch_0.1:

Running 20s test @ http://0.0.0.0:8000/monitor/storage
  1 threads and 1 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     0.00us    0.00us   0.00us    -nan%
    Req/Sec     0.00      0.00     0.00    100.00%
  8 requests in 20.05s, 660.53KB read
  Socket errors: connect 0, read 0, write 0, timeout 8
Requests/sec:      0.40
Transfer/sec:     32.95KB
```

If we are running: 

```
python benchmark.py
```

All default values are used. That means we are running the wrk benchmark on two databases, on all endpoints of the backend (for one second), while executing the `tpch_0.1` workload. 

The command `python benchmark.py --show enpoints` will display all available endpoints: 

```
Endpoints:
-> endpoints_monitor: ['throughput', 'latency', 'queue_length', 'failed_tasks', 'system', 'chunks', 'storage', 'krueger_data']
-> endpoints_control: ['database', 'data']
```

The command `python benchmark.py --show all` will display all information needed: 

```
Endpoints:
-> endpoints_monitor: ['throughput', 'latency', 'queue_length', 'failed_tasks', 'system', 'chunks', 'storage', 'krueger_data']
-> endpoints_control: ['database', 'data']
Databases: ['db1', 'db2']
Workloads: ['tpch_0.1', 'tpch_1', 'tpcds_1', 'job']
```

## Command Line Options

```
  -h, --help            show this help message and exit
  --endpoint           [END_POINTS ...], -ep [END_POINTS ...]
                        Endpoints to run benchmark on. Default value is all.
  --show {endpoints,databases,workloads,all} [{endpoints,databases,workloads,all} ...]
                        Show available endpoints, workloads, databases. Default shows all categories.
  --database            [DATABASES ...], -db [DATABASES ...]
                        Databases to run benchmark on. Default value is all.
  --workload            [WORKLOADS ...], -w [WORKLOADS ...]
                        Workload to run on databases. Default value is tpch_0.1.
  --time, -t            Time to benchmark endpoints in seconds. Default value is 1.
  --run, -r             Number of runs.
  --url, -u             Backend url

  --worker_number, -wn  Number of workers for databases.
  --workload_frequence , -wf Frequency of workload.
  --plugin [PLUGINS ...], -p [PLUGINS ...]
                        Benchmark plugins. Default is wrk
```

## Setup

### .env
Please add in your `.env` the access values for your two default databases `db1` and `db2`.

```
# Set this to the databases you want to run the endpoint benchmark with
DB1_HOST="*" 
DB1_PORT="*" 
DB1_PASSWORD="*"
DB1_TYPE="*"

DB2_HOST="*" 
DB2_PORT="*" 
DB2_PASSWORD="*"
DB2_TYPE="*"
```

### WRK

To be able to use the wrk plugin you muss install the wrk benchmark tool.

#### On Linux 

https://github.com/wg/wrk/wiki/Installing-wrk-on-Linux

#### On Mac 

https://github.com/wg/wrk/wiki/Installing-wrk-on-OS-X

## Add a Plugin 

If you want to add your own plugin you can do so by creating a class for the plugin-in in `plugins.py`. You just need to implement the `run_benchmark` function. The plug-in is getting a configuration in the form of a dictionary.

```python
class YourPlugin:

    def __init__(self, configuration):
        self._configuration = configuration
        self._backend_url = configuration["backend_url"]
        
        
    #...
    
    def run_benchmark(self):
        # do some stuff
```

A configuration can look as following : 

```python
{
  'end_points': {
    'endpoints_monitor': ['throughput', 'latency', 'queue_length', 'failed_tasks', 'system', 'chunks', 'storage', 'krueger_data'],
    'endpoints_control': ['database', 'data']
  },
  'databases': ['db1', 'db2'],
  'workloads': ['tpch_0.1'],
  'time': 1,
  'runs': 1,
  'backend_url': 'http://0.0.0.0:8000',
  'number_workers': 10,
  'workload_frequence': 200,
  'plugins': ['wrk']
}
```
Please add the name of the plug-in in `DevTools.endpoint_benchmark.argument_parser.ArgumentValidation.__init__` to 

```python
self._plugins = ["wrk", "yourPlugin"]
```
So you can use your plugin in the following way:

```
python benchmark.py --plugin yourPlugin
```

Moreover you need to add our plugin in `DevTools.endpoint_benchmark.plugins.PluginManager` like the `wrk` plug-in:

```python
    def __init__(self):
        """Initialize PluginManager."""
        self.plugins = {"wrk": self._get_wrk_plugin}

    def _get_wrk_plugin(self, configuration):
        return WrkPlugin(configuration)
```
