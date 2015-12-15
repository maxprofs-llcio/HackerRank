select a.x,a.y
from 
(select functions.*,@a := @a+1 as id  from functions,(select @a := 0) init) a join 
(select functions.*,@b := @b+1 as id from functions,(select @b := 0) init) b
on a.x = b.y and a.y = b.x and a.id != b.id and a.x <= a.y
group by a.x
order by a.x
;