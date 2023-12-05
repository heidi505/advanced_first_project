--유저
insert into user_tb(`id`, `username`, `password`, `email`) values(1, 'ssar', '1111', 'ssar@nate.com');
insert into user_tb(`id`, `username`, `password`, `email`) values(2, 'cos', '1111', 'cos@nate.com');
insert into user_tb(`id`, `username`, `password`, `email`) values(3, 'love', '1111', 'love@nate.com');
insert into user_tb(`id`, `username`, `password`, `email`) values(4, 'tom', '1111', 'tom@nate.com');
insert into user_tb(`id`, `username`, `password`, `email`) values(5, 'lisa', '1111', 'lisa@nate.com');


--예약
INSERT INTO reservation_tb(`id`,`user_id`,`reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`)VALUES (1,1,153,'예정',1,'2024-08-28 00:13:24',220270,'2023-11-12 06:51:24');
INSERT INTO reservation_tb(`id`,`user_id`,`reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`)VALUES (2,1,104,'지난',3,'2024-03-26 00:35:28',426820,'2023-11-24 04:02:28');
INSERT INTO reservation_tb(`id`,`user_id`,`reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`)VALUES (3,1,364,'취소',1,'2024-03-14 11:02:06',290400,'2023-12-01 18:50:06');

--티켓

INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES(1,1,36050,20430,10000,18305,926560,'KAL','KE112','ICN','SYD','2024-03-21 21:34:06','2023-10-10 08:17:01','ICN','SYD','일반석',false,true,37,'2023-09-18 10:38:26');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES(2,2,38080,22370,10000,11830,123980,'KAL','KE112','ICN','SYD','2023-03-09 03:07:54','2024-02-06 14:31:15','ICN','SYD','일반석',false,true,29,'2023-03-01 18:48:37');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES(3,2,47440,20150,10000,9090,457890,'KAL','KE112','ICN','SYD','2023-11-01 02:55:18','2023-01-06 07:37:39','ICN','SYD','일반석',true,false,38,'2023-03-13 00:41:58');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES(4,2,41050,14150,10000,9870,498430,'KAL','KE112','ICN','SYD','2024-09-25 01:36:18','2024-03-06 03:57:13','ICN','SYD','일반석',false,false,24,'2024-01-29 18:49:47');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES(5,3,47190,15820,10000,8010,962670,'KAL','KE112','ICN','SYD','2023-04-17 20:07:24','2023-12-15 16:18:18','ICN','SYD','일반석',false,false,31,'2022-12-21 06:53:04');

-- 승객

INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (1,1,'hayan','Kim','12/15/1995','여성','성인','2023-11-04 17:59:57');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (2,2,'minkyoung','Sung','05/28/1996','남성','성인','2023-09-05 16:42:07');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (3,2,'eunji','Lee','11/13/1991','여성','성인','2023-11-15 13:47:25');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (4,2,'seungshin','Kim','12/09/1991','남성','성인','2023-09-30 23:03:00');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (5,3,'hayan','Kim','12/05/1995','여성','성인','2023-11-12 18:34:31');

-- 검색
INSERT INTO `searched_tb` (`id`,`user_id`,`keyword`,`is_one_way`,`departure_city`,`arrival_city`,`departure_date`,`arrival_date`,`passenger_amount`,`price`,`created_at`)
VALUES(1,1,'시드니',true,'SYD','BKK','2024-09-14 15:20:02','2024-09-15 00:50:39',1,176430,'2024-09-14 15:20:02');
INSERT INTO `searched_tb` (`id`,`user_id`,`keyword`,`is_one_way`,`departure_city`,`arrival_city`,`departure_date`,`arrival_date`,`passenger_amount`,`price`,`created_at`)
VALUES(2,1,'방콕',true,'ICN','BKK','2023-12-24 01:25:56','2023-12-05 19:42:02',2,159400,'2024-02-29 13:24:00');
INSERT INTO `searched_tb` (`id`,`user_id`,`keyword`,`is_one_way`,`departure_city`,`arrival_city`,`departure_date`,`arrival_date`,`passenger_amount`,`price`,`created_at`)
VALUES(3,2,'아시아나',true,'ICN','BUS','2024-11-30 21:27:33','2023-12-06 05:36:46',2,170520,'2024-02-23 11:07:42');
INSERT INTO `searched_tb` (`id`,`user_id`,`keyword`,`is_one_way`,`departure_city`,`arrival_city`,`departure_date`,`arrival_date`,`passenger_amount`,`price`,`created_at`)
VALUES(4,3,'캘리포니아',false,'ICN','BKK','2024-01-21 09:18:11','2023-12-05 11:34:08',1,25470,'2023-02-02 16:26:54');
INSERT INTO `searched_tb` (`id`,`user_id`,`keyword`,`is_one_way`,`departure_city`,`arrival_city`,`departure_date`,`arrival_date`,`passenger_amount`,`price`,`created_at`)
VALUES(5,4,'서울',false,'BUS','ICN','2024-01-29 20:32:43','2023-12-05 12:36:31',7,22990,'2023-05-26 04:49:11');

-- 쿠폰
INSERT INTO `coupon_tb`(`id`,`coupon_name`,`coupon_period`,`discounting_price`)VALUES (1,'가입 축하 쿠폰',30,10000);
INSERT INTO `coupon_tb`(`id`,`coupon_name`,`coupon_period`,`discounting_price`)VALUES (2,'연말 감사 쿠폰',30,20000);
INSERT INTO `coupon_tb`(`id`,`coupon_name`,`coupon_period`,`discounting_price`)VALUES (3,'직원 할인 쿠폰',30,50000);


-- hasCoupon
INSERT INTO `hascoupon_tb`(`id`,`user_id`,`coupon_id`,`is_used`,`coupon_number`,`created_at`,`expired_at`)VALUES (1,1,1,true,21341,'2023-09-01 14:44:37','2024-01-23 06:15:22');
INSERT INTO `hascoupon_tb`(`id`,`user_id`,`coupon_id`,`is_used`,`coupon_number`,`created_at`,`expired_at`)VALUES (2,1,2,false,22807,'2023-10-07 09:58:22','2024-06-28 21:19:03');
INSERT INTO `hascoupon_tb`(`id`,`user_id`,`coupon_id`,`is_used`,`coupon_number`,`created_at`,`expired_at`)VALUES (3,1,3,false,24717,'2023-08-21 00:54:04','2023-12-22 15:25:37');
INSERT INTO `hascoupon_tb`(`id`,`user_id`,`coupon_id`,`is_used`,`coupon_number`,`created_at`,`expired_at`)VALUES (4,2,2,true,10901,'2023-08-14 09:49:34','2024-03-22 13:23:33');
INSERT INTO `hascoupon_tb`(`id`,`user_id`,`coupon_id`,`is_used`,`coupon_number`,`created_at`,`expired_at`)VALUES (5,3,1,false,15576,'2023-08-01 12:10:14','2024-12-01 23:44:38');


-- 공지

-- 배너




