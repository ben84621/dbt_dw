{{
    config(
        materialized='incremental',
        unique_key='event_unique_id'
    )
}}

select event_unique_id
	, context_id
	, 'bfischer-dbt' as added_by
	, 'do not use' as exclude_reason
	, current_date as insert_date
	, true as is_valid
from ticketing.events 
where (lower(event_code) like '%do%not%use%' 
		or lower(event_name) like '%do%not%use%')
and not is_exclude 