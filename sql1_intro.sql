
use sakila;
select count(title), count(distinct title) from film_list; -- 997 from film list view
select count(title), count(distinct title) from film; -- 1000 - from film table

select * from film where film.title in (
	select f.title
	from film f
	left join film_list fl
		on f.title = fl.title
	where fl.title is null) 
;
-- 257 323 803 are the records we have in the film table but not the film list view

select * from film_actor where film_id in (257,323,803);
-- the film_list inner joins to film_actor which does not contain these 3 films which is why we don't have them in the view

select distinct name as language from language; -- 6 languages in language table

select distinct l.name as language   -- 1 language is used in films table
from film f
left join language l ON l.language_id = f.language_id;

select count(*) from store;

select * from store;

select count(*) from staff;

select * from staff;

select first_name from staff;

-- 2.5 lab
#select * from actor_info where first_name like 'Scarlett';

#select max(rental_date), max(return_date) from rental; -- rental date more recent than return date...


