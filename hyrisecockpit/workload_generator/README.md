# Workload Generator

The Workload Generator is a module for generating artificial workloads.

## Running locally

If you have a local setup as specified in the projects [README](../../README.md), you can run the following commands to run the Workload Generator:

```bash
pipenv shell
cockpit-generator
```

## Generate Workload

To generate a Workload you can simply send the following json to the backend: 

```json
{
	"header": {
		"message": "workload"
	},
	"body": {
		"type": "mixed",
		"factor": 20000
	}
}

```

The type can be: 

* mixed
* no-ops

The factor sets the number of querys. 
