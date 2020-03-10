"""Format queries in a file according to our needs.

Queries should be readable, and packaged as transactions where necessary.
"""

from sqlparse import format, split


def format_queries(filename, workload_size=1):
    """Format queries and separate them into transactions."""
    with open(filename, "r") as f:
        raw_queries = f.read()

    queries = [
        format(
            query,
            reindent=True,
            keyword_case="upper",
            use_space_around_operators=True,
            indent_tabs=True,
            wrap_after=88,
        )
        for query in [query for query in split(raw_queries) if query != ""]
    ]
    transactions = [
        "\n\n".join(queries[step * workload_size : (step + 1) * workload_size])
        for step in range(int(len(queries) / workload_size))
    ]
    final_queries = "\n\n---\n\n".join(transactions)

    with open(filename, "w") as f:
        print(final_queries, file=f)
