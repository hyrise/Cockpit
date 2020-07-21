# noqa
# type: ignore
# flake8: noqa

import logging
import time


class Results:  # noqa
    def __init__(self):  # noqa
        self.start = None
        self.stop = None
        self.txn_id = 0

        self.txn_counters = {}
        self.txn_times = {}
        self.running = {}

    def startBenchmark(self):  # noqa
        """Mark the benchmark as having been started"""
        assert self.start == None  # nosec
        logging.debug("Starting benchmark statistics collection")
        self.start = time.time()
        return self.start

    def stopBenchmark(self):  # noqa
        """Mark the benchmark as having been stopped"""
        assert self.start != None  # nosec
        assert self.stop == None  # nosec
        logging.debug("Stopping benchmark statistics collection")
        self.stop = time.time()

    def startTransaction(self, txn):  # noqa
        self.txn_id += 1
        id = self.txn_id
        self.running[id] = (txn, time.time())
        return id

    def abortTransaction(self, id):  # noqa
        """Abort a transaction and discard its times"""
        assert id in self.running  # nosec
        txn_name, txn_start = self.running[id]
        del self.running[id]

    def stopTransaction(self, id):  # noqa
        """Record that the benchmark completed an invocation of the given transaction"""
        assert id in self.running  # nosec
        txn_name, txn_start = self.running[id]
        del self.running[id]

        duration = time.time() - txn_start
        total_time = self.txn_times.get(txn_name, 0)
        self.txn_times[txn_name] = total_time + duration

        total_cnt = self.txn_counters.get(txn_name, 0)
        self.txn_counters[txn_name] = total_cnt + 1

    def append(self, r):  # noqa
        for txn_name in r.txn_counters.keys():
            orig_cnt = self.txn_counters.get(txn_name, 0)
            orig_time = self.txn_times.get(txn_name, 0)

            self.txn_counters[txn_name] = orig_cnt + r.txn_counters[txn_name]
            self.txn_times[txn_name] = orig_time + r.txn_times[txn_name]
            # logging.debug("%s [cnt=%d, time=%d]" % (txn_name, self.txn_counters[txn_name], self.txn_times[txn_name]))
        ## HACK
        self.start = r.start
        self.stop = r.stop

    def __str__(self):  # noqa
        return self.show()

    def show(self, load_time=None):  # noqa
        if self.start == None:
            return "Benchmark not started"
        if self.stop == None:
            duration = time.time() - self.start
        else:
            duration = self.stop - self.start

        col_width = 16
        total_width = (col_width * 4) + 2
        f = "\n  " + (("%-" + str(col_width) + "s") * 4)
        line = "-" * total_width

        ret = u"" + "=" * total_width + "\n"
        if load_time != None:
            ret += "Data Loading Time: %d seconds\n\n" % (load_time)

        ret += "Execution Results after %d seconds\n%s" % (duration, line)
        ret += f % ("", "Executed", u"Time (µs)", "Rate")

        total_time = 0
        total_cnt = 0
        for txn in sorted(self.txn_counters.keys()):
            txn_time = self.txn_times[txn]
            txn_cnt = self.txn_counters[txn]
            rate = u"%.02f txn/s" % ((txn_cnt / txn_time))
            ret += f % (txn, str(txn_cnt), str(txn_time * 1000000), rate)

            total_time += txn_time
            total_cnt += txn_cnt
        ret += "\n" + ("-" * total_width)
        total_rate = "%.02f txn/s" % ((total_cnt / total_time))
        ret += f % ("TOTAL", str(total_cnt), str(total_time * 1000000), total_rate)

        return ret.encode("utf-8")


## CLASS
