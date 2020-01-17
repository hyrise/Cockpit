SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#45'
      AND p_type not like 'PROMO POLISHED%' AND p_size in (40, 47, 39, 25, 12, 24, 6, 46)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#15'
      AND p_type not like 'LARGE PLATED%' AND p_size in (23, 16, 18, 2, 6, 38, 12, 29)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#52'
      AND p_type not like 'LARGE BRUSHED%' AND p_size in (2, 20, 29, 11, 16, 43, 38, 50)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#55'
      AND p_type not like 'PROMO BURNISHED%' AND p_size in (8, 24, 12, 36, 22, 5, 39, 34)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#24'
      AND p_type not like 'PROMO POLISHED%' AND p_size in (35, 37, 12, 22, 50, 26, 41, 15)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#23'
      AND p_type not like 'STANDARD POLISHED%' AND p_size in (12, 22, 42, 34, 10, 2, 8, 28)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#21'
      AND p_type not like 'ECONOMY BURNISHED%' AND p_size in (45, 19, 38, 44, 16, 7, 15, 48)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#23'
      AND p_type not like 'ECONOMY POLISHED%' AND p_size in (1, 27, 35, 34, 11, 44, 8, 43)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#14'
      AND p_type not like 'MEDIUM BRUSHED%' AND p_size in (33, 4, 36, 20, 10, 23, 12, 35)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#43'
      AND p_type not like 'STANDARD PLATED%' AND p_size in (33, 5, 28, 26, 40, 44, 6, 20)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#41'
      AND p_type not like 'PROMO PLATED%' AND p_size in (6, 46, 43, 39, 12, 38, 27, 17)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#21'
      AND p_type not like 'PROMO PLATED%' AND p_size in (41, 23, 47, 7, 20, 14, 24, 21)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#45'
      AND p_type not like 'STANDARD ANODIZED%' AND p_size in (16, 45, 10, 1, 48, 49, 40, 41)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#34'
      AND p_type not like 'ECONOMY PLATED%' AND p_size in (21, 35, 8, 45, 10, 28, 39, 5)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#41'
      AND p_type not like 'STANDARD POLISHED%' AND p_size in (38, 32, 24, 10, 12, 40, 22, 43)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#31'
      AND p_type not like 'MEDIUM BURNISHED%' AND p_size in (35, 49, 21, 38, 32, 25, 10, 18)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#41'
      AND p_type not like 'SMALL POLISHED%' AND p_size in (25, 1, 6, 15, 24, 22, 39, 31)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#15'
      AND p_type not like 'LARGE POLISHED%' AND p_size in (49, 38, 40, 50, 20, 35, 23, 5)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#42'
      AND p_type not like 'SMALL BURNISHED%' AND p_size in (28, 9, 2, 18, 20, 47, 1, 35)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#51'
      AND p_type not like 'MEDIUM ANODIZED%' AND p_size in (46, 11, 6, 8, 9, 31, 37, 33)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#13'
      AND p_type not like 'MEDIUM BRUSHED%' AND p_size in (27, 31, 12, 1, 3, 25, 42, 37)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#52'
      AND p_type not like 'ECONOMY PLATED%' AND p_size in (33, 48, 1, 10, 14, 19, 29, 28)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#45'
      AND p_type not like 'STANDARD PLATED%' AND p_size in (41, 2, 35, 22, 14, 38, 44, 30)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#15'
      AND p_type not like 'SMALL BRUSHED%' AND p_size in (11, 2, 10, 8, 5, 39, 43, 48)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#14'
      AND p_type not like 'STANDARD BURNISHED%' AND p_size in (23, 14, 30, 15, 12, 27, 4, 50)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#25'
      AND p_type not like 'STANDARD ANODIZED%' AND p_size in (10, 6, 22, 35, 16, 28, 48, 41)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#55'
      AND p_type not like 'SMALL BRUSHED%' AND p_size in (2, 36, 37, 25, 27, 28, 12, 49)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#44'
      AND p_type not like 'ECONOMY POLISHED%' AND p_size in (31, 5, 15, 12, 21, 35, 40, 10)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#13'
      AND p_type not like 'LARGE POLISHED%' AND p_size in (43, 47, 22, 27, 4, 49, 48, 50)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#44'
      AND p_type not like 'ECONOMY PLATED%' AND p_size in (34, 24, 41, 22, 36, 28, 26, 45)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#55'
      AND p_type not like 'SMALL ANODIZED%' AND p_size in (21, 20, 2, 40, 22, 37, 41, 16)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#22'
      AND p_type not like 'MEDIUM POLISHED%' AND p_size in (36, 16, 5, 6, 13, 26, 28, 34)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#13'
      AND p_type not like 'STANDARD ANODIZED%' AND p_size in (26, 8, 49, 23, 29, 37, 2, 9)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#41'
      AND p_type not like 'PROMO ANODIZED%' AND p_size in (1, 28, 10, 19, 34, 30, 11, 13)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#12'
      AND p_type not like 'PROMO POLISHED%' AND p_size in (34, 42, 28, 41, 29, 5, 6, 30)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#32'
      AND p_type not like 'LARGE POLISHED%' AND p_size in (4, 50, 43, 36, 24, 37, 13, 48)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#45'
      AND p_type not like 'PROMO BURNISHED%' AND p_size in (33, 10, 28, 3, 25, 43, 24, 2)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#43'
      AND p_type not like 'MEDIUM PLATED%' AND p_size in (39, 30, 5, 50, 1, 36, 13, 29)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#35'
      AND p_type not like 'MEDIUM POLISHED%' AND p_size in (41, 36, 25, 5, 35, 23, 4, 30)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#22'
      AND p_type not like 'LARGE BURNISHED%' AND p_size in (10, 5, 42, 24, 27, 8, 37, 50)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#11'
      AND p_type not like 'ECONOMY POLISHED%' AND p_size in (3, 45, 9, 20, 14, 35, 6, 13)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#31'
      AND p_type not like 'STANDARD BURNISHED%' AND p_size in (32, 6, 10, 2, 36, 1, 39, 46)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#31'
      AND p_type not like 'LARGE BURNISHED%' AND p_size in (40, 2, 17, 3, 1, 8, 42, 29)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#21'
      AND p_type not like 'PROMO ANODIZED%' AND p_size in (49, 13, 5, 29, 8, 50, 7, 18)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#55'
      AND p_type not like 'STANDARD BRUSHED%' AND p_size in (8, 13, 25, 32, 50, 21, 42, 20)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#52'
      AND p_type not like 'SMALL PLATED%' AND p_size in (43, 20, 49, 11, 16, 40, 29, 7)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#11'
      AND p_type not like 'SMALL BRUSHED%' AND p_size in (24, 49, 31, 17, 19, 8, 10, 7)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#24'
      AND p_type not like 'LARGE PLATED%' AND p_size in (10, 23, 31, 5, 44, 25, 15, 6)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#54'
      AND p_type not like 'PROMO PLATED%' AND p_size in (29, 6, 26, 12, 39, 18, 50, 5)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#34'
      AND p_type not like 'ECONOMY ANODIZED%' AND p_size in (35, 42, 34, 20, 6, 3, 11, 41)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#54'
      AND p_type not like 'LARGE ANODIZED%' AND p_size in (1, 36, 37, 31, 30, 11, 3, 39)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#44'
      AND p_type not like 'ECONOMY ANODIZED%' AND p_size in (43, 41, 34, 10, 42, 4, 21, 2)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#43'
      AND p_type not like 'LARGE PLATED%' AND p_size in (50, 12, 11, 1, 3, 43, 22, 8)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#51'
      AND p_type not like 'LARGE POLISHED%' AND p_size in (29, 3, 43, 40, 13, 45, 37, 23)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#43'
      AND p_type not like 'STANDARD POLISHED%' AND p_size in (24, 27, 34, 13, 18, 26, 3, 21)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#42'
      AND p_type not like 'PROMO ANODIZED%' AND p_size in (30, 23, 34, 37, 14, 49, 20, 32)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#55'
      AND p_type not like 'STANDARD POLISHED%' AND p_size in (4, 41, 13, 15, 1, 5, 9, 40)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#34'
      AND p_type not like 'STANDARD BURNISHED%' AND p_size in (40, 14, 3, 35, 24, 8, 2, 6)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#52'
      AND p_type not like 'LARGE BRUSHED%' AND p_size in (40, 4, 23, 18, 7, 48, 50, 12)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#34'
      AND p_type not like 'ECONOMY PLATED%' AND p_size in (31, 42, 32, 2, 19, 21, 3, 27)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#25'
      AND p_type not like 'MEDIUM BURNISHED%' AND p_size in (26, 40, 31, 16, 24, 34, 25, 30)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#54'
      AND p_type not like 'STANDARD POLISHED%' AND p_size in (38, 47, 29, 10, 46, 50, 23, 43)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#32'
      AND p_type not like 'SMALL BURNISHED%' AND p_size in (32, 2, 16, 39, 40, 22, 7, 1)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#44'
      AND p_type not like 'MEDIUM BURNISHED%' AND p_size in (8, 22, 40, 23, 43, 45, 48, 17)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#55'
      AND p_type not like 'SMALL POLISHED%' AND p_size in (14, 34, 47, 18, 4, 15, 28, 3)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#23'
      AND p_type not like 'MEDIUM ANODIZED%' AND p_size in (50, 2, 27, 11, 5, 41, 33, 47)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#21'
      AND p_type not like 'MEDIUM PLATED%' AND p_size in (29, 49, 48, 38, 24, 42, 46, 35)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#33'
      AND p_type not like 'MEDIUM BRUSHED%' AND p_size in (21, 43, 2, 13, 8, 46, 38, 10)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#21'
      AND p_type not like 'STANDARD BURNISHED%' AND p_size in (26, 6, 46, 22, 24, 29, 21, 9)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#53'
      AND p_type not like 'ECONOMY ANODIZED%' AND p_size in (3, 33, 47, 29, 21, 15, 42, 4)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#11'
      AND p_type not like 'ECONOMY POLISHED%' AND p_size in (45, 29, 9, 36, 46, 10, 16, 11)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#44'
      AND p_type not like 'LARGE ANODIZED%' AND p_size in (22, 11, 16, 13, 37, 35, 46, 47)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#21'
      AND p_type not like 'PROMO POLISHED%' AND p_size in (5, 1, 13, 39, 29, 42, 40, 28)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#42'
      AND p_type not like 'PROMO PLATED%' AND p_size in (48, 14, 25, 24, 30, 42, 40, 37)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#54'
      AND p_type not like 'STANDARD ANODIZED%' AND p_size in (45, 38, 23, 7, 24, 28, 25, 11)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#52'
      AND p_type not like 'PROMO ANODIZED%' AND p_size in (34, 17, 12, 4, 48, 24, 49, 38)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#12'
      AND p_type not like 'PROMO POLISHED%' AND p_size in (33, 5, 45, 24, 2, 48, 23, 1)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#43'
      AND p_type not like 'ECONOMY BURNISHED%' AND p_size in (12, 24, 2, 35, 3, 41, 13, 28)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#11'
      AND p_type not like 'MEDIUM BURNISHED%' AND p_size in (50, 18, 7, 41, 21, 43, 17, 28)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#14'
      AND p_type not like 'MEDIUM PLATED%' AND p_size in (27, 4, 30, 22, 40, 7, 36, 38)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#51'
      AND p_type not like 'SMALL BURNISHED%' AND p_size in (50, 13, 31, 43, 47, 10, 15, 26)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#43'
      AND p_type not like 'MEDIUM PLATED%' AND p_size in (43, 28, 8, 4, 19, 11, 5, 45)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#53'
      AND p_type not like 'PROMO BURNISHED%' AND p_size in (10, 24, 36, 44, 14, 4, 33, 42)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#44'
      AND p_type not like 'PROMO BURNISHED%' AND p_size in (16, 29, 23, 36, 33, 19, 27, 4)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#53'
      AND p_type not like 'SMALL POLISHED%' AND p_size in (29, 50, 18, 23, 6, 32, 48, 24)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#35'
      AND p_type not like 'MEDIUM PLATED%' AND p_size in (18, 44, 9, 13, 37, 23, 6, 40)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#52'
      AND p_type not like 'MEDIUM ANODIZED%' AND p_size in (12, 47, 2, 10, 42, 18, 7, 20)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#42'
      AND p_type not like 'ECONOMY PLATED%' AND p_size in (2, 32, 42, 21, 3, 12, 5, 25)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#42'
      AND p_type not like 'ECONOMY BURNISHED%' AND p_size in (9, 16, 48, 1, 33, 19, 39, 5)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#32'
      AND p_type not like 'ECONOMY ANODIZED%' AND p_size in (25, 30, 7, 48, 34, 35, 4, 24)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#11'
      AND p_type not like 'SMALL ANODIZED%' AND p_size in (28, 30, 32, 17, 22, 44, 9, 16)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#23'
      AND p_type not like 'ECONOMY ANODIZED%' AND p_size in (37, 42, 17, 8, 41, 16, 39, 1)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#44'
      AND p_type not like 'STANDARD POLISHED%' AND p_size in (34, 28, 48, 41, 5, 3, 35, 23)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#44'
      AND p_type not like 'SMALL PLATED%' AND p_size in (45, 48, 35, 21, 22, 4, 40, 38)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#22'
      AND p_type not like 'LARGE BRUSHED%' AND p_size in (37, 25, 43, 47, 39, 6, 32, 40)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#51'
      AND p_type not like 'LARGE BRUSHED%' AND p_size in (43, 21, 42, 2, 14, 34, 6, 48)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#35'
      AND p_type not like 'PROMO PLATED%' AND p_size in (30, 23, 16, 49, 1, 39, 20, 5)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#34'
      AND p_type not like 'STANDARD ANODIZED%' AND p_size in (14, 36, 4, 24, 1, 34, 50, 47)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#31'
      AND p_type not like 'LARGE BURNISHED%' AND p_size in (27, 22, 24, 47, 37, 41, 8, 33)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#45'
      AND p_type not like 'LARGE ANODIZED%' AND p_size in (41, 6, 4, 40, 38, 32, 11, 20)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
