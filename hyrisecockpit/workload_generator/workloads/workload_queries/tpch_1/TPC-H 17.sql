SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#43' AND p_container = 'LG JAR' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#42' AND p_container = 'JUMBO PACK' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#12' AND p_container = 'SM BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#41' AND p_container = 'SM BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#14' AND p_container = 'SM BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#44' AND p_container = 'LG BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#31' AND p_container = 'SM BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#12' AND p_container = 'WRAP JAR' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#34' AND p_container = 'SM PKG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#13' AND p_container = 'LG DRUM' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#31' AND p_container = 'MED BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#24' AND p_container = 'MED BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#53' AND p_container = 'JUMBO JAR' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#44' AND p_container = 'SM PKG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#33' AND p_container = 'SM DRUM' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#43' AND p_container = 'LG BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#43' AND p_container = 'JUMBO JAR' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#13' AND p_container = 'SM PKG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#25' AND p_container = 'LG PACK' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#23' AND p_container = 'WRAP BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#13' AND p_container = 'LG BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#35' AND p_container = 'LG CAN' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#41' AND p_container = 'LG PACK' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#12' AND p_container = 'LG BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#21' AND p_container = 'SM DRUM' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#45' AND p_container = 'JUMBO PACK' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#15' AND p_container = 'LG CASE' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#32' AND p_container = 'SM DRUM' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#12' AND p_container = 'MED BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#31' AND p_container = 'LG CAN' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#12' AND p_container = 'MED PKG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#55' AND p_container = 'LG CASE' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#52' AND p_container = 'LG CASE' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#13' AND p_container = 'JUMBO BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#32' AND p_container = 'MED BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#23' AND p_container = 'SM JAR' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#51' AND p_container = 'MED CASE' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#45' AND p_container = 'JUMBO BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#25' AND p_container = 'WRAP CASE' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#11' AND p_container = 'JUMBO PKG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#33' AND p_container = 'MED CAN' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#24' AND p_container = 'JUMBO DRUM' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#53' AND p_container = 'WRAP PKG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#21' AND p_container = 'JUMBO CAN' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#42' AND p_container = 'MED CAN' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#15' AND p_container = 'SM CASE' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#53' AND p_container = 'SM PACK' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#53' AND p_container = 'MED PACK' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#13' AND p_container = 'WRAP BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#33' AND p_container = 'SM BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#55' AND p_container = 'LG BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#25' AND p_container = 'MED BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#34' AND p_container = 'WRAP JAR' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#42' AND p_container = 'JUMBO BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#32' AND p_container = 'WRAP PACK' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#42' AND p_container = 'LG BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#31' AND p_container = 'SM BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#41' AND p_container = 'SM PACK' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#55' AND p_container = 'MED BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#13' AND p_container = 'WRAP CASE' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#43' AND p_container = 'WRAP PACK' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#31' AND p_container = 'MED CASE' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#53' AND p_container = 'JUMBO BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#43' AND p_container = 'SM JAR' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#35' AND p_container = 'WRAP PACK' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#53' AND p_container = 'MED BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#43' AND p_container = 'MED JAR' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#15' AND p_container = 'MED JAR' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#43' AND p_container = 'LG BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#22' AND p_container = 'JUMBO BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#45' AND p_container = 'SM BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#25' AND p_container = 'MED CASE' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#55' AND p_container = 'MED BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#31' AND p_container = 'SM BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#31' AND p_container = 'MED CAN' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#42' AND p_container = 'WRAP CASE' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#53' AND p_container = 'LG CASE' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#11' AND p_container = 'MED CAN' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#25' AND p_container = 'MED CAN' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#25' AND p_container = 'SM JAR' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#53' AND p_container = 'WRAP JAR' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#23' AND p_container = 'MED PACK' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#33' AND p_container = 'WRAP CAN' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#22' AND p_container = 'WRAP BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#45' AND p_container = 'SM PACK' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#32' AND p_container = 'WRAP PACK' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#14' AND p_container = 'SM JAR' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#33' AND p_container = 'MED PKG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#11' AND p_container = 'MED PKG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#52' AND p_container = 'MED PKG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#21' AND p_container = 'JUMBO JAR' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#54' AND p_container = 'MED JAR' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#33' AND p_container = 'JUMBO PACK' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#34' AND p_container = 'SM PACK' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#21' AND p_container = 'MED DRUM' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#52' AND p_container = 'WRAP DRUM' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#53' AND p_container = 'MED BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#55' AND p_container = 'LG BAG' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#13' AND p_container = 'LG BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
SELECT SUM(l_extendedprice) / 7.0 as avg_yearly FROM lineitem, part WHERE p_partkey = l_partkey
      AND p_brand = 'Brand#35' AND p_container = 'SM BOX' AND l_quantity < (SELECT 0.2 * avg(l_quantity)
      FROM lineitem WHERE l_partkey = p_partkey);
