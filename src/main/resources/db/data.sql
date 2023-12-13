--유저
insert into user_tb(`id`, `username`, `password`, `email`, `phone_number`) values(1, 'ssar', '$2a$12$gFkBm3dupjTADJ.zRV.hwOW27XEA8tusg/sVaJtIxI.94Tq8BswSy', 'ssar@nate.com', '01011112222');
insert into user_tb(`id`, `username`, `password`, `email`, `phone_number`) values(2, 'cos', '$2a$12$gFkBm3dupjTADJ.zRV.hwOW27XEA8tusg/sVaJtIxI.94Tq8BswSy', 'cos@nate.com','01011112222');
insert into user_tb(`id`, `username`, `password`, `email`, `phone_number`) values(3, 'love', '$2a$12$gFkBm3dupjTADJ.zRV.hwOW27XEA8tusg/sVaJtIxI.94Tq8BswSy', 'love@nate.com','01011112222');
insert into user_tb(`id`, `username`, `password`, `email`, `phone_number`) values(4, 'tom', '$2a$12$gFkBm3dupjTADJ.zRV.hwOW27XEA8tusg/sVaJtIxI.94Tq8BswSy', 'tom@nate.com','01011112222');
insert into user_tb(`id`, `username`, `password`, `email`, `phone_number`) values(5, 'lisa', '$2a$12$gFkBm3dupjTADJ.zRV.hwOW27XEA8tusg/sVaJtIxI.94Tq8BswSy', 'lisa@nate.com','01011112222');


--예약
-- INSERT INTO reservation_tb(`id`,`user_id`,`reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`)VALUES (1,1,153,'예정',1,'2024-08-28 00:13:24',220270,'2023-11-12 06:51:24');
-- INSERT INTO reservation_tb(`id`,`user_id`,`reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`)VALUES (2,1,104,'지난',3,'2024-03-26 00:35:28',426820,'2023-11-24 04:02:28');
-- INSERT INTO reservation_tb(`id`,`user_id`,`reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`)VALUES (3,1,364,'취소',1,'2024-03-14 11:02:06',290400,'2023-12-01 18:50:06');
INSERT INTO reservation_tb(`id`,`user_id`,`res_name`, `email`, `phone_num`, `reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`)VALUES (1,1,'ssar','ssar@nate.com','01011112222','153','예정',1,'2024-08-28 00:13:24',220270,'2023-11-12 06:51:24');
INSERT INTO reservation_tb(`id`,`user_id`,`res_name`, `email`, `phone_num`, `reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`)VALUES (2,1,'cos','cos@nate.com','01011112222','104','지난',3,'2024-03-26 00:35:28',426820,'2023-11-24 04:02:28');
INSERT INTO reservation_tb(`id`,`user_id`,`res_name`, `email`, `phone_num`, `reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`)VALUES (3,1,'love','love@nate.com','01011112222','364','취소',1,'2024-03-14 11:02:06',290400,'2023-12-01 18:50:06');

--티켓

INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES(1,1,36050,20430,10000,18305,926560,'KAL','KE112','CJU','SYD','2024-03-21 21:34:06','2023-10-10 08:17:01','CJU','SYD','일반석',false,true,37,'2023-09-18 10:38:26');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES(2,2,38080,22370,10000,11830,123980,'KAL','KE112','GMP','SYD','2023-03-09 03:07:54','2024-02-06 14:31:15','GMP','SYD','일반석',false,true,29,'2023-03-01 18:48:37');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES(3,2,47440,20150,10000,9090,457890,'KAL','KE112','GMP','SYD','2023-11-01 02:55:18','2023-01-06 07:37:39','GMP','SYD','일반석',true,false,38,'2023-03-13 00:41:58');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES(4,2,41050,14150,10000,9870,498430,'KAL','KE112','PUS','SYD','2024-09-25 01:36:18','2024-03-06 03:57:13','PUS','SYD','일반석',false,false,24,'2024-01-29 18:49:47');
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


-- 도시 서울, 김포, 제주, 광주, 대구, 청주, 여수
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(1,'SEL','서울','대한민국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(2,'GMP','김포','대한민국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(3,'CJU','제주','대한민국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(4,'KWJ','광주','대한민국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(5,'TAE','대구','대한민국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(6,'CJJ','청주','대한민국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(7,'RSU','여수','대한민국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(8,'TYO','도쿄','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(9,'OSA','오사카','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(10,'FUK','후쿠오카','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(11,'SPK','삿포로','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(12,'OKA','오키나와','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(13,'NGO','나고야','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(14,'KMJ','구마모토','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(15,'KKJ','기타큐슈','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(16,'BKK','방콕/수완나품','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(17,'DAD','다낭','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(18,'SGN','호치민','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(19,'MNL','마닐라','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(20,'CXR','나트랑','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(21,'CEB','세부','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(22,'SIN','싱가포르','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(23,'CNX','치앙마이','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(24,'BKI','코타키나발루','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(25,'HKT','푸켓','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(26,'HAN','하노이','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(27,'DFW','댈러스','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(28,'LAS','라스베이거스','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(29,'LAX','로스앤젤레스','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(30,'YVR','밴쿠버','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(31,'SFO','샌프란시스코','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(32,'NYC','뉴욕','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(33,'YTO','토론토','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(34,'HNL','호놀룰루(하와이)','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(35,'LON','런던','유럽');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(36,'ROM','로마','유럽');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(37,'BCN','바르셀로나','유럽');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(38,'AMS','암스테르담','유럽');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(39,'BUD','부다페스트','유럽');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(40,'IST','이스탄불','유럽');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(41,'PAR','파리','유럽');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(42,'PGR','프라하','유럽');--대양주/괌 & 중동 &중남미 & 아프리카 & 중국
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(43,'GUM','괌','대양주/괌');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(44,'MEL','멜버른','대양주/괌');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(45,'SYD','시드니','대양주/괌');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(46,'SPN','사이판','대양주/괌');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(47,'AUH','아부다비','중동');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(48,'TLV','텔아비브','중동');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(49,'DOH','도하','중동');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(50,'DXB','두바이','중동');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(51,'SAO','상파울로','중남미');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(52,'CUN','칸쿤','중남미');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(53,'SCL','산티아고','중남미');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(54,'HAV','하바나','중남미');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(55,'NBO','나이로비','아프리카');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(56,'CPT','케이프타운','아프리카');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(57,'CAI','카이로','아프리카');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(58,'MRU','모리셔스','아프리카');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(59,'BJS','북경','중국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(60,'PVG','상해/푸동','중국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(61,'TAO','청도','중국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(62,'CTU','성도/솽류','중국');


