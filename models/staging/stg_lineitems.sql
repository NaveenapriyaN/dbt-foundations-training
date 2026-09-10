with source as (
    select * from {{ source('src', 'lineitems') }}
),

changed as (
    select
        -- ids
        l_orderkey as order_id,
        l_partkey as part_id,
        l_suppkey as supply_id,
        l_linenumber as line_number,
        
        -- descriptions
        l_shipinstruct as ship_instructions,
        l_shipmode as ship_mode,
        l_comment as comment,

        -- numbers & metrics
        l_quantity as quantity,
        l_extendedprice as extended_price,
        l_discount as discount_percentage,
        l_tax as tax_percentage,

        -- statuses & flags
        l_returnflag as return_flag,
        l_linestatus as line_status,

        -- dates
        l_shipdate as ship_date,
        l_commitdate as commit_date,
        l_receiptdate as receipt_date
    from source
)

select * from changed
