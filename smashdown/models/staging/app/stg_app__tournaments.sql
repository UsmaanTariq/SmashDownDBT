with source as (
    select * from {{ source('app', 'tournaments') }}
),

renamed as (
    select
        id as tournament_id,
        format,
        status,
        rated as is_rated,
        created_at,
        to_timestamp(_dlt_load_id::double) as _loaded_at
    from source
)

select * from renamed