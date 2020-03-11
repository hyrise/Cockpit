# Debug Script

## Descripton 

This script is an easy and fast way to add databases, loading tables and executing benchmarks. 
Moreover, it displays the throughput and queue length. It complements great Postman. 


## Setup

First of all you need to set the Backand-url (The one where flask is running on). For example: 

```js
let MONITOR_URL = http://127.0.0.1:8000
```

If you wanna use the handy buttons to add a database to the backend you need to add the necessary information to the 
eventhandler. For example:

```js
document.getElementById("add_db_1").addEventListener("click", () => {
    let db = {
        "number_workers" : 10,
        "id": "hyrise_1",
        "user": "serviceuser",
        "password": "serviceuser",
        "host": "http://127.0.0.1:8000",
        "port": "1234",
        "dbname": "hyrise"
    }
    registerNewDatabase(db)       
});
```
