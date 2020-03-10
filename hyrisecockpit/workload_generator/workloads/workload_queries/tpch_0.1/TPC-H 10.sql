SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-02-01'
		AND O_ORDERDATE < '1993-05-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-06-01'
		AND O_ORDERDATE < '1994-09-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-05-01'
		AND O_ORDERDATE < '1993-08-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-07-01'
		AND O_ORDERDATE < '1994-10-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-05-01'
		AND O_ORDERDATE < '1993-08-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-04-01'
		AND O_ORDERDATE < '1993-07-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-12-01'
		AND O_ORDERDATE < '1995-03-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-05-01'
		AND O_ORDERDATE < '1994-08-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-07-01'
		AND O_ORDERDATE < '1994-10-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-02-01'
		AND O_ORDERDATE < '1993-05-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-08-01'
		AND O_ORDERDATE < '1994-11-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-03-01'
		AND O_ORDERDATE < '1994-06-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-07-01'
		AND O_ORDERDATE < '1993-10-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-06-01'
		AND O_ORDERDATE < '1994-09-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-07-01'
		AND O_ORDERDATE < '1994-10-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-01-01'
		AND O_ORDERDATE < '1993-04-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-05-01'
		AND O_ORDERDATE < '1994-08-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-07-01'
		AND O_ORDERDATE < '1994-10-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-03-01'
		AND O_ORDERDATE < '1993-06-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-02-01'
		AND O_ORDERDATE < '1993-05-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-09-01'
		AND O_ORDERDATE < '1993-12-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-01-01'
		AND O_ORDERDATE < '1994-04-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-02-01'
		AND O_ORDERDATE < '1993-05-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-07-01'
		AND O_ORDERDATE < '1993-10-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-12-01'
		AND O_ORDERDATE < '1995-03-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-03-01'
		AND O_ORDERDATE < '1994-06-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-01-01'
		AND O_ORDERDATE < '1994-04-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-02-01'
		AND O_ORDERDATE < '1993-05-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-05-01'
		AND O_ORDERDATE < '1994-08-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-02-01'
		AND O_ORDERDATE < '1994-05-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-06-01'
		AND O_ORDERDATE < '1993-09-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-06-01'
		AND O_ORDERDATE < '1994-09-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-11-01'
		AND O_ORDERDATE < '1994-02-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1994-08-01'
		AND O_ORDERDATE < '1994-11-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;

---

SELECT C_CUSTKEY, C_NAME, SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS REVENUE, C_ACCTBAL, N_NAME, C_ADDRESS,
	C_PHONE, C_COMMENT
FROM CUSTOMER, ORDERS, LINEITEM, NATION
WHERE C_CUSTKEY = O_CUSTKEY
		AND L_ORDERKEY = O_ORDERKEY
		AND O_ORDERDATE >= '1993-05-01'
		AND O_ORDERDATE < '1993-08-01'
		AND L_RETURNFLAG = 'R'
		AND C_NATIONKEY = N_NATIONKEY
GROUP BY C_CUSTKEY, C_NAME, C_ACCTBAL, C_PHONE, N_NAME, C_ADDRESS, C_COMMENT
ORDER BY REVENUE DESC
LIMIT 20;
