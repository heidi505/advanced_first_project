--유저
insert into user_tb(`id`, `username`, `password`, `email`, `phone_number`, `real_name`) values(1, 'ssar', '$2a$12$gFkBm3dupjTADJ.zRV.hwOW27XEA8tusg/sVaJtIxI.94Tq8BswSy', 'ssar@nate.com', '01044541176', '김하얀');
insert into user_tb(`id`, `username`, `password`, `email`, `phone_number`, `real_name`) values(2, 'cos', '$2a$12$gFkBm3dupjTADJ.zRV.hwOW27XEA8tusg/sVaJtIxI.94Tq8BswSy', 'cos@nate.com','01030184609', '이은지');
insert into user_tb(`id`, `username`, `password`, `email`, `phone_number`, `real_name`) values(3, 'love', '$2a$12$gFkBm3dupjTADJ.zRV.hwOW27XEA8tusg/sVaJtIxI.94Tq8BswSy', 'love@nate.com','01011112222', '김승신');
insert into user_tb(`id`, `username`, `password`, `email`, `phone_number`, `real_name`) values(4, 'tom', '$2a$12$gFkBm3dupjTADJ.zRV.hwOW27XEA8tusg/sVaJtIxI.94Tq8BswSy', 'tom@nate.com','01030184609', '성민경');
insert into user_tb(`id`, `username`, `password`, `email`, `phone_number`, `real_name`) values(5, 'lisa', '$2a$12$gFkBm3dupjTADJ.zRV.hwOW27XEA8tusg/sVaJtIxI.94Tq8BswSy', 'lisa@nate.com','01011112222', '차은우');

insert into user_tb(`id`, `username`, `password`, `email`, `phone_number`, `is_admin`) values(6, 'admin1', '$2a$12$gFkBm3dupjTADJ.zRV.hwOW27XEA8tusg/sVaJtIxI.94Tq8BswSy', 'admin1@nate.com','01033334444','true');
insert into user_tb(`id`, `username`, `password`, `email`, `phone_number`, `is_admin`) values(7, 'admin2', '$2a$12$gFkBm3dupjTADJ.zRV.hwOW27XEA8tusg/sVaJtIxI.94Tq8BswSy', 'admin2@nate.com','01033334444','true');



--예약
-- INSERT INTO reservation_tb(`id`,`user_id`,`reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`)VALUES (1,1,153,'예정',1,'2024-08-28 00:13:24',220270,'2023-11-12 06:51:24');
-- INSERT INTO reservation_tb(`id`,`user_id`,`reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`)VALUES (2,1,104,'지난',3,'2024-03-26 00:35:28',426820,'2023-11-24 04:02:28');
-- INSERT INTO reservation_tb(`id`,`user_id`,`reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`)VALUES (3,1,364,'취소',1,'2024-03-14 11:02:06',290400,'2023-12-01 18:50:06');
INSERT INTO reservation_tb(`id`,`user_id`,`res_name`, `email`, `phone_num`, `reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`,`is_payed`)VALUES (1,1,'ssar','ssar@nate.com','01011112222','153','예정',1,'2024-08-28 00:13:24',220270,'2023-11-12 06:51:24','true');
INSERT INTO reservation_tb(`id`,`user_id`,`res_name`, `email`, `phone_num`, `reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`,`is_payed`)VALUES (2,1,'이은지','cos@nate.com','01011112222','104','지난',3,'2024-03-26 00:35:28',426820,'2023-11-24 04:02:28','true');
INSERT INTO reservation_tb(`id`,`user_id`,`res_name`, `email`, `phone_num`, `reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`,`is_payed`)VALUES (3,1,'love','love@nate.com','01011112222','364','취소',1,'2024-03-14 11:02:06',290400,'2023-12-01 18:50:06','false');
INSERT INTO reservation_tb(`id`,`user_id`,`res_name`, `email`       , `phone_num`, `reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`,`is_payed`)VALUES(4,1,'cos','cos@nate.com','01011112222','162','지난',3,'2021-12-28 00:13:23',450540,'2021-12-15 05:48:23','true');
INSERT INTO reservation_tb(`id`,`user_id`,`res_name`, `email`, `phone_num`, `reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`,`reservation_price`,`created_at`,`is_payed`)
VALUES(5,1,'ssar','ssar@nate.com','01011112222','163','예정',1,'2024-09-23 00:13:23',450540,'2023-12-15 05:48:23','false');
INSERT INTO reservation_tb(`id`,`user_id`,`res_name`, `email`, `phone_num`, `reservation_num`,`status_enum`,`passenger_amount`,`payment_deadline`, `reservation_price`, `created_at`, `is_payed`)
VALUES
    (6, 1, 'ssar', 'ssar@example.com', '01012341234', '182', '예정', 2, '2024-12-01 08:30:45', 320000, '2024-10-25 10:11:35', 'false'),
    (7, 1, 'love', 'love@example.com', '01012341234', '183', '지난', 1, '2020-09-05 12:37:48', 420000, '2020-09-06 12:37:48 10:20:35', 'true'),
    (8, 1, '이은지', 'cos@example.com', '01023452345', '184', '지난', 1, '2023-12-15 15:45:20', 120000, '2023-12-25 12:45:18', 'true'),
    (9, 1, 'love', 'love@example.com', '01034563456', '185', '취소', 1, '2023-01-05 18:10:55', 600000, '2023-12-26 09:55:42', 'false'),
    (10, 1, 'tom', 'tom@example.com', '01045674567', '186', '지난', 1, '2022-01-20 22:30:10', 250000, '2022-12-26 15:30:27', 'true'),
    (11, 1, 'tom', 'tom@example.com', '01045674567', '187', '지난', 1, '2022-02-20 22:30:10', 250000, '2022-11-23 15:30:27', 'true'),
    (12, 1, 'tom', 'tom@example.com', '01045674567', '188', '지난', 2, '2021-03-20 22:30:10', 250000, '2021-05-26 15:30:27', 'true'),
    (13, 1, 'lisa', 'lisa@example.com', '01056785678', '189', '취소', 1, '2025-02-10 04:55:50', 420000, '2023-12-27 07:40:15', 'false'),
    (14, 1, 'ssar', 'ssar@example.com', '01067896789', '190', '취소', 1, '2021-02-25 12:20:05', 750000, '2021-12-27 11:10:33', 'false'),
    (15, 1, 'ssar', 'ssar@example.com', '01067896789', '191', '취소', 1, '2022-02-25 12:20:05', 750000, '2022-12-27 11:10:33', 'false'),
    (16, 1, 'ssar', 'ssar@example.com', '01067896789', '192', '취소', 1, '2022-02-25 12:20:05', 750000, '2022-12-27 11:10:33', 'false'),
    (17, 1, 'ssar', 'ssar@example.com', '01067896789', '193', '취소', 1, '2023-02-25 12:20:05', 750000, '2023-12-27 11:10:33', 'false');
-- 티켓
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES(1,1,36050,20430,10000,18305,926560,'KE','KE112','GMP','TYO','2023-12-30 21:34:06','2023-12-31 08:17:01','GMP','NRT','일반석',false,true,37,'2023-09-18 10:38:26');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES(2,2,38080,22370,10000,11830,123980,'KE','KE112','GMP','SYD','2023-03-09 03:07:54','2024-02-06 14:31:15','GMP','SYD','일반석',false,true,29,'2023-03-01 18:48:37');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES(3,2,38080,22370,10000,11830,123980,'KE','KE112','GMP','SYD','2023-03-09 03:07:54','2024-02-06 14:31:15','GMP','SYD','일반석',false,true,29,'2023-03-01 18:48:37');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES(4,2,38080,22370,10000,11830,123980,'KE','KE112','GMP','SYD','2023-03-09 03:07:54','2024-02-06 14:31:15','GMP','SYD','일반석',false,true,29,'2023-03-01 18:48:37');
-- INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
-- VALUES(3,2,47440,20150,10000,9090,457890,'KE','KE112','GMP','SYD','2023-11-01 02:55:18','2023-01-06 07:37:39','GMP','SYD','일반석',true,false,38,'2023-03-13 00:41:58');
-- INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
-- VALUES(4,2,41050,14150,10000,9870,498430,'KE','KE112','PUS','SYD','2024-09-25 01:36:18','2024-03-06 03:57:13','PUS','SYD','일반석',false,false,24,'2024-01-29 18:49:47');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES(5,3,47190,15820,10000,8010,962670,'KE','KE112','ICN','SYD','2023-04-17 20:07:24','2023-12-15 16:18:18','ICN','SYD','일반석',false,false,31,'2022-12-21 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`,`arrival_time`,`departure_airport`,`arrival_airport`,`seat_type`,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES  (6,4,57190,25820,30000,7022,962270,'OZ','OZ112','SEL','CJU','2021-12-28 04:24:11','2021-12-29 16:18:18','GMP','CJU','비즈니스',true,false,32,'2021-12-21 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES                  (7   ,4               ,57190     ,25820           ,30000   ,7022          ,962270       ,'OZ'     ,'OZ112'
                        ,'SEL'           ,'CJU'         ,'2021-12-28 04:24:11','2021-12-29 16:18:18','GMP'              ,'CJU'            ,'비즈니스'
                        ,true       ,false        ,32                 ,'2021-12-21 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`)
VALUES                  (8   ,4               ,57190     ,25820           ,30000   ,7022          ,962270       ,'OZ'     ,'OZ112'
                        ,'SEL'           ,'CJU'         ,'2021-12-28 04:24:11','2021-12-29 16:18:18','GMP'              ,'CJU'            ,'비즈니스'
                        ,true       ,false        ,32                 ,'2021-12-21 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`) values
    (9   ,5               ,50200     ,27900           ,50000   ,77200          ,873270       ,'OZ'     ,'OZ112'
    ,'SEL'           ,'CJU'         ,'2024-01-28 04:24:11','2024-01-29 16:18:18','GMP'              ,'CJU'            ,'일반석'
    ,false       ,false        ,42                 ,'2023-12-21 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`) values
    (10   ,6               ,50200     ,27900           ,50000   ,77200          ,873270       ,'OZ'     ,'OZ112'
    ,'SEL'           ,'CJU'         ,'2024-02-28 04:24:11','2024-02-29 16:18:18','GMP'              ,'CJU'            ,'일반석'
    ,false       ,false        ,42                 ,'2023-12-21 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`) values
    (11   ,6               ,50200     ,27900           ,50000   ,77200          ,873270       ,'OZ'     ,'OZ112'
    ,'SEL'           ,'CJU'         ,'2024-02-28 04:24:11','2024-02-29 16:18:18','GMP'              ,'CJU'            ,'일반석'
    ,false       ,false        ,42                 ,'2023-01-21 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`) values
    (12   ,7               ,50200     ,27900           ,50000   ,77200          ,873270       ,'OZ'     ,'OZ112'
    ,'SEL'           ,'CJU'         ,'2022-01-28 04:24:11','2022-01-29 16:18:18','GMP'              ,'CJU'            ,'일반석'
    ,false       ,false        ,42                 ,'2021-01-21 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`) values
    (13   ,8               ,50200     ,27900           ,50000   ,77200          ,873270       ,'OZ'     ,'OZ112'
    ,'SEL'           ,'CJU'         ,'2021-12-28 04:24:11','2021-12-29 16:18:18','GMP'              ,'CJU'            ,'일반석'
    ,false       ,false        ,42                 ,'2021-12-21 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`) values
    (14   ,9               ,50200     ,27900           ,50000   ,77200          ,873270       ,'OZ'     ,'OZ112'
    ,'SEL'           ,'CJU'         ,'2021-11-28 04:24:11','2021-11-29 16:18:18','GMP'              ,'CJU'            ,'일반석'
    ,false       ,false        ,42                 ,'2021-11-20 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`) values
    (15   ,10               ,50200     ,27900           ,50000   ,77200          ,873270       ,'JL'     ,'JL112'
    ,'SEL'           ,'OSA'         ,'2023-09-28 04:24:11','2023-09-29 16:18:18','GMP'              ,'KIX'            ,'일반석'
    ,false       ,false        ,42                 ,'2023-09-20 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`) values
    (16   ,11               ,50200     ,27900           ,50000   ,77200          ,873270       ,'OZ'     ,'OZ112'
    ,'SEL'           ,'CJU'         ,'2023-08-28 04:24:11','2023-08-29 16:18:18','GMP'              ,'CJU'            ,'일반석'
    ,false       ,false        ,42                 ,'2023-08-20 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`) values
    (17   ,12               ,50200     ,27900           ,50000   ,77200          ,873270       ,'7C'     ,'7C112'
    ,'SEL'           ,'CJU'         ,'2022-07-28 04:24:11','2022-07-29 16:18:18','GMP'              ,'CJU'            ,'일반석'
    ,false       ,false        ,42                 ,'2022-11-20 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`) values
    (18   ,12               ,50200     ,27900           ,50000   ,77200          ,873270       ,'7C'     ,'7C112'
    ,'SEL'           ,'CJU'         ,'2022-07-28 04:24:11','2022-07-29 16:18:18','GMP'              ,'CJU'            ,'일반석'
    ,false       ,false        ,42                 ,'2022-11-20 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`) values
    (19   ,13               ,50200     ,27900           ,50000   ,77200          ,873270       ,'OZ'     ,'OZ112'
    ,'SEL'           ,'CJU'         ,'2022-06-28 04:24:11','2022-06-29 16:18:18','GMP'              ,'CJU'            ,'일반석'
    ,false       ,false        ,42                 ,'2022-10-20 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`) values
    (20   ,14               ,50200     ,27900           ,50000   ,77200          ,873270       ,'OZ'     ,'OZ112'
    ,'SEL'           ,'CJU'         ,'2022-06-28 04:24:11','2022-06-29 16:18:18','GMP'              ,'CJU'            ,'일반석'
    ,false       ,false        ,42                 ,'2022-10-20 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`) values
    (21   ,15               ,50200     ,27900           ,50000   ,77200          ,873270       ,'7C'     ,'7C112'
    ,'SEL'           ,'CJU'         ,'2023-06-28 05:38:11','2023-06-29 07:20:18','GMP'              ,'CJU'            ,'일반석'
    ,false       ,false        ,42                 ,'2023-5-20 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`) values
    (22   ,16               ,50200     ,27900           ,50000   ,77200          ,873270       ,'OZ'     ,'OZ112'
    ,'SEL'           ,'CJU'         ,'2023-07-28 11:24:11','2023-07-29 13:18:18','GMP'              ,'CJU'            ,'일반석'
    ,false       ,false        ,42                 ,'2022-6-20 06:53:04');
INSERT INTO `ticket_tb` (`id`,`reservation_id`,`air_fare`,`fuel_surcharge`,`taxes`,`ticketing_fee`,`total_price`,`airline`,`flight_name`
                        ,`departure_city`,`arrival_city`,`departure_time`     ,`arrival_time`       ,`departure_airport`,`arrival_airport`,`seat_type`
                        ,`is_one_way`,`is_non_stop`,`baggage_allowance`,`created_at`) values
    (23   ,17               ,50200     ,27900           ,50000   ,77200          ,873270       ,'OZ'     ,'OZ112'
    ,'SEL'           ,'CJU'         ,'2024-01-28 11:24:11','2024-01-29 13:18:18','GMP'              ,'CJU'            ,'일반석'
    ,false       ,false        ,42                 ,'2024-1-11 06:53:04');

-- 승객
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (1,1,'hayan','Kim','12/15/1995','여성','성인','2023-11-04 17:59:57');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (2,2,'minkyoung','Sung','05/28/1996','남성','성인','2023-09-05 16:42:07');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (3,2,'eunji','Lee','11/13/1991','여성','성인','2023-11-15 13:47:25');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (4,2,'seungshin','Kim','12/09/1991','남성','성인','2023-09-30 23:03:00');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (5,3,'hayan','Kim','12/05/1995','여성','성인','2023-11-12 18:34:31');

INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (6,4,'minkyoung','Sung','05/28/1996','남성','성인','2023-08-25 13:11:03');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (7,4,'eunji','Lee','11/13/1991','여성','성인','2023-11-15 13:47:25');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (8,4,'seungshin','Kim','12/09/1991','남성','성인','2023-09-30 23:03:00');

INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (9,5,'hayan','Kim','12/05/1995','여성','성인','2023-11-12 18:34:31');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (10,6,'hayan','Kim','12/05/1995','여성','성인','2023-11-12 18:34:31');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (11,6,'minkyoung','Sung','05/28/1996','남성','성인','2021-09-05 16:42:07');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (12,7,'minkyoung','Sung','05/28/1996','남성','성인','2021-09-05 16:42:07');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (13,8,'seungshin','Kim','12/09/1991','남성','성인','2023-09-30 23:03:00');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (14,9,'seungshin','Kim','12/09/1991','남성','성인','2023-09-30 23:03:00');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (15,10,'seungshin','Kim','12/09/1991','남성','성인','2023-09-30 23:03:00');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (16,11,'eunji','Lee','11/13/1991','여성','성인','2023-11-15 13:47:25');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (17,12,'hayan','Kim','12/15/1995','여성','성인','2023-11-04 17:59:57');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (18,12,'minkyoung','Sung','05/28/1996','남성','성인','2023-09-05 16:42:07');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (19,13,'minkyoung','Sung','05/28/1996','남성','성인','2023-09-05 16:42:07');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (20,14,'eunji','Lee','11/13/1991','여성','성인','2023-11-15 13:47:25');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (21,15,'eunji','Lee','11/13/1991','여성','성인','2023-11-15 13:47:25');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (22,16,'eunji','Lee','11/13/1991','여성','성인','2023-11-15 13:47:25');
INSERT INTO `passenger_tb` (`id`,`reservation_id`,`first_name`,`last_name`,`birth_date`,`gender`,`passenger_type`,`created_at`)VALUES (23,17,'eunji','Lee','11/13/1991','여성','성인','2023-11-15 13:47:25');
-- 검색
INSERT INTO `searched_tb` (`id`,`user_id`,`is_one_way`,`departure_city`,`arrival_city`,`start_date`,`end_date`,`travel_class`,`created_at`,`adults`,`children`,`infants`)
VALUES(1,1,true,'SYD','BKK','2024-09-14','2024-09-15','일반석','2024-09-14 15:20:02',1,0,0);
INSERT INTO `searched_tb` (`id`,`user_id`,`is_one_way`,`departure_city`,`arrival_city`,`start_date`,`end_date`,`travel_class`,`created_at`,`adults`,`children`,`infants`)
VALUES(2,1,true,'ICN','BKK','2023-12-24','2023-12-05','일반석','2024-02-29 13:24:00',2,0,0);
INSERT INTO `searched_tb` (`id`,`user_id`,`is_one_way`,`departure_city`,`arrival_city`,`start_date`,`end_date`,`travel_class`,`created_at`,`adults`,`children`,`infants`)
VALUES(3,2,true,'ICN','PUS','2024-11-30','2023-12-06','일반석','2024-02-23 11:07:42',2,1,1);
INSERT INTO `searched_tb` (`id`,`user_id`,`is_one_way`,`departure_city`,`arrival_city`,`start_date`,`end_date`,`travel_class`,`created_at`,`adults`,`children`,`infants`)
VALUES(4,3,false,'ICN','BKK','2024-01-21','2023-12-05','일반석','2023-02-02 16:26:54',7,0,0);
INSERT INTO `searched_tb` (`id`,`user_id`,`is_one_way`,`departure_city`,`arrival_city`,`start_date`,`end_date`,`travel_class`,`created_at`,`adults`,`children`,`infants`)
VALUES(5,4,false,'PUS','ICN','2024-01-29','2023-12-05','일반석','2023-05-26 04:49:11',1,1,0);

-- 쿠폰
-- INSERT INTO `coupon_tb`(`id`,`coupon_name`,`coupon_period`,`discounting_price`)VALUES (1,'가입 축하 쿠폰',30,10000);
-- INSERT INTO `coupon_tb`(`id`,`coupon_name`,`coupon_period`,`discounting_price`)VALUES (2,'연말 감사 쿠폰',30,20000);
-- INSERT INTO `coupon_tb`(`id`,`coupon_name`,`coupon_period`,`discounting_price`)VALUES (3,'직원 할인 쿠폰',30,50000);
--

INSERT INTO `coupon_tb`(`id`, `user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (1, 3,'가입 축하 쿠폰', 30, 10000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 2134126, 'true', '2023-09-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`, `user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (4, 2, '가입 축하 쿠폰', 30, 10000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 2134126, 'true', '2023-09-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`,`user_id`, `coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (2,4,'연말 감사 쿠폰', 30, 20000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 2280777, 'false', '2023-08-01','2024-12-23');
INSERT INTO `coupon_tb`(`id`,`user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (3,5, '직원 할인 쿠폰', 30, 50000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 5389211, 'true', '2023-11-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`,`user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (5,1,'직원 할인 쿠폰1', 30, 50000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 5389211, 'false', '2023-11-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`,`user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (6,1,'직원 할인 쿠폰2', 30, 40000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 5389211, 'false', '2023-11-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`,`user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (7,5, '직원 할인 쿠폰', 30, 50000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 5389211, 'true', '2023-11-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`,`user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (8,1,'직원 할인 쿠폰1', 30, 50000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 5389211, 'false', '2023-11-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`,`user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (9,1,'직원 할인 쿠폰2', 30, 40000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 5389211, 'false', '2023-11-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`,`user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (10,5, '직원 할인 쿠폰', 30, 50000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 5389211, 'true', '2023-11-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`,`user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (11,1,'직원 할인 쿠폰1', 30, 50000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 5389211, 'false', '2023-11-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`,`user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (12,1,'직원 할인 쿠폰2', 30, 40000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 5389211, 'false', '2023-11-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`,`user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (13,5, '직원 할인 쿠폰', 30, 50000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 5389211, 'true', '2023-11-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`,`user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (14,1,'직원 할인 쿠폰1', 30, 50000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 5389211, 'false', '2023-11-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`,`user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (15,1,'직원 할인 쿠폰2', 30, 40000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 5389211, 'false', '2023-11-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`,`user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (16,5, '직원 할인 쿠폰', 30, 50000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 5389211, 'true', '2023-11-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`,`user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (17,1,'직원 할인 쿠폰1', 30, 50000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 5389211, 'false', '2023-11-01','2024-01-23');
INSERT INTO `coupon_tb`(`id`,`user_id`,`coupon_name`,`coupon_period`,`discounting_price`, `coupon_content`,`coupon_number`, `is_used`,`created_at` , expired_at)VALUES (18,2,'직원 할인 쿠폰2', 30, 40000, '신규 가입 회원님께 가입 축하 쿠폰을 증정해드리겠습니다', 5389211, 'false', '2023-11-01','2024-01-23');

-- hasCoupon
-- INSERT INTO `hascoupon_tb`(`id`,`user_id`,`coupon_id`,`is_used`,`coupon_number`,`created_at`,`expired_at`)VALUES (1,1,1,true,21341,'2023-09-01 14:44:37','2024-01-23 06:15:22');
-- INSERT INTO `hascoupon_tb`(`id`,`user_id`,`coupon_id`,`is_used`,`coupon_number`,`created_at`,`expired_at`)VALUES (2,1,2,false,22807,'2023-10-07 09:58:22','2024-06-28 21:19:03');
-- INSERT INTO `hascoupon_tb`(`id`,`user_id`,`coupon_id`,`is_used`,`coupon_number`,`created_at`,`expired_at`)VALUES (3,1,3,false,24717,'2023-08-21 00:54:04','2023-12-22 15:25:37');
-- INSERT INTO `hascoupon_tb`(`id`,`user_id`,`coupon_id`,`is_used`,`coupon_number`,`created_at`,`expired_at`)VALUES (4,2,2,true,10901,'2023-08-14 09:49:34','2024-03-22 13:23:33');
-- INSERT INTO `hascoupon_tb`(`id`,`user_id`,`coupon_id`,`is_used`,`coupon_number`,`created_at`,`expired_at`)VALUES (5,3,1,false,15576,'2023-08-01 12:10:14','2024-12-01 23:44:38');

INSERT INTO `hascoupon_tb`(`id`,`user_id`,`coupon_id`)VALUES (1,1,1);
INSERT INTO `hascoupon_tb`(`id`,`user_id`,`coupon_id`)VALUES (2,2,2);
INSERT INTO `hascoupon_tb`(`id`,`user_id`,`coupon_id`)VALUES (3,3,3);

-- 공지
insert into `notice_tb`(`id`,`title`,`content`, `created_at`)VALUES(1,'유류할증료 인상 안내','유류 할증료가 인상됩니다', now());
insert into `notice_tb`(`id`,`title`,`content`, `created_at`)VALUES(2,'파격 이벤트 안내','이벤트 참여하면 어쩌구', now());

-- 배너
-- insert into `banner_tb`(`id`, `banner_type`,)

-- 도시 서울, 김포, 제주, 광주, 대구, 청주, 여수
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(1,'SEL','서울','대한민국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(2,'GMP','김포','대한민국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(3,'PUS','부산','대한민국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(4,'CJU','제주','대한민국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(5,'KWJ','광주','대한민국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(6,'TAE','대구','대한민국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(7,'CJJ','청주','대한민국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(8,'RSU','여수','대한민국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(9,'TYO','도쿄','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(10,'OSA','오사카','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(11,'FUK','후쿠오카','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(12,'SPK','삿포로','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(13,'OKA','오키나와','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(14,'NGO','나고야','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(15,'KMJ','구마모토','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(16,'KKJ','기타큐슈','일본');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(17,'BKK','방콕/수완나품','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(18,'DAD','다낭','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(19,'SGN','호치민','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(20,'MNL','마닐라','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(21,'CXR','나트랑','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(22,'CEB','세부','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(23,'SIN','싱가포르','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(24,'CNX','치앙마이','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(25,'BKI','코타키나발루','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(26,'HKT','푸켓','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(27,'HAN','하노이','아시아');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(28,'DFW','댈러스','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(29,'LAS','라스베이거스','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(30,'LAX','로스앤젤레스','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(31,'YVR','밴쿠버','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(32,'SFO','샌프란시스코','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(33,'NYC','뉴욕','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(34,'YTO','토론토','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(35,'HNL','호놀룰루(하와이)','미주');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(36,'LON','런던','유럽');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(37,'ROM','로마','유럽');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(38,'BCN','바르셀로나','유럽');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(39,'AMS','암스테르담','유럽');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(40,'BUD','부다페스트','유럽');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(41,'IST','이스탄불','유럽');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(42,'PAR','파리','유럽');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(43,'PGR','프라하','유럽');--대양주/괌 & 중동 &중남미 & 아프리카 & 중국
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(44,'GUM','괌','대양주/괌');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(45,'MEL','멜버른','대양주/괌');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(46,'SYD','시드니','대양주/괌');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(47,'SPN','사이판','대양주/괌');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(48,'AUH','아부다비','중동');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(49,'TLV','텔아비브','중동');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(50,'DOH','도하','중동');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(51,'DXB','두바이','중동');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(52,'SAO','상파울로','중남미');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(53,'CUN','칸쿤','중남미');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(54,'SCL','산티아고','중남미');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(55,'HAV','하바나','중남미');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(56,'NBO','나이로비','아프리카');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(57,'CPT','케이프타운','아프리카');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(58,'CAI','카이로','아프리카');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(59,'MRU','모리셔스','아프리카');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(60,'BJS','북경','중국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(61,'PVG','상해/푸동','중국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(62,'TAO','청도','중국');
insert into `city_tb`(`id`,`city_code`,`city_name`, `country_name`)VALUES(63,'CTU','성도/솽류','중국');


-- iata 도시 코드
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(1,'SEL','서울','한국');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(2,'PUS','부산','한국');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(3,'CJU','제주','한국');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(4,'TAE','대구','한국');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(5,'CJJ','청주','한국');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(6,'KWJ','광주','한국');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(7,'RSU','여수','한국');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(8,'USN','울산','한국');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(9,'TYO','도쿄','일본');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(10,'OSA','오사카','일본');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(11,'NGO','나고야','일본');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(12,'KIJ','니가타','일본');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(13,'SDJ','나토리','일본');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(14,'FUK','후쿠오카','일본');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(15,'SPK','삿포로','일본');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(16,'HKD','하코다테','일본');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(17,'KMJ','마시키','일본');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(18,'KKJ','기타큐슈','일본');
insert into `iata_city_tb`(`id`,`code`,`name`,`country_name`) VALUES(19,'KOJ','가고시마','일본');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(20,'BKK','방콕/수완나품','태국');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(21,'DAD','다낭','베트남');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(22,'SGN','호치민','베트남');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(23,'MNL','마닐라','필리핀');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(24,'CXR','나트랑','베트남');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(25,'CEB','세부','필리핀');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(26,'SIN','싱가포르','싱가포르');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(27,'CNX','치앙마이','태국');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(28,'BKI','코타키나발루','말레이시아');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(29,'HKT','푸켓','태국');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(30,'HAN','하노이','베트남');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(31,'DFW','댈러스','미국');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(32,'LAS','라스베이거스','미국');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(33,'LAX','로스앤젤레스','미국');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(34,'YVR','밴쿠버','캐나다');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(35,'SFO','샌프란시스코','미국');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(36,'NYC','뉴욕','미국');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(37,'YTO','토론토','캐나다');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(38,'HNL','호놀룰루','하와이');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(39,'LON','런던','영국');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(40,'ROM','로마','이탈리아');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(41,'BCN','바르셀로나','스페인');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(42,'AMS','암스테르담','네덜란드');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(43,'BUD','부다페스트','헝가리');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(44,'IST','이스탄불','터키');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(45,'PAR','파리','프랑스');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(46,'PGR','프라하','체코');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(47,'GUM','괌','괌');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(48,'MEL','멜버른','호주');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(49,'SYD','시드니','호주');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(50,'SPN','사이판','사이판');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(51,'AUH','아부다비','아랍에미리트');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(52,'TLV','텔아비브','이스라엘');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(53,'DOH','도하','카타르');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(54,'DXB','두바이','아랍에미리트');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(55,'SAO','상파울로','브라질');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(56,'CUN','칸쿤','멕시코');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(57,'SCL','산티아고','칠레');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(58,'HAV','하바나','쿠바');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(59,'NBO','나이로비','케냐');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(60,'CPT','케이프타운','남아프리카 공화국');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(61,'CAI','카이로','이집트');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(62,'MRU','모리셔스','모리셔스');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(63,'BJS','북경','중국');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(64,'PVG','상해/푸동','중국');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(65,'TAO','청도','중국');
insert into `iata_city_tb`(`id`,`code`,`name`, `country_name`)VALUES(66,'CTU','성도/솽류','중국');

--iata 공항 코드

insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(1,'ICN','인천','서울','한국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(2,'GMP','김포','서울','한국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(3,'PUS','김해','부산','한국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(4,'CJU','제주','제주','한국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(5,'CJJ','청주','청주','한국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(6,'KWJ','광주','광주','한국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(7,'RSU','여수','여수','한국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(8,'TAE','대구','대구','한국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(9,'HND','하네다','도쿄','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(10,'NRT','나리타','도쿄','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(11,'KIX','간사이','오사카','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(12,'ITM','이타미','오사카','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(13,'NGO','나고야','나고야','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(14,'NKM','고마키','나고야','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(15,'KIJ','니가타','니가타','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(16,'SDJ','센다이','센다이','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(17,'UKB','고베','고베','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(18,'FUK','후쿠오카','후쿠오카','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(19,'IBR','이바라키','이바라키','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(20,'MYJ','마쓰야마','마쓰야마','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(21,'FSZ','시즈오카','시즈오카','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(22,'CTS','신치토세','신치토세','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(23,'OKD','오카다마','삿포로','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(24,'AKJ','아사히카와','아사히카와','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(25,'HKD','하코다테','하코다테','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(26,'KMJ','구마모토','구마모토','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(27,'KKJ','키타큐슈','키타큐슈','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(28,'KOJ','가고시마공항','가고시마','일본');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(29,'BKK','수완나품공항','방콕','태국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(30,'DMK','돈므앙공항','방콕','태국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(31,'CNX','치앙마이공항','치앙마이','태국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(32,'HKT','푸켓공항','푸켓','태국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(33,'DAD','다낭공항','다낭','베트남');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(34,'PQX','푸꾸옥공항','푸꾸옥','베트남');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(35,'HAN','노이바이공항','하노이','베트남');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(36,'SIN','창이공항','싱가포르','싱가포르');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(37,'KUL','쿠알라룸푸르공항','쿠알라룸푸르','말레이시아');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(38,'BKI','코타키나발루공항','코타키나발루','말레이시아');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(39,'LGK','랑카위공항','랑카위','말레이시아');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(40,'MNL','니노이이카노 공항','마닐라','필리핀');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(41,'CEB','막탄 세부공항','세부','필리핀');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(42,'MEL','멜버른공항','멜버른','호주');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(43,'BNE','브리즈번공항','브리즈번','호주');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(44,'SYD','시드니공항','시드니','호주');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(45,'PER','퍼스공항','퍼스','호주');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(46,'JFK','존.F 케네디 공항','뉴욕','미국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(47,'EWR','뉴어크 리버티 공항','뉴욕','미국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(48,'LAX','로스앤젤레스 공항','로스앤젤레스','미국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(49,'SFO','샌프란시스코공항','샌프란시스코','미국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(50,'IAD','댈러스 공항','워싱턴','미국');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(51,'HNL','호놀룰루 공항','하와이','하와이');
insert into `iata_airport_tb`(`id`,`code`,`name`,`city_name`,`country_name`) VALUES(52,'GUM','안토니오 B. 원 팻 공항','괌','괌');


--iata 항공사 코드
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(1,'7C','제주항공');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(2,'H1','한에어');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(3,'KE','대한항공');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(4,'OZ','아시아나');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(5,'NH','ANA항공');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(6,'VJ','비엣젯항공');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(7,'JL','일본항공');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(8,'VN','베트남항공');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(9,'MU','중국동방항공');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(10,'SQ','싱가폴항공');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(11,'7G','스타플라이어');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(12,'TG','타이항공');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(13,'UO','홍콩 익스프레스');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(14,'TW','티웨이항공');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(15,'PR','필리핀항공');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(16,'CI','중화항공');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(17,'CX','케세이퍼시픽 항공');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(18,'MF','샤먼항공');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(19,'MH','말레이시아 항공');
insert into `iata_airline_tb`(`id`,`code`,`name`) VALUES(20,'CZ','중국남방항공');