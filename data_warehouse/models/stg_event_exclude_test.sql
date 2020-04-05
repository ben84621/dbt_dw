{{
    config(
        materialized='incremental',
        unique_key='event_unique_id'
    )
}}


select event_unique_id
	, context_id
	, 'bfischer-dbt' as added_by
	, 'test / training' as exclude_reason
	, current_date as insert_date
	, true as is_valid
from ticketing.events 
where (lower(event_code) like 'test_%'
		or lower(event_name) like 'melissa%training%'
		or lower(event_name) like '% test'
		or lower(event_name) like '% training')
and not is_exclude 