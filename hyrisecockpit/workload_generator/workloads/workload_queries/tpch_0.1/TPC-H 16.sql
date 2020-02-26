SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#51'
      AND p_type not like 'LARGE PLATED%' AND p_size in (36, 27, 47, 42, 41, 34, 50, 48)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#32'
      AND p_type not like 'SMALL ANODIZED%' AND p_size in (12, 47, 13, 19, 3, 16, 28, 35)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#35'
      AND p_type not like 'ECONOMY PLATED%' AND p_size in (27, 33, 36, 39, 20, 21, 8, 5)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#31'
      AND p_type not like 'PROMO POLISHED%' AND p_size in (1, 16, 31, 46, 5, 38, 14, 20)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#43'
      AND p_type not like 'STANDARD PLATED%' AND p_size in (47, 4, 1, 19, 12, 37, 40, 21)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#13'
      AND p_type not like 'MEDIUM POLISHED%' AND p_size in (49, 22, 19, 21, 37, 36, 25, 41)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#14'
      AND p_type not like 'MEDIUM POLISHED%' AND p_size in (18, 21, 6, 33, 26, 17, 41, 50)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#24'
      AND p_type not like 'MEDIUM ANODIZED%' AND p_size in (11, 5, 31, 9, 23, 22, 44, 16)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#44'
      AND p_type not like 'STANDARD BURNISHED%' AND p_size in (15, 22, 12, 39, 1, 13, 28, 36)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#12'
      AND p_type not like 'STANDARD PLATED%' AND p_size in (44, 20, 48, 11, 13, 23, 50, 30)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#53'
      AND p_type not like 'LARGE BURNISHED%' AND p_size in (45, 39, 46, 47, 25, 34, 37, 17)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#23'
      AND p_type not like 'ECONOMY BRUSHED%' AND p_size in (41, 24, 29, 23, 44, 2, 8, 36)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#51'
      AND p_type not like 'SMALL PLATED%' AND p_size in (10, 3, 32, 36, 18, 13, 27, 17)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#13'
      AND p_type not like 'STANDARD ANODIZED%' AND p_size in (26, 16, 3, 44, 14, 40, 31, 29)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#35'
      AND p_type not like 'PROMO PLATED%' AND p_size in (40, 33, 45, 23, 32, 12, 36, 24)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#15'
      AND p_type not like 'LARGE PLATED%' AND p_size in (21, 5, 26, 30, 22, 41, 11, 25)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#25'
      AND p_type not like 'STANDARD PLATED%' AND p_size in (14, 18, 4, 47, 5, 7, 21, 9)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#25'
      AND p_type not like 'LARGE BRUSHED%' AND p_size in (28, 42, 34, 23, 46, 35, 19, 12)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#42'
      AND p_type not like 'SMALL ANODIZED%' AND p_size in (47, 43, 35, 50, 18, 1, 6, 15)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#35'
      AND p_type not like 'SMALL BRUSHED%' AND p_size in (48, 6, 29, 15, 28, 40, 35, 24)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#45'
      AND p_type not like 'PROMO BURNISHED%' AND p_size in (16, 12, 5, 35, 18, 37, 32, 4)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#41'
      AND p_type not like 'PROMO BRUSHED%' AND p_size in (18, 15, 14, 35, 26, 13, 34, 16)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#15'
      AND p_type not like 'LARGE PLATED%' AND p_size in (11, 22, 3, 41, 34, 26, 16, 2)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#34'
      AND p_type not like 'MEDIUM PLATED%' AND p_size in (24, 8, 1, 31, 32, 14, 45, 6)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#52'
      AND p_type not like 'SMALL ANODIZED%' AND p_size in (3, 38, 13, 18, 22, 28, 9, 48)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#35'
      AND p_type not like 'SMALL ANODIZED%' AND p_size in (17, 8, 45, 42, 31, 30, 3, 32)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#21'
      AND p_type not like 'ECONOMY PLATED%' AND p_size in (2, 29, 44, 17, 15, 32, 6, 30)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#25'
      AND p_type not like 'PROMO BURNISHED%' AND p_size in (3, 7, 35, 44, 4, 48, 49, 11)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#55'
      AND p_type not like 'STANDARD BRUSHED%' AND p_size in (11, 29, 23, 12, 5, 42, 16, 45)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#34'
      AND p_type not like 'LARGE ANODIZED%' AND p_size in (41, 43, 28, 2, 38, 19, 5, 47)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#32'
      AND p_type not like 'SMALL POLISHED%' AND p_size in (34, 42, 45, 37, 31, 23, 3, 14)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#44'
      AND p_type not like 'LARGE BRUSHED%' AND p_size in (30, 38, 25, 20, 17, 5, 3, 44)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#14'
      AND p_type not like 'PROMO POLISHED%' AND p_size in (14, 33, 41, 5, 15, 50, 17, 13)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#34'
      AND p_type not like 'PROMO ANODIZED%' AND p_size in (19, 39, 32, 22, 40, 17, 36, 8)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#14'
      AND p_type not like 'LARGE BRUSHED%' AND p_size in (39, 12, 38, 22, 34, 24, 16, 6)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#54'
      AND p_type not like 'SMALL BRUSHED%' AND p_size in (12, 26, 49, 45, 5, 15, 38, 10)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#44'
      AND p_type not like 'PROMO PLATED%' AND p_size in (47, 29, 10, 16, 5, 25, 6, 2)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#51'
      AND p_type not like 'SMALL POLISHED%' AND p_size in (22, 29, 8, 15, 26, 12, 39, 3)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#12'
      AND p_type not like 'STANDARD POLISHED%' AND p_size in (27, 44, 30, 33, 24, 22, 14, 45)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#14'
      AND p_type not like 'MEDIUM BURNISHED%' AND p_size in (14, 38, 25, 15, 3, 32, 37, 31)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#52'
      AND p_type not like 'MEDIUM BRUSHED%' AND p_size in (41, 28, 35, 48, 15, 19, 11, 34)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#43'
      AND p_type not like 'STANDARD ANODIZED%' AND p_size in (31, 5, 30, 14, 10, 38, 4, 45)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#33'
      AND p_type not like 'MEDIUM POLISHED%' AND p_size in (20, 31, 3, 37, 30, 18, 41, 40)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#53'
      AND p_type not like 'STANDARD ANODIZED%' AND p_size in (44, 15, 28, 48, 10, 21, 4, 22)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#41'
      AND p_type not like 'ECONOMY ANODIZED%' AND p_size in (4, 45, 13, 46, 6, 37, 15, 43)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#45'
      AND p_type not like 'MEDIUM BURNISHED%' AND p_size in (33, 37, 40, 14, 20, 13, 31, 1)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#52'
      AND p_type not like 'SMALL POLISHED%' AND p_size in (46, 39, 41, 16, 44, 28, 40, 36)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#42'
      AND p_type not like 'MEDIUM ANODIZED%' AND p_size in (22, 47, 41, 50, 44, 38, 31, 39)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#21'
      AND p_type not like 'LARGE BRUSHED%' AND p_size in (17, 8, 46, 20, 1, 10, 45, 49)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#35'
      AND p_type not like 'ECONOMY ANODIZED%' AND p_size in (29, 38, 3, 7, 21, 26, 13, 33)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#41'
      AND p_type not like 'SMALL POLISHED%' AND p_size in (6, 10, 14, 41, 22, 8, 16, 31)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#23'
      AND p_type not like 'LARGE BURNISHED%' AND p_size in (24, 44, 4, 50, 48, 33, 19, 23)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#21'
      AND p_type not like 'STANDARD BRUSHED%' AND p_size in (37, 9, 44, 12, 21, 27, 41, 38)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
SELECT p_brand, p_type, p_size, count(distinct ps_suppkey) as supplier_cnt
      FROM partsupp, part WHERE p_partkey = ps_partkey AND p_brand <> 'Brand#22'
      AND p_type not like 'MEDIUM ANODIZED%' AND p_size in (49, 41, 1, 40, 33, 10, 47, 6)
      AND ps_suppkey not in (SELECT s_suppkey FROM supplier WHERE s_comment like '%Customer%Complaints%')
      GROUP BY p_brand, p_type, p_size ORDER BY supplier_cnt DESC, p_brand, p_type, p_size;
