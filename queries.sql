create table patients
(
patient_id int primary key identity(1,1),
patient_name varchar(50) not null,
date_of_birth date not null,
gender varchar(50),
address varchar(50) not null,
phone_number varchar(20),
email varchar(50)unique
);

insert into patients(patient_name,date_of_birth,gender,address,phone_number,email)
values('Ankeeta','1998-11-30', 'Female', 'kadma jamshedpur','8210044689','ankeeta.kumari@gmail.com');

select* from patients 

-----------------------------------------------------------------------------------------------------

create table doctors
(
doctor_id int primary key identity(1,1),
doctor_name varchar(50) not null,
specialization varchar(50) not null,
phone_number varchar(50) not null,
email varchar(50) unique
);

insert into doctors(doctor_name,specialization,phone_number,email)
values('Anshuman','dentist','9636253253','anshuman@gmail.com');

select* from doctors

-------------------------------------------------------------------------------------------------------


create table appointments
(
appointment_id int primary key identity(1,1),
appointment_date date,
appointment_time timestamp not null,
status varchar(50) check (status in ('scheduled','cancelled', 'completed')) default 'scheduled',
patient_id int foreign key references patients(patient_id) on delete cascade,
doctor_id int foreign key references doctors(doctor_id) on update cascade
);

insert into appointments(appointment_date,status,patient_id,doctor_id)
values('2024-07-11',default, 1,1);

select * from appointments

--------------------------------------------------------------------------------------------
create table medical_reports
(
record_id int primary key identity(1,1),
date_of_visit date not null,
patient_id int foreign key references patients(patient_id),
doctor_id int foreign key references doctors(doctor_id)
);

insert into medical_reports(date_of_visit, patient_id, doctor_id)
values('2024-07-11',1,1);

select * from medical_reports

--------------------------------------------------------------------------------------------------
create table billing
(
bill_id int primary key identity(1,1),
date_of_billing date not null,
amount int not null,
payment_stat varchar(50) check (payment_stat in ('paid', 'pending')) default 'pending',
patient_id int foreign key references patients(patient_id),
doctor_id int foreign key references doctors(doctor_id),
appointment_id int foreign key references appointments(appointment_id),
);

insert into billing(date_of_billing,amount,payment_stat,patient_id,doctor_id,appointment_id)
values('2024-07-11','10000',default,1,1,1);

select * from billing

--------------------------------------------------------------------------------------------------

create table departments
(
department_id int primary key identity(1,1),
department_name varchar(50) unique,
doctor_id int foreign key references doctors(doctor_id),
);

insert into departments(department_name,doctor_id)
values('dental',1);

select * from departments