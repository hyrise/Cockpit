### Overview

The package is provided for the execution of system tests. 

System tests represent real scenarios, where components interact with each other. Examples could be the initialization of the DatabaseManage adding a database, or execution of the workload.

During the execution of the system tests, no mocks are used. Tests use real Hyrise instances and an Influx database for logging as well. The hosts of the Hyrise database and Influx instance, which are used in the tests, can be specified in the `.env` file.

Default Hyrise instance:

	vm-momentum.eaalab.hpi.uni-potsdam.de:5432

Default Influx instance:

	localhost:8086

### Testing

Execute system tests by calling 
```
pytest test_system.py
```
Execution should take ~30 sec.



### Behaviour

Before each test case, all 3 components (Backend, Database Manager, WorkloadGenerator) are started.

At the end of each test, the `stderr` output of every component is checked and all  3 components are shutdown.  

If any response time to the Backend exceeds 1 sec, a TimeOutException is thrown and a test case is considered as a failure.


### Recomendations

When executing a system test, please make sure, no one else is using the Hyrise instance, used for testing, as it can affect request time/lead to inconsistency. In the best case, run Hyrise instance on the same machine as the backend, or at least in the same network, as using VPN may cause weird behavior of `requests` python package (TIMEOUT by HTTP requests).
