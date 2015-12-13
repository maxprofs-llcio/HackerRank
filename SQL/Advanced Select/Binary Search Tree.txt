select data.n,case
when data.p is null then 'Root'
when c.ref is null then 'Leaf' 
else 'Inner' end
from BST as data LEFT JOIN
    (select
     a.n,count(b.p) as ref
     from BST a, BST b
     where a.n = b.p 
     group by a.n
     ) as c on c.n = data.n
order by data.n
;