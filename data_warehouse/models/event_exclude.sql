{{
    config(
        materialized='incremental',
        unique_key='event_unique_id'
    )
}}
-- 
-- select * from {{ ref('stg_event_exclude_far') }}
-- 
-- union 
-- 
-- select * from {{ ref('stg_event_exclude_dnu') }}
-- 
-- union 
-- 
-- select * from {{ ref('stg_event_exclude_test') }}
-- 
-- union 

--select * from {{ ref('stg_event_exclude_base') }}

select event_unique_id
	, context_id
	, 'bfischer-dbt' as added_by
	, 'Far future events' as exclude_reason
	, current_date as insert_date
	, true as is_valid
from ticketing.events 
where event_datetime > current_date + 7300
and not is_exclude 