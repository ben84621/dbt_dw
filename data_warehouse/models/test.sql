{{
    config(
        materialized='incremental',
        unique_key='event_unique_id'
    )
}}

select *,'run3' as run 
from ticketing.events 
where event_datetime > '2020-01-01' 
and not is_exclude 
limit 10
