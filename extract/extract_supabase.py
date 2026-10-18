import os

import dlt 
from dlt.sources.sql_database import sql_table

TABLES = ["matches", "rating_ledger", "matches_players"]

def main():
    credentials = os.environ["SUPABASE_DB_URL"]

    pipeline = dlt.pipeline(
        pipeline_name="supabase_to_duckdb",
        destination=dlt.destinations.duckdb("data/warehouse.duckdb"),
        dataset_name="bronze",
    )

    resources = [
        sql_table(credentials=credentials, schema="public", table=name)
        for name in TABLES
    ]

    load_info = pipeline.run(resources, write_disposition="replace")
    print(load_info)

if __name__ == "__main__":
    main()