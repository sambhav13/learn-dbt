
{{ config(materialized='incremental', unique_key='eventDay')}}

select 
   eventDay ,
  count(userId) as dailyUsers,
  current_timestamp as entryTimestamp 
  from "postgres"."public"."source2" 

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where eventDay > (select max(eventDay) from {{ this }})

{% endif %}

group By 1