with source as (
    select * from {{ source("app", "tournaments_matches") }}
),

renamed as (
    select
        tournament_id,
        match_id,
        round_number,
        slot,
        to_timestamp(_dlt_load_id::double) as _loaded_at
    from source
)

select * from renamed