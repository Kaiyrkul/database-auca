-- Создание таблицы coffee_houses
CREATE TABLE public.coffee_houses (
    coffee integer,
    merch integer,
    store_id integer NOT NULL,
    total integer,
    city character varying(255),
    CONSTRAINT coffee_houses_pkey PRIMARY KEY (store_id)
);

-- Создание таблицы suppliers
CREATE TABLE public.suppliers (
    sup_id integer NOT NULL,
    city character varying(255),
    state character varying(255),
    street character varying(255),
    sup_name character varying(255),
    zip character varying(255),
    CONSTRAINT suppliers_pkey PRIMARY KEY (sup_id)
);

-- Создание таблицы coffees
CREATE TABLE public.coffees (
    price real,
    sales integer,
    sup_id integer,
    total integer,
    cof_name character varying(32),
    CONSTRAINT coffees_pkey PRIMARY KEY (cof_name)
);

-- Создание таблицы merch_inventory
CREATE TABLE public.merch_inventory (
    date_val date,
    item_id integer,
    quan integer,
    sup_id integer,
    item_name character varying(255),
    CONSTRAINT merch_inventory_pkey PRIMARY KEY (item_id)
);

-- Создание таблицы cof_inventory
CREATE TABLE public.cof_inventory (
    date_val date,
    quan integer,
    sup_id integer,
    warehouse_id integer,
    cof_name character varying(32),
    CONSTRAINT cof_inventory_pkey PRIMARY KEY (warehouse_id)
);

-- Создание таблицы university_students
CREATE TABLE public.university_students (
    student_id integer NOT NULL,
    first_name text,
    last_name character varying(50),
    email_address character varying(100),
    date_of_birth date,
    CONSTRAINT university_students_pkey PRIMARY KEY (student_id)
);