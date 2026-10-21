with source as (
    select * from {{ source("app", "rating_ledger") }}
),

renamed as (
    select
        match_id,
        player_id,
        rating_before,
        rating_after,
        played_at,
        won,
        to_timestamp(_dlt_load_id::double) as _loaded_at
    from source
)

select * from renamed