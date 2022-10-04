

select count(*) as ct, from_user_id 
from messages
where to_user_id = 201
group by from_user_id 
order by ct desc
limit 1;

select user_id,
  (select concat (firstname, ' ', lastname) from users where id = likes.user_id) as name,
  (select timestampdiff(YEAR, birthday, now()) from profiles where user_id = likes.user_id) as age,
  COUNT(*)
from
  likes
group by 
  user_id
order by 
  (select TIMESTAMPDIFF(YEAR, birthday, now()) from profiles where user_id = likes.user_id) 
 limit 10;




