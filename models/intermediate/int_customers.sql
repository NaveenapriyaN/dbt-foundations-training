{{ config(materialized='incremental', unique_key='') }}

with customer as (select * from {{ ref('stg_customers') }}),
nation as (select * from {{ ref('stg_nations') }}),
region as (select * from {{ ref('stg_regions') }})
select
    c.*,
    n.name as nation_name,
    r.name as region_name,
from customer c
join nation n on c.nation_id = n.nation_id
join region r on n.region_id = r.region_id