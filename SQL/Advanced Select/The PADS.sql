select concat(name,'(',substr(occupation,1,1),')') from occupations order by name;
select 'There are total',c.cnt,concat(lower(c.occupation),'s.')
from (
select occupation , count(occupation) as cnt
from occupations
group by occupation
) as c
order by c.cnt
;