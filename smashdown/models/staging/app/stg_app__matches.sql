with source as (
    select * from {{ source("app", "matches") }}
),

renamed as (
    select
        id as match_id,
        venue_id,
        format,
        status,
        rated,
        best_of_sets,
        completed_at,
        created_at,
        to_timestamp(_dlt_load_id::double) as _loaded_at
    from source
)

select * from renamed