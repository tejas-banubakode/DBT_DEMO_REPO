{% macro get_season(x) %}

   case when month(to_timestamp({{x}})) in (10,11,12,1)
        then 'Winter'
        when month(to_timestamp({{x}})) in (2,3,4,5)
        then 'Summer'
        when month(to_timestamp({{x}})) in (6,7,8,9)
        then 'Monsoon'
   end

{% endmacro %}


{% macro day_type(x) %}

case when  dayname(to_timestamp({{x}})) in ('Sat','Sun')
    then 'Weekend'
    else 'BusinessDay'
end

{% endmacro %}