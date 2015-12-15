select min(c.start_date),max(c.end_date)
from
(select projects.*,if(@prev = start_date,@cnt,@cnt:=@cnt+1) as group_id, @prev := projects.end_date  from projects ,(select @prev:=null,@cnt:=0) init order by start_date) as c
group by c.group_id
order by count(task_id)
;