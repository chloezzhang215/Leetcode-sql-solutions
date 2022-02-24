with temp as (
select caller_id as id,recipient_id as id2,call_time, date_format(call_time,"%Y-%m-%d") as dt from calls
union all
select recipient_id as id,caller_id as id2,call_time, date_format(call_time,"%Y-%m-%d") as dt from calls
),temp1 as (
select id,id2, rank() over (partition by id, dt order by call_time desc) as rnk1,rank() over (partition by id, dt order by call_time ) as rnk2
    from temp
)
select distinct a.id as user_id
from temp1 a, temp1 b
where a.id=b.id
and a.id2=b.id2
and a.rnk1=1
and b.rnk2=1
