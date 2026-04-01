WITH cte AS (
    select 

        to_timestamp(STARTED_AT) as started_at,
        date(to_timestamp(STARTED_AT)) as date_started_at,
        hour(to_timestamp(STARTED_AT)) as hour_started_at,
        dayname(to_timestamp(STARTED_AT)) as day_started_at,
        
        case when  dayname(to_timestamp(STARTED_AT)) in ('Sat','Sun')
        then 'Weekend'
        else 'BusinessDay'
        end as day_type,
        
        case when month(to_timestamp(STARTED_AT)) in (10,11,12,1)
        then 'Winter'
        when month(to_timestamp(STARTED_AT)) in (2,3,4,5)
        then 'Summer'
        when month(to_timestamp(STARTED_AT)) in (6,7,8,9)
        then 'Monsoon'
        end  as station_of_year



    from {{ source('demo', 'bike') }}
    where started_at != 'started_at'    
)

select *
from cte
