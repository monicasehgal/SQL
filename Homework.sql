use sakila;

ALTER TABLE actor
  
  DROP COLUMN Middle_name;


select first_name, Middle_name,last_name, actor_id
from actor;
