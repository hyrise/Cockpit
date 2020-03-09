# System tests

### Overview

Package provided for execution of system tests. 

System tests represent real scenarios, where components interact with each other. Examples could be initialization of the `DatabaseManage` adding a database, or executing of the workload.

During the execution of the system tests, no mocks are used. Tests use real Hyrise instances and an Influx database for logging as well. The hosts of the Hyrise databases and Influx instance, which are used in the tests, can be specified in the `.env` file.

Default Hyrise instances:

​	*vm-york.eaalab.hpi.uni-potsdam.de:5432*
	*vm-citadelle.eaalab.hpi.uni-potsdam.de:5432*

Default Influx instance:

​	*localhost:8086*



### Testing

Execute system tests by calling 

```
pytest test_system.py
```

Execution should take ~30 sec.



### Behaviour

Before each test case, all 3 components (`Backend`, `Database Manager`, `WorkloadGenerator`) are started.

In the end of each tests `stderr` output of every component is checked. 

After the test case, all 3 components are shutdown.  

If any request to the `Backend` exceed 1 sec, a TimeOutException is thrown and a the test case is considered as a failure.