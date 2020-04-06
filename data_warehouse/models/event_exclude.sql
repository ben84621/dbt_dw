{{
    config(
        materialized='incremental',
        unique_key='event_unique_id'
    )
}}

select * from {{ ref('stg_event_exclude_far') }}

union 
 
select * from {{ ref('stg_event_exclude_dnu') }}

union 
 
select * from {{ ref('stg_event_exclude_test') }}
 
union 

select * from {{ ref('stg_event_exclude_base') }}
