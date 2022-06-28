--создание таблиц
create table countries(
    id serial primary key,
    country_name varchar not null
);

create table types(
    id serial primary key,
    type varchar not null
);

create table providers(
    id serial primary key,
    provider_name varchar not null
);

create table  producers(
    id serial primary key,
    country_id int not null,
    producer_name varchar not null,
    foreign key (country_id) references  countries(id) on delete cascade on update cascade
);

create table products(
    id serial primary key,
    type_id int not null,
    producer_id int not null,
    provider_id int not null,
    costs int not null check ( costs>0 ),
    name varchar not null,
    production_date date not null check ( production_date<now() and production_date>'1970-12-31' ),
    foreign key (type_id) references  types(id) on delete cascade on update cascade,
    foreign key (producer_id) references  producers(id) on delete cascade on update cascade,
    foreign key (provider_id) references  providers(id) on delete cascade on update cascade
);


create table sales(
    id serial primary key,
    product_id int not null,
    sale_date date not null check ( sale_date<now() and sale_date>'1970-12-31' ),
    quantity int not null check ( quantity>=0 ),
    percentage_of_defective int not null check ( percentage_of_defective>=0 and percentage_of_defective<=100 ),
    foreign key (product_id) references  products(id) on delete cascade on update cascade

);

--вставка значений
insert into countries values (1,'Россия');
insert into countries values
                             (2,'Германия'),
                             (3,'Япония'),
                             (4,'США'),
                             (5,'Республика Корея'),
                             (6,'КНР'),
                             (7,'Польша'),
                             (8,'Швеция'),
                             (9,'Италия'),
                             (10,'Франция');

insert into providers values (1,'autoplus');
insert into providers values (2,'FreeDrive'),
                             (3,'CarShop'),
                             (4,'Driver'),
                             (5,'AutoCity'),
                             (6,'AutoWorld'),
                             (7,'AutoExpert'),
                             (8,'Auto-1'),
                             (9,'NSK-Auto'),
                             (10,'MegaPark');


insert into types values (1,'Авто'),
                         (2,'Шины'),
                         (3,'Диски'),
                         (4,'Аккумулятор'),
                         (5,'Дворники');


insert into producers values (1,1,'Lada');
insert into producers values (2,2,'BMW'),
                             (3,2,'Mercedes'),
                             (4,3,'Lexus'),
                             (5,4,'Chevrolet'),
                             (6,4,'Ford'),
                             (7,5,'Kia'),
                             (8,6,'Geely'),
                             (9,7,'FSO'),
                             (10,8,'Saab'),
                             (11,9,'Fiat'),
                             (12,10,'Renault'),
                             (13,2,'Audi'),
                             (14,10,'Bugatti'),
                             (15,9,'Lamborghini')
                             ;

insert into products values (1,1,1,1,50000,'Lada Granta','2012-10-23'),
                            (2,1,2,1,600000,'BMW X5','2018-10-11'),
                            (3,1,3,4,800000,'Benz W124','2013-10-12'),
                            (4,1,4,1,900000,'rx350','2019-11-13'),
                            (5,1,5,3,300000,'Lacetti','2016-12-14'),
                            (6,1,6,4,400000,'Focus','2014-11-15'),
                            (7,1,7,1,550000,'Rio','2015-04-16'),
                            (8,1,8,4,200000,'Coolray','2020-05-17'),
                            (9,1,9,6,740000,'Polonez','2019-08-18'),
                            (10,1,10,3,2100000,'9-3 aero','2016-07-19'),
                            (11,1,11,3,600000,'Ducato','2017-06-20'),
                            (12,1,12,5,3000000,'Logan','2018-02-11'),
                            (13,1,13,5,400000,'a6','2018-03-12'),
                            (14,1,14,1,650000,'veyron','2020-12-13'),
                            (15,1,15,5,800000,'Urus','2016-11-14'),
                            (16,1,2,6,900000,'BMW X6','2016-11-15'),
                            (17,1,2,2,210000,'BMW X7','2017-10-16'),
                            (18,1,3,3,150000,'Benz W140','2020-09-17'),
                            (19,2,3,1,20000,'Blazer','2019-06-18'),
                            (20,2,11,4,15000,'Leopard','2018-05-19'),
                            (21,2,12,7,12000,'Tunga','2020-01-20'),
                            (22,2,14,2,8000,'Kama','2020-10-21'),
                            (23,2,10,8,9500,'Kormoran','2020-02-12'),
                            (24,3,8,1,5000,'Trebl','2021-11-22'),
                            (25,3,9,9,7500,'Silver','2020-11-22'),
                            (26,4,9,10,12000,'Shock','2020-10-23'),
                            (27,4,13,2,13500,'ShockWave','2020-09-11'),
                            (28,5,13,8,2000,'SuperDvornik','2019-08-12'),
                            (29,5,13,1,1500,'Dvornik','2019-07-12'),
                            (30,5,12,2,4000,'MegaDvornik','2019-06-14');

--select p.id,t.type,prod.producer_name,prov.provider_name,p.costs,p.name,p.production_date from products as p
  --  join types as t on p.type_id = t.id
--join producers as prod on p.producer_id = prod.id
--join  providers as prov on p.provider_id = prov.id;
insert into sales values (1,1,'2021-04-20',10,1),
                         (2,29,'2021-08-20',12,2),
                         (3,2,'2021-05-20',10,1),
                         (4,28,'2021-04-12',5,0),
                         (5,17,'2021-10-18',8,0),
                         (6,27,'2021-08-17',20,1),
                         (7,16,'2021-05-20',30,3),
                         (8,26,'2021-04-16',10,1),
                         (9,3,'2021-10-15',40,3),
                         (10,25,'2021-05-20',32,3),
                         (11,24,'2021-04-12',12,3),
                         (12,5,'2021-08-20',50,3),
                         (13,23,'2021-02-12',12,1),
                         (14,22,'2021-05-20',10,3),
                         (15,4,'2021-03-20',32,3),
                         (16,30,'2021-05-14',20,3),
                         (17,6,'2021-10-20',14,1),
                         (18,5,'2021-08-12',5,0),
                         (19,14,'2021-05-20',9,0),
                         (20,30,'2021-04-20',11,3),
                         (21,7,'2021-04-12',14,4),
                         (22,26,'2021-04-20',50,5),
                         (23,18,'2021-05-10',80,10),
                         (24,8,'2021-09-20',11,3),
                         (25,21,'2021-10-11',10,3),
                         (26,19,'2021-08-20',12,1),
                         (27,15,'2021-05-19',14,4),
                         (28,21,'2021-06-20',17,3),
                         (29,9,'2021-10-20',19,1),
                         (30,10,'2021-04-12',22,3),
                         (31,20,'2021-08-13',23,2),
                         (32,22,'2021-05-13',76,5),
                         (33,13,'2021-05-13',32,1),
                         (34,24,'2021-11-13',10,4),
                         (35,12,'2021-05-13',12,2),
                         (36,10,'2021-10-12',14,2),
                         (37,11,'2021-05-13',16,2),
                         (38,12,'2021-08-13',20,2),
                         (39,11,'2021-11-20',15,5),
                         (40,3,'2021-08-12',10,1);

--функции
create or replace function get_info()
returns table (id int,name varchar,type varchar,producer_name varchar,
provider_name varchar,country varchar, costs int, production_date date) as $$
begin
    return query
        select products.id,products.name, t.type, p.producer_name,
               p2.provider_name,c.country_name,products.costs,products.production_date from products
    join producers p on products.producer_id = p.id
    join countries c on p.country_id = c.id
    join types t on products.type_id = t.id
    join providers p2 on products.provider_id = p2.id;

end;

    $$
language plpgsql;
select * from get_info();

--функции сортировки
create or replace function sort_date()
returns table (id int,name varchar,type varchar,producer_name varchar,
provider_name varchar,country varchar, costs int, production_date date) as $$
begin
    return query
        select products.id,products.name, t.type, p.producer_name,
               p2.provider_name,c.country_name,products.costs,products.production_date from products
    join producers p on products.producer_id = p.id
    join countries c on p.country_id = c.id
    join types t on products.type_id = t.id
    join providers p2 on products.provider_id = p2.id
    order by products.production_date desc;


end;

    $$
language plpgsql;
select * from sort_date();

create or replace function sort_producer()
returns table (id int,name varchar,type varchar,producer_name varchar,
provider_name varchar,country varchar, costs int, production_date date) as $$
begin
    return query
        select products.id,products.name, t.type, p.producer_name,
               p2.provider_name,c.country_name,products.costs,products.production_date from products
    join producers p on products.producer_id = p.id
    join countries c on p.country_id = c.id
    join types t on products.type_id = t.id
    join providers p2 on products.provider_id = p2.id
    order by p.producer_name;


end;

    $$
language plpgsql;
select * from sort_producer();

create or replace function sort_provider()
returns table (id int,name varchar,type varchar,producer_name varchar,
provider_name varchar,country varchar, costs int, production_date date) as $$
begin
    return query
        select products.id,products.name, t.type, p.producer_name,
               p2.provider_name,c.country_name,products.costs,products.production_date from products
    join producers p on products.producer_id = p.id
    join countries c on p.country_id = c.id
    join types t on products.type_id = t.id
    join providers p2 on products.provider_id = p2.id
    order by p2.provider_name;


end;
 $$
language plpgsql;
select * from sort_provider();

create or replace function sort_cost()
returns table (id int,name varchar,type varchar,producer_name varchar,
provider_name varchar,country varchar, costs int, production_date date) as $$
begin
    return query
        select products.id,products.name, t.type, p.producer_name,
               p2.provider_name,c.country_name,products.costs,products.production_date from products
    join producers p on products.producer_id = p.id
    join countries c on p.country_id = c.id
    join types t on products.type_id = t.id
    join providers p2 on products.provider_id = p2.id
    order by products.costs desc;


end;

    $$
language plpgsql;
select * from sort_cost();

--max min avg

create or replace function max_cost()
returns table(id int,name varchar, costs int) as $$
    begin
        return query
        select p.id, p.name, p.costs from products p
        where p.costs=(select max(products.costs) from products);

end;

$$
language plpgsql;
select * from max_cost();
create or replace function max_cost(varchar)
returns table(id int,name varchar, costs int) as $$
    begin
        return query
        select p.id, p.name, p.costs from products p
            join types t on p.type_id = t.id
        where p.costs=(select max(products.costs) from products
            join types t2 on products.type_id = t2.id
            where t2.type=$1) and t.type = $1 ;

end;

$$
language plpgsql;
select * from max_cost('Диски');

create or replace function min_cost()
returns table(id int,name varchar, costs int) as $$
    begin
        return query
        select p.id, p.name, p.costs from products p
        where p.costs=(select min(products.costs) from products);

end;

$$
language plpgsql;
select * from min_cost();
create or replace function min_cost(varchar)
returns table(id int,name varchar, costs int) as $$
    begin
        return query
        select p.id, p.name, p.costs from products p
            join types t on p.type_id = t.id
        where p.costs=(select min(products.costs) from products
            join types t2 on products.type_id = t2.id
            where t2.type=$1) and t.type = $1 ;

end;

$$
language plpgsql;
select * from min_cost('Авто');
create or replace function avg_cost()
returns float as $$
    begin
        return (select avg(costs) from products);

end;

$$
language plpgsql;
select avg_cost();
create or replace function avg_cost_bytype()
returns table(type varchar, costs numeric) as $$
    begin
        return query
        select t.type,avg(products.costs) from products
            join types t on products.type_id = t.id
        group by t.type;

end;

$$
language plpgsql;

select * from avg_cost_bytype();
--4
create or replace function more_then(int)
returns table (id int, name varchar, costs integer)
as
$$
begin
return query
select products.id,products.name,products.costs from products
where products.costs > $1;
end;
$$ language 'plpgsql';
select * from more_then(400000);
--5
create or replace function producer_part(varchar) returns float as $$
    declare
        i float;
        chosen float;
        begin
        select count(*) into i from products;
        select count(*) into chosen from products
            join producers p on products.producer_id = p.id
        where $1=p.producer_name;
        return chosen/i;
    end;
    $$
language plpgsql;
select producer_part('BMW');
--6
create or replace function find_date(date)
returns table (id int, name varchar, costs integer,date date)
as
$$
begin
return query
select products.id,products.name,products.costs, products.production_date from products
where products.production_date = $1;
end;
$$ language 'plpgsql';
select * from find_date('2017-10-16');
--7
create or replace function find_date2(date,date)
returns table (id int,product_id int, name varchar, costs integer,date date,quantity int)
as
$$
begin
return query
select sales.id,p.id,p.name, p.costs, sales.sale_date,sales.quantity from sales
    join products p on sales.product_id = p.id
where sales.sale_date between $1 and $2;
end;
$$ language 'plpgsql';
select * from find_date2('2021-09-22','2021-10-22');
create or replace function find_date2producer(date,date,varchar)
returns table (id int,product_id int, name varchar, costs integer,date date,quantity int,producer varchar)
as
$$
begin
return query
select sales.id,p.id,p.name, p.costs, sales.sale_date,sales.quantity,p2.producer_name from sales
    join products p on sales.product_id = p.id
join producers p2 on p.producer_id = p2.id
where sales.sale_date between $1 and $2 and p2.producer_name=$3;
end;
$$ language 'plpgsql';

select * from find_date2producer('2021-09-22','2021-10-22','BMW');

--8
create or replace function cost_part(int,int) returns float as $$
    declare
        i float;
        chosen float;
        begin
        select count(*) into i from products;
        select count(*) into chosen from products
        where products.costs between $1 and $2;
        return chosen/i;
    end;
    $$
language plpgsql;
select cost_part(5000,50000);
--9

create or replace function provider_part(varchar) returns float as $$
    declare
        i float;
        chosen float;
        begin
        select count(*) into i from products;
        select count(*) into chosen from products
            join providers p on products.provider_id = p.id
        where $1=p.provider_name;
        return chosen/i;
    end;
    $$
language plpgsql;
select provider_part('autoplus');
create or replace function provider_and_cost(varchar,int)
returns table(id int, name varchar, provider_name varchar, costs int) as $$
    begin
        return query
        select products.id,products.name,p.provider_name,products.costs from products
            join providers p on products.provider_id = p.id
        where p.provider_name=$1 and products.costs > $2;
    end;
    $$
language plpgsql;
select * from provider_and_cost('autoplus',50000);
create or replace function find_producer(varchar)
returns table(id int, name varchar, producer_name varchar, costs int) as $$
    begin
        return query
        select products.id,products.name,p.producer_name,products.costs from products
            join producers p on products.producer_id = p.id
        where p.producer_name=$1;
    end;
    $$
language plpgsql;
select * from find_producer('BMW');
create or replace function part_date(date,date)
returns float
as
$$
    declare
        i float;
        chosen float;
begin
        select count(*) into i from sales;
        select count(*) into chosen from sales
            where sales.sale_date between $1 and $2;
        return chosen/i;
end;
$$ language 'plpgsql';
select part_date('2021-09-10','2021-10-10');
--10
create or replace function find_producerandco(varchar,varchar)
returns table (id int,name varchar, cost int, provider_name varchar,  avg_cost float)
as
$$
    declare
        avg_cost float;
begin
        select avg(products.costs) into avg_cost from products
        join producers p on products.producer_id = p.id
        join countries c on p.country_id = c.id
        where c.country_name=$2;

        return query select products.id,products.name,products.costs,p2.producer_name,avg_cost from products
        join producers p2 on products.producer_id = p2.id
        join providers p3 on products.provider_id = p3.id
        where p3.provider_name=$1 and products.costs>avg_cost;
end;
$$ language 'plpgsql';

select * from find_producerandco('FreeDrive','Россия');

--11

create or replace function part_cost(int,date,date) returns float as $$
   declare
        i float;
        chosen float;

       begin
       select count(*) into i from products where production_date between $2 and $3;

       select count(*) into chosen from products where production_date between $2 and $3 and costs>$1;

       return chosen/i;
   end;
    $$
language plpgsql;
select part_cost(500000,'2016-10-10','2018-10-10');
create or replace function part_cost(int) returns float as $$
   declare
        i float;
        chosen float;

       begin
       select count(*) into i from products;

       select count(*) into chosen from products where costs>$1;

       return chosen/i;
   end;
    $$
language plpgsql;
select part_cost(500000);
create or replace function avgsaledate(date,date) returns float as $$
   declare
        i float;
        chosen float;

       begin
       return
       (select avg(costs) from products
           join sales s on products.id = s.product_id
       where s.sale_date between $1 and $2);
   end;
    $$
language plpgsql;
select avgsaledate('2021-09-10','2021-10-10');
create or replace function morethanproducer(varchar)
returns table(id int,name varchar, cost int, provider_name varchar, producer_name varchar,  avg_cost float) as $$
        declare
        avg_cost float;
begin
        select avg(products.costs) into avg_cost from products
        join producers p on products.producer_id = p.id
        where p.producer_name=$1;

        return query select products.id,products.name,products.costs,p2.producer_name,p3.provider_name,avg_cost from products
        join producers p2 on products.producer_id = p2.id
        join providers p3 on products.provider_id = p3.id
        where products.costs>avg_cost;

    end;

    $$
language plpgsql;
    select * from morethanproducer('BMW');
create or replace function find_brak(varchar,varchar) returns int as $$
    begin
return (select sum(quantity*percentage_of_defective/100) from sales
    join products p on sales.product_id = p.id
    join providers p2 on p.provider_id = p2.id
    join producers p3 on p.producer_id = p3.id
    join countries c on p3.country_id = c.id
where c.country_name = $1 and p2.provider_name=$2);
    end;

    $$
language plpgsql;

select find_brak('Германия','CarShop');

create role user_bd login password 'user_bd';
grant select on countries,producers,products,providers,sales,types to user_bd;
grant execute on all functions in schema public to user_bd;

create role operator_bd login password 'operator_bd';
grant all on countries,producers,products,providers,sales,types to operator_bd;
grant execute on all functions in schema public to operator_bd;

create role administrator_bd with createdb createrole superuser  login password 'admin_bd';
grant all on all tables in schema  public to administrator_bd;
grant execute on all functions in schema public to administrator_bd;

create table logs(
    operation char(6) NOT NULL,
    added timestamp,
    users text,
    table_name name );


create or replace function trigger_add() returns trigger as $$
    begin
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO logs SELECT 'Delete', now(), user,TG_TABLE_NAME;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO logs SELECT 'Update', now(), user,TG_TABLE_NAME;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO logs SELECT 'Insert', now(), user,TG_TABLE_NAME;
        END IF;
        RETURN NULL;

    end;
    $$
language plpgsql;


create trigger log_trigger after insert or update or delete on products for each row execute function trigger_add();
create trigger log_trigger after insert or update or delete on countries for each row execute function trigger_add();
create trigger log_trigger after insert or update or delete on sales for each row execute function trigger_add();
create trigger log_trigger after insert or update or delete on types for each row execute function trigger_add();
create trigger log_trigger after insert or update or delete on providers for each row execute function trigger_add();
create trigger log_trigger after insert or update or delete on producers for each row execute function trigger_add();
drop trigger log_trigger on producers;
select * from sales;

