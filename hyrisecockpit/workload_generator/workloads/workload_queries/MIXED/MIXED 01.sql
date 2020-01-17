
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-11-24'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-8-26'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-6-5'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-6-16'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-6-26'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-8-19'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-7-22'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-4-11'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-8-8'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-8-15'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-1-2'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-7-8'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-7-6'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-10-3'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-3-12'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-9-25'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-6-28'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-11-16'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-11-25'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-4-7'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-4-25'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-7-11'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-8-8'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-8-15'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-2-1'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-5-8'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-12-23'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-8-12'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-9-26'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-10-10'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-1-22'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-4-14'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-8-18'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-4-4'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-5-3'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-4-4'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-11-24'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-12-14'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-4-21'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-6-3'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-2-5'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-8-28'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-8-23'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-2-2'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-6-17'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-8-7'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-6-15'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-2-7'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-12-13'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-3-22'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-4-3'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-8-27'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-4-23'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-1-17'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-10-27'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-7-15'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-4-27'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-12-18'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-2-8'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-6-26'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-4-24'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-8-28'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-2-15'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-6-10'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-1-18'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-3-14'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-12-16'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-12-18'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-4-25'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-6-8'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-8-13'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-9-23'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-1-19'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-11-25'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-1-20'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-9-14'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-5-25'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-6-20'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-2-13'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-12-25'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-1-9'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-7-5'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-9-6'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-4-28'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-2-7'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-11-28'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-5-18'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-7-1'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-8-9'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-8-18'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-6-4'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-2-3'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-5-2'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-12-12'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-2-5'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-6-3'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-6-22'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1996-9-11'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1995-10-7'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;
        SELECT
            l_returnflag,
            l_linestatus,
            sum(l_quantity) as sum_qty,
            sum(l_extendedprice) as sum_base_price,
            sum(l_extendedprice*(1-l_discount)) as sum_disc_price,
            sum(l_extendedprice*(1-l_discount)*(1+l_tax)) as sum_charge,
            avg(l_quantity) as avg_qty,
            avg(l_extendedprice) as avg_price,
            avg(l_discount) as avg_disc,
            count(*) as count_order
        FROM
            lineitem
        WHERE
            l_shipdate <= '1997-10-15'
        GROUP BY
            l_returnflag, l_linestatus
        ORDER BY
            l_returnflag, l_linestatus;