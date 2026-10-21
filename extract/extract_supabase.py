import os

import dlt 
from dlt.sources.sql_database import sql_table

TABLES = ["matches", "rating_ledger", "matches_players", "tournaments_matches"]
PROFILE_COLUMNS = ["id", "created_at"]
TOURNAMENT_COLUMNS = ["id", "format", "competitor_mode", "status", "rated", "config", "starts_at", "created_at", "updated_at"]


def main():
    credentials = os.environ["SUPABASE_DB_URL"]

    pipeline = dlt.pipeline(
        pipeline_name="supabase_to_duckdb",
        destination=dlt.destinations.duckdb("data/warehouse.duckdb"),
        dataset_name="bronze",
    )

    # Tables that contain match data

    resources = [
        sql_table(credentials=credentials, schema="public", table=name)
        for name in TABLES
    ]

    # Inserting profile data

    resources.append(
        sql_table(
            credentials=credentials,
            schema="public",
            table="profiles",
            included_columns=PROFILE_COLUMNS,
        )
    )

    # Inserting tournament data

    resources.append(
        sql_table(
            credentials=credentials,
            schema="public",
            table="tournaments",
            included_columns=TOURNAMENT_COLUMNS,
        )
    )


    load_info = pipeline.run(resources, write_disposition="replace", refresh="drop_resources")
    print(load_info)

if __name__ == "__main__":
    main()