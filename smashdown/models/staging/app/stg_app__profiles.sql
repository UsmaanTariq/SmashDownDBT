with source as (
    select * from {{ source("app", "profiles") }}
),

renamed as (
    select
        id,
        created_at,
        to_timestamp(_dlt_load_id::double) as _loaded_at
    from source
)

select * from renamed