INSERT INTO auth_user  VALUES ( 1, 'admin', '$2a$10$64HNkEedSf7/cWF2ShfLXuoWA3LKc4FYZcdfRC6ssDzshkRlHGVOW', 'ROLE_ADMIN' );
INSERT INTO auth_user  VALUES ( 2, 'user', '$2a$10$7kp6oPoMmrbf5ci62vIGned0TAiwqk7jXQUQvgEIUgaoNWAiaB6Aq', 'ROLE_USER' );


INSERT INTO phone VALUES ( 1, FALSE, '+7(921)-845-7372');
INSERT INTO phone VALUES ( 2, FALSE, '+7(495)-855-5389');
INSERT INTO phone VALUES ( 3, TRUE, '88314664476');
INSERT INTO phone VALUES ( 4, FALSE, '+7(812)-604-09-80');
INSERT INTO phone VALUES ( 5, FALSE, '+7(831)-241-29-09');
INSERT INTO phone VALUES ( 6, TRUE, '(499) 999-8283');
INSERT INTO phone VALUES ( 7, FALSE, '+7(912)-001-9597');
INSERT INTO phone VALUES ( 8, FALSE, '+7(920)-433-3329');


ALTER SEQUENCE hibernate_sequence RESTART WITH 9;


INSERT INTO worker VALUES ( 1, 'Отдел разработки', 'Andrey.Anfisov@ex.ru', 'Анфисов Андрей Вениаминович', 'Старший инженер' );
INSERT INTO worker VALUES ( 2, 'Отдел разработки', 'Filipp.Pavlov@ex.ru', 'Павлов Филипп Евгеньевич', 'Инженер' );
INSERT INTO worker VALUES ( 3, 'Отдел поддержки', 'vereshhagina-mv@ex.ru', 'Верещагина Марина Владимировна', 'Универсальный специалист связи' );
INSERT INTO worker VALUES ( 4, 'Отдел продаж', 'E.Zagumennov@si.ex.ru', 'Загуменнов Евгений Дмитриевич', 'Руководитель кластера продаж' );
INSERT INTO worker VALUES ( 5, 'Отдел продаж', 'Sergey.Mi.Mikhaylov@ex.ru', 'Михайлов Сергей Михайлович', 'Менеджер' );
INSERT INTO worker VALUES ( 6, 'Отдел поддержки', 'sergey.m.belyakov@ex.ru', 'Беляков Сергей Михайлович', 'Электромонтер 5 разряда' );
INSERT INTO worker VALUES ( 7, 'Отдел продаж', 'GordeevaNV@ex.ru', 'Гордеева Надежда Владимировна', 'Руководитель Центра продаж и обслуживания' );
INSERT INTO worker VALUES ( 8, 'Отдел разработки', 'r.p.volkov@ex.ru', 'Волков Роман Павлович', 'Инженер' );
INSERT INTO worker VALUES ( 9, 'Отдел продаж', 'Dmitriy.Murzin@ex.ru', 'Мурзин Дмитрий Владимирович', 'Руководитель направления' );


INSERT INTO workers_phone Values (1, 1);
INSERT INTO workers_phone Values (2, 1);
INSERT INTO workers_phone Values (8, 1);

INSERT INTO workers_phone Values (3, 2);
INSERT INTO workers_phone Values (6, 2);

INSERT INTO workers_phone Values (4, 4);
INSERT INTO workers_phone Values (5, 4);
INSERT INTO workers_phone Values (7, 4);
INSERT INTO workers_phone Values (9, 4);

INSERT INTO workers_phone Values (5, 3);
INSERT INTO workers_phone Values (6, 5);

INSERT INTO workers_phone Values (7, 6);
INSERT INTO workers_phone Values (5, 6);

INSERT INTO workers_phone Values (8, 7);
INSERT INTO workers_phone Values (9, 8);
INSERT INTO workers_phone Values (9, 7);

