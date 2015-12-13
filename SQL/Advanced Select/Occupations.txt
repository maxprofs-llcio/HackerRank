select group_concat(c.doctor),group_concat(c.professor),group_concat(c.singer),group_concat(c.actor)
from (
select count(b.name) as rank,if(a.occupation = 'Doctor',a.name,null) as doctor,if(a.occupation = 'Professor',a.name,null) as professor,if(a.occupation = 'Singer',a.name,null) as singer,if(a.occupation = 'Actor',a.name,null) as actor
from Occupations a, Occupations b
where a.occupation = b.occupation and a.name >= b.name
group by a.name
order by rank) as c
group by c.rank
;