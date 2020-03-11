SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#34'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 10
								AND l_quantity <= 10 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#22'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 16
											AND l_quantity <= 16 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#12'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 26
											AND l_quantity <= 26 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#51'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 7
								AND l_quantity <= 7 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#52'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 17
											AND l_quantity <= 17 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#55'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 25
											AND l_quantity <= 25 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#52'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 5
								AND l_quantity <= 5 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#35'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 13
											AND l_quantity <= 13 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#54'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 26
											AND l_quantity <= 26 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#35'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 5
								AND l_quantity <= 5 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#33'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 12
											AND l_quantity <= 12 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#55'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 20
											AND l_quantity <= 20 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#11'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 7
								AND l_quantity <= 7 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#21'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 13
											AND l_quantity <= 13 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#45'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 28
											AND l_quantity <= 28 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#53'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 7
								AND l_quantity <= 7 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#55'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 18
											AND l_quantity <= 18 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#54'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 30
											AND l_quantity <= 30 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#51'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 10
								AND l_quantity <= 10 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#33'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 17
											AND l_quantity <= 17 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#14'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 27
											AND l_quantity <= 27 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#25'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 9
								AND l_quantity <= 9 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#55'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 18
											AND l_quantity <= 18 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#12'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 20
											AND l_quantity <= 20 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#33'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 6
								AND l_quantity <= 6 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#41'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 11
											AND l_quantity <= 11 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#31'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 26
											AND l_quantity <= 26 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#43'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 4
								AND l_quantity <= 4 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#14'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 18
											AND l_quantity <= 18 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#22'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 25
											AND l_quantity <= 25 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#33'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 7
								AND l_quantity <= 7 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#31'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 12
											AND l_quantity <= 12 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#55'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 22
											AND l_quantity <= 22 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#35'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 10
								AND l_quantity <= 10 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#33'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 19
											AND l_quantity <= 19 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#14'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 26
											AND l_quantity <= 26 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#31'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 8
								AND l_quantity <= 8 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#32'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 13
											AND l_quantity <= 13 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#42'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 25
											AND l_quantity <= 25 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#45'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 1
								AND l_quantity <= 1 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#13'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 19
											AND l_quantity <= 19 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#31'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 26
											AND l_quantity <= 26 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#22'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 8
								AND l_quantity <= 8 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#23'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 17
											AND l_quantity <= 17 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#42'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 23
											AND l_quantity <= 23 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#23'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 4
								AND l_quantity <= 4 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#54'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 15
											AND l_quantity <= 15 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#35'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 22
											AND l_quantity <= 22 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#55'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 7
								AND l_quantity <= 7 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#53'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 20
											AND l_quantity <= 20 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#12'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 22
											AND l_quantity <= 22 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#43'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 10
								AND l_quantity <= 10 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#11'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 17
											AND l_quantity <= 17 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#42'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 28
											AND l_quantity <= 28 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#22'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 3
								AND l_quantity <= 3 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#31'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 17
											AND l_quantity <= 17 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#44'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 22
											AND l_quantity <= 22 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#25'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 6
								AND l_quantity <= 6 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#53'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 12
											AND l_quantity <= 12 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#14'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 28
											AND l_quantity <= 28 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#12'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 8
								AND l_quantity <= 8 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#53'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 13
											AND l_quantity <= 13 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#11'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 26
											AND l_quantity <= 26 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#55'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 2
								AND l_quantity <= 2 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#54'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 11
											AND l_quantity <= 11 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#24'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 29
											AND l_quantity <= 29 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#35'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 9
								AND l_quantity <= 9 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#12'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 19
											AND l_quantity <= 19 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#55'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 28
											AND l_quantity <= 28 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#52'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 3
								AND l_quantity <= 3 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#35'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 11
											AND l_quantity <= 11 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#31'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 27
											AND l_quantity <= 27 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#32'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 6
								AND l_quantity <= 6 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#45'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 18
											AND l_quantity <= 18 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#35'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 20
											AND l_quantity <= 20 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#52'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 2
								AND l_quantity <= 2 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#22'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 20
											AND l_quantity <= 20 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#25'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 28
											AND l_quantity <= 28 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#43'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 1
								AND l_quantity <= 1 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#43'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 17
											AND l_quantity <= 17 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#12'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 27
											AND l_quantity <= 27 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#13'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 1
								AND l_quantity <= 1 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#51'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 19
											AND l_quantity <= 19 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#11'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 20
											AND l_quantity <= 20 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#53'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 9
								AND l_quantity <= 9 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#42'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 10
											AND l_quantity <= 10 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#12'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 27
											AND l_quantity <= 27 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#25'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 3
								AND l_quantity <= 3 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#43'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 14
											AND l_quantity <= 14 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#51'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 29
											AND l_quantity <= 29 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#41'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 9
								AND l_quantity <= 9 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#53'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 20
											AND l_quantity <= 20 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#31'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 21
											AND l_quantity <= 21 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#52'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 2
								AND l_quantity <= 2 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#31'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 13
											AND l_quantity <= 13 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#42'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 22
											AND l_quantity <= 22 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#44'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 2
								AND l_quantity <= 2 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#25'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 14
											AND l_quantity <= 14 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#35'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 24
											AND l_quantity <= 24 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#24'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 4
								AND l_quantity <= 4 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#24'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 19
											AND l_quantity <= 19 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#43'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 23
											AND l_quantity <= 23 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#33'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 4
								AND l_quantity <= 4 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#53'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 13
											AND l_quantity <= 13 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#44'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 26
											AND l_quantity <= 26 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#24'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 3
								AND l_quantity <= 3 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#54'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 13
											AND l_quantity <= 13 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#12'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 29
											AND l_quantity <= 29 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#12'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 6
								AND l_quantity <= 6 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#41'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 10
											AND l_quantity <= 10 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#15'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 20
											AND l_quantity <= 20 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#22'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 2
								AND l_quantity <= 2 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#22'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 12
											AND l_quantity <= 12 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#44'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 22
											AND l_quantity <= 22 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#54'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 2
								AND l_quantity <= 2 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#24'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 19
											AND l_quantity <= 19 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#53'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 21
											AND l_quantity <= 21 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#24'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 4
								AND l_quantity <= 4 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#35'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 15
											AND l_quantity <= 15 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#14'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 20
											AND l_quantity <= 20 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#53'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 2
								AND l_quantity <= 2 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#22'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 14
											AND l_quantity <= 14 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#41'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 30
											AND l_quantity <= 30 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#14'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 3
								AND l_quantity <= 3 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#45'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 20
											AND l_quantity <= 20 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#12'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 25
											AND l_quantity <= 25 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#55'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 5
								AND l_quantity <= 5 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#45'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 20
											AND l_quantity <= 20 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#15'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 22
											AND l_quantity <= 22 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#34'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 9
								AND l_quantity <= 9 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#52'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 20
											AND l_quantity <= 20 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#52'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 30
											AND l_quantity <= 30 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#15'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 5
								AND l_quantity <= 5 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#42'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 17
											AND l_quantity <= 17 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#21'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 27
											AND l_quantity <= 27 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#22'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 8
								AND l_quantity <= 8 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#34'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 17
											AND l_quantity <= 17 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#43'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 24
											AND l_quantity <= 24 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#44'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 5
								AND l_quantity <= 5 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#45'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 18
											AND l_quantity <= 18 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#53'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 25
											AND l_quantity <= 25 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#23'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 5
								AND l_quantity <= 5 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#43'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 16
											AND l_quantity <= 16 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#14'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 26
											AND l_quantity <= 26 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#35'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 8
								AND l_quantity <= 8 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#25'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 11
											AND l_quantity <= 11 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#43'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 25
											AND l_quantity <= 25 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#45'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 6
								AND l_quantity <= 6 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#33'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 19
											AND l_quantity <= 19 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#33'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 23
											AND l_quantity <= 23 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#31'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 9
								AND l_quantity <= 9 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#31'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 15
											AND l_quantity <= 15 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#32'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 30
											AND l_quantity <= 30 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#43'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 1
								AND l_quantity <= 1 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#24'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 12
											AND l_quantity <= 12 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#44'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 30
											AND l_quantity <= 30 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#45'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 7
								AND l_quantity <= 7 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#45'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 20
											AND l_quantity <= 20 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#25'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 23
											AND l_quantity <= 23 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#35'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 10
								AND l_quantity <= 10 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#34'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 20
											AND l_quantity <= 20 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#31'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 23
											AND l_quantity <= 23 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#11'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 8
								AND l_quantity <= 8 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#24'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 17
											AND l_quantity <= 17 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#24'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 21
											AND l_quantity <= 21 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#32'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 6
								AND l_quantity <= 6 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#21'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 16
											AND l_quantity <= 16 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#15'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 21
											AND l_quantity <= 21 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#34'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 1
								AND l_quantity <= 1 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#34'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 14
											AND l_quantity <= 14 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#45'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 20
											AND l_quantity <= 20 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#24'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 7
								AND l_quantity <= 7 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#15'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 17
											AND l_quantity <= 17 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#22'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 27
											AND l_quantity <= 27 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));

---

SELECT SUM(l_extendedprice * (1 - l_discount)) AS revenue
FROM lineitem, part
WHERE ((p_partkey = l_partkey
								AND p_brand = 'Brand#24'
								AND p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
								AND l_quantity >= 9
								AND l_quantity <= 9 + 10
								AND p_size BETWEEN 1 AND 5
								AND l_shipmode IN ('AIR', 'AIR REG')
								AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#44'
											AND p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
											AND l_quantity >= 11
											AND l_quantity <= 11 + 10
											AND p_size BETWEEN 1 AND 10
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON')
							OR (p_partkey = l_partkey
											AND p_brand = 'Brand#23'
											AND p_container IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
											AND l_quantity >= 26
											AND l_quantity <= 26 + 10
											AND p_size BETWEEN 1 AND 15
											AND l_shipmode IN ('AIR', 'AIR REG')
											AND l_shipinstruct = 'DELIVER IN PERSON'));
