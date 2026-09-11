with source as (
    
    select * from {{ ref('stg_lineitems') }}

),

changed as (

    select
        order_id,
        part_id,
        supplier_id,

        -- descriptions
        line_number,
        comment,
        ship_mode,
        ship_instructions,
        
        -- numbers
        quantity,
        extended_price as extended_price_usd,
        -- Dynamically pulled from dbt_project.yml
        extended_price * {{ var('usd_to_eur_rate') }} as extended_price_eur,
        discount_percentage,
        tax_rate as tax_rate_usd,
        -- Dynamically pulled from dbt_project.yml
        tax_rate * {{ var('usd_to_eur_rate') }} as tax_rate_eur,
        
        -- status
        status_code,
        return_flag,
        
        -- dates
        ship_date,
        commit_date,
        receipt_date

    from source

)

select * from changed
