SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-10-02'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-09-27'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-08-27'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-08-09'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-08-04'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-09-21'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-09-01'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-09-08'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-09-16'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-08-18'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-09-27'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-08-29'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-08-28'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-08-14'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-08-27'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-09-01'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-08-10'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-08-03'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price,
      SUM(l_extendedprice*(1-l_discount)) as sum_disc_price,
      SUM(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty,
      AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order
      FROM lineitem
      WHERE l_shipdate <= '1998-08-19'
      GROUP BY l_returnflag, l_linestatus
      ORDER BY l_returnflag, l_linestatus;
