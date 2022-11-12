CREATE TABLE auth_user (id BIGINT NOT NULL,
                        login VARCHAR(255),
                         password VARCHAR(255),
                          role varchar(255), PRIMARY KEY (id));


CREATE TABLE phone (phone_id BIGINT NOT NULL , is_hidden BOOLEAN, number VARCHAR(255), PRIMARY KEY (phone_id));

CREATE TABLE worker (id BIGINT NOT NULL,
                    department VARCHAR(255),
                     email VARCHAR(255),
                      name VARCHAR(255),
                       position VARCHAR(255), PRIMARY KEY (id));

CREATE TABLE workers_phone (owner_id BIGINT NOT NULL , phone_id BIGINT NOT NULL);


CREATE SEQUENCE hibernate_sequence START WITH 1 INCREMENT BY 1;
alter table workers_phone add constraint CONSTR_WORK_PHONE foreign key (phone_id) references phone;
alter table workers_phone add constraint CONSTR_PHONE_WORK foreign key (owner_id) references worker;
