SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%pending%accounts%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%packages%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%special%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%pending%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%packages%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%special%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%pending%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%packages%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%unusual%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%unusual%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%packages%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%special%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%unusual%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%unusual%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%unusual%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%unusual%packages%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%special%accounts%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%unusual%packages%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%pending%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%special%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%accounts%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%packages%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%accounts%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%pending%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%special%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%unusual%accounts%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%special%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%special%accounts%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%pending%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%unusual%accounts%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%special%accounts%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%special%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%unusual%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%special%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%pending%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%unusual%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%pending%packages%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%unusual%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%unusual%accounts%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%pending%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%special%accounts%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%pending%packages%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%special%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%special%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%express%requests%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
SELECT c_count, count(*) as custdist FROM (SELECT c_custkey, count(o_orderkey) AS c_count
      FROM customer left outer join orders on c_custkey = o_custkey AND o_comment not like '%unusual%deposits%'
      GROUP BY c_custkey) as c_orders GROUP BY c_count ORDER BY custdist DESC, c_count DESC;
