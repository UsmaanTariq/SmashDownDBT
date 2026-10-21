with source as (
    select * from {{ source("app", "matches_players") }}
),

renamed as (
    select
        match_id,
        player_id,
        side,
        joined_at,
        to_timestamp(_dlt_load_id::double) as _loaded_at
    from source
)

select * from renamed