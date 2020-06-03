SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 49
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 45
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 49
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 46
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 21
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 20
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 28
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 31
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 43
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 4
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 40
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 31
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 16
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 46
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 9
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 23
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 9
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 26
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 34
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 42
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 9
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 6
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 34
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 8
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 30
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 10
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 5
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 7
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 48
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 28
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 24
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 11
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 31
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 13
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 9
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 20
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 38
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 42
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 8
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 48
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 40
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 8
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 15
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 43
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 16
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 4
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 23
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 46
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 41
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 31
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 12
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 48
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 27
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 23
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 49
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 19
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 3
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 50
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 41
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 16
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 21
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 50
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 46
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 26
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 46
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 16
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 17
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 13
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 10
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 39
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 10
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 17
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 41
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 13
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 13
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 15
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 43
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 6
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 1
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 25
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 7
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 32
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 35
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 9
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 20
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 40
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 24
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 30
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 49
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 21
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'EUROPE'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'EUROPE')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 48
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 47
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 17
		AND p_type like '%NICKEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 24
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 23
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 21
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AMERICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AMERICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 38
		AND p_type like '%TIN'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'AFRICA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'AFRICA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 19
		AND p_type like '%STEEL'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'MIDDLE EAST'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'MIDDLE EAST')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 1
		AND p_type like '%BRASS'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;

---

SELECT s_acctbal, s_name, n_name, p_partkey, p_mfgr, s_address, s_phone, s_comment
FROM part_tpch_1, supplier_tpch_1, partsupp_tpch_1, nation_tpch_1, region_tpch_1
 WHERE p_partkey = ps_partkey
		AND s_suppkey = ps_suppkey
		AND p_size = 15
		AND p_type like '%COPPER'
		AND s_nationkey = n_nationkey
		AND n_regionkey = r_regionkey
		AND r_name = 'ASIA'
		AND ps_supplycost =
				(SELECT min(ps_supplycost)
					FROM partsupp_tpch_1, supplier_tpch_1, nation_tpch_1, region_tpch_1
 					WHERE p_partkey = ps_partkey
							AND s_suppkey = ps_suppkey
							AND s_nationkey = n_nationkey
							AND n_regionkey = r_regionkey
							AND r_name = 'ASIA')
ORDER BY s_acctbal DESC, n_name, s_name, p_partkey
LIMIT 100;
