create database if not exists Kalatenko charset 'utf8';

use Kalatenko;

create table if not exists USERS (
id int auto_increment primary key,
login varchar (15) not null,
`password`  varchar (15) not null
);
insert into USERS value 
(null, 'Adam123', 74653748),
(null, 'Alwin123', 74659948),
(null, 'Barry123', 55553748),
(null, 'Baylis123', 74333748),
(null, 'Bert123', 74999948),
(null, 'Bryan123', 67453748),
(null, 'Calvin123', 11113748),
(null, 'Carry123', 87653748),
(null, 'Chris123', 74222248),
(null, 'Claus123', 88888748),
(null, 'Cyril123', 00053748),
(null, 'David123', 75555548),
(null, 'Denis123', 73333748),
(null, 'Dominic123', 12343748),
(null, 'Eddy123', 44453748);

create table if not exists  `PROFILES` (
id int auto_increment primary key,
first_name varchar (10) not null,
last_name varchar (10) not null,
email varchar (20) not null,
age int 
);
insert into `PROFILES` value 
(null,  'Eldred', 'Wilde', 'uhfihef@ukr.net', 20),
(null,  'Georgy', 'White', '257fgh@ukr.net', 22),
(null,  'Evgen', 'Whitehead', 'dfgh67@ukr.net', 23),
(null,  'Denys', 'Ward', 'asdf243@ukr.net', 33),
(null,  'Zakhar', 'Webb', 'jfdjf3@ukr.net', 45),
(null,  'Zinovy', 'Webster', 'jkdfgu654@ukr.net', 34),
(null,  'Gnat', 'Wade', 'hskcb5g@ukr.net', 35),
(null,  'Kostyantyn', 'Wade', 'ksknxhdg555@ukr.net', 31),
(null,  'Lev', 'Waters', 'dhjskskksk@ukr.net', 29),
(null,  'Mykhailo', 'Weller', 'mmnbbbb@ukr.net', 39);

create table if not exists GAMES (
id int auto_increment primary key,
first_player_id int,
second_player_id int
);
insert into GAMES (second_player_id)
select id
from PROFILES
order by id desc;

Update GAMES as t1
join PROFILES as t2 on t1.id = t2.id
set t1.first_player_id = t2.id;

create table if not exists  GAME_RESULTS (
id int auto_increment primary key,
result_value varchar (15) 
);
insert into GAME_RESULTS values
(null, 'WIN'),
(null, 'LOSE'),
(null, 'DRAW');

create table if not exists  ACHIEVEMENTS (
id int auto_increment primary key,
achiev_name varchar (15) not null
);
insert into ACHIEVEMENTS values
(null, 'newbie'),
(null, 'balbes'),
(null, 'amateur'),
(null, 'pro'),
(null, 'master');

 create table if not exists PLAYER_ACHIEVS (
id int auto_increment primary key,
player_id int,
achiev_id int
);
     
insert into PLAYER_ACHIEVS values
(null, 10, 4),  
(null, 4, 3), 
(null, 10, 5), 
(null, 1, 2), 
(null, 7, 4), 
(null, 2, 5), 
(null, 8, 1), 
(null, 3, 3), 
(null, 5, 3), 
(null, 6, 4), 
(null, 9, 2), 
(null, 5, 4);   

 create table if not exists PLAYER_RESULTS (
id int auto_increment primary key,
player_id int,
result_id int,
game_id int
);

insert into PLAYER_RESULTS values
(null, 1, 1, 2), 
(null, 1, 2, 3), 
(null, 1, 2, 4), 
(null, 2, 1, 5), 
(null, 2, 2, 6), 
(null, 2, 3, 7), 
(null, 3, 1, 8), 
(null, 3, 2, 9), 
(null, 3, 3, 10), 
(null, 4, 1, 1),
(null, 4, 2, 2), 
(null, 4, 3, 3), 
(null, 5, 1, 4), 
(null, 5, 2, 2), 
(null, 5, 3, 6), 
(null, 6, 1, 7), 
(null, 6, 2, 8), 
(null, 6, 3, 9), 
(null, 7, 1, 10), 
(null, 7, 2, 1),
(null, 7, 3, 2), 
(null, 8, 1, 3), 
(null, 8, 2, 4), 
(null, 8, 3, 5), 
(null, 9, 1, 6), 
(null, 9, 2, 7), 
(null, 9, 3, 8), 
(null, 10, 1, 8), 
(null, 10, 2, 9), 
(null, 10, 3, 1);

delete
from USERS
where id > 13;

update `PROFILES`
set first_name = 'Bob'
where id = 5;

alter table USERS
add column profiles_id int;

update USERS
	set profiles_id = case
					when id = 1 then 1
                    when id = 2 then 2
                    when id = 3 then 3
                    when id = 4 then 4
                    when id = 5 then 5
                    when id = 6 then 6
                    when id = 7 then 7
                    when id = 8 then 8
                    when id = 9 then 9
                    when id = 10 then 10
                    else profiles_id
				end;


alter table PLAYER_RESULTS
add constraint FK_PROFILES_PLAYERRESULTS
foreign key (player_id)
references `PROFILES` (id);

alter table PLAYER_RESULTS
add constraint FK_GAMERESULTS_PLAYERRESULTS
foreign key (result_id)
references GAME_RESULTS (id);

alter table PLAYER_RESULTS
add constraint FK_GAMES_PLAYERRESULTS
foreign key (game_id)
references GAMES (id);

alter table PLAYER_ACHIEVS
add constraint FK_PROFILES_PLAYERACHIEVS
foreign key (player_id)
references `PROFILES` (id);

alter table PLAYER_ACHIEVS
add constraint FK_ACHIEVEMENTS_PLAYERACHIEVS
foreign key (achiev_id)
references ACHIEVEMENTS (id);

alter table GAMES
add constraint FK_PROFILES_GAMES
foreign key (first_player_id)
references `PROFILES` (id);

alter table GAMES
add constraint FK_PROFILES_GAMES_2
foreign key (second_player_id)
references `PROFILES` (id);

alter table USERS
add constraint FK_PROFILES_USERS_1
foreign key (profiles_id)
references `PROFILES` (id);

use Kalatenko;

select USERS.login,
	   `PROFILES`.first_name,
       `PROFILES`.last_name
     from  USERS
     join `PROFILES` on profiles_id = `PROFILES`.id;

select `PROFILES`.id,
`PROFILES`.first_name,
`PROFILES`.email,
ACHIEVEMENTS.achiev_name
from PLAYER_ACHIEVS
join `PROFILES` on PLAYER_ACHIEVS.player_id = `PROFILES`.id
join ACHIEVEMENTS on PLAYER_ACHIEVS.achiev_id = ACHIEVEMENTS.id
and `PROFILES`.id < 6;

select `PROFILES`.id,
		`PROFILES`.first_name,
		`PROFILES`.last_name,
		`PROFILES`.email,
		`PROFILES`.age,
		 GAME_RESULTS.result_value
from PLAYER_RESULTS
join `PROFILES` on player_results.player_id = `PROFILES`.id
join GAME_RESULTS on PLAYER_RESULTS.result_id = GAME_RESULTS.id
and GAME_RESULTS.id = 1;

select 
u1.login,
u1.`password`,
g1.id
from `PROFILES`
join USERS as u1 on `PROFILES`.id = u1.profiles_id
join GAMES as g1 on `PROFILES`.id = g1.first_player_id
join PLAYER_RESULTS as pr1 on `PROFILES`.id = pr1.player_id
and pr1.game_id = 1;
     
     
 select 
`PROFILES`.first_name,
count(second_player_id) as count_of_games
from `PROFILES`
join GAMES on `PROFILES`.id = GAMES.first_player_id
group by second_player_id
order by count_of_games desc;
    
select
	first_name,
	email
	from `PROFILES`
	where id in (select first_player_id
				from GAMES
				where first_player_id = id);


 
 
 