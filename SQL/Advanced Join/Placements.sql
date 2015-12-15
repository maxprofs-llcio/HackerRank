select f.name
from
(select a.id as id,a.name as name,b.salary as own_salary,c.friend_id as friend,d.salary as friend_salary from ((students a join packages b on a.id = b.id)join friends c on a.id = c.id) join packages d on c.friend_id = d.id
) as f
where f.own_salary < f.friend_salary
order by f.friend_salary
;