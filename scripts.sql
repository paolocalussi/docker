
-- users."user" definition
-- Drop table
 drop table users."user";

drop sequence users.user_id_seq;

create sequence users.user_id_seq increment by 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 1 no cycle;

create table users."user" ( id numeric not null,
code varchar(10) not null default 'US-' || pg_catalog.currval('users.user_id_seq'::regclass)::text,
"name" varchar(100) not null,
surname varchar(100) not null,
date_insert timestamptz not null,
date_update timestamptz null,
constraint user_pkey primary key (id) );
-- users.user_id_seq definition
 drop table stock.stock ;

drop sequence stock.stock_id_seq;

create sequence stock.stock_id_seq increment by 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 1 no cycle;

-- stock.stock definition

-- Drop table

-- DROP TABLE stock.stock;

CREATE TABLE stock.stock (
	id numeric NOT NULL,
	code varchar(10) NOT NULL DEFAULT (('ST-'::text || currval('stock.stock_id_seq'::regclass)::text)),
	"name" varchar(100) NOT NULL,
	date_insert timestamptz NOT NULL,
	date_update timestamptz NULL,
	CONSTRAINT stock_code_uk UNIQUE (code),
	CONSTRAINT stock_pkey PRIMARY KEY (id)
);

create sequence stock.user_stock_id_seq increment by 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 1 no cycle;

-- DROP TABLE stock.user;
create sequence stock.user_id_seq increment by 1 minvalue 1 maxvalue 9223372036854775807 start 1 cache 1 no cycle;

CREATE TABLE stock.user (
	id numeric NOT NULL,
	code varchar(10) NOT NULL DEFAULT (('ST-'::text || currval('stock.user_id_seq'::regclass)::text)),
	date_insert timestamptz NOT NULL,
	date_update timestamptz NULL,
	CONSTRAINT user_code_uk UNIQUE (code),
	CONSTRAINT user_pkey PRIMARY KEY (id)
);



-- DROP TABLE stock.user_stock;



CREATE TABLE stock.user_stock (
	id numeric NOT NULL,
	user_id numeric NOT NULL,
	stock_id numeric NOT NULL,
	buy_price numeric(6,2) NOT NULL,
	date_insert timestamptz NOT NULL,
	date_update timestamptz NULL,
	CONSTRAINT user_stock_pkey PRIMARY KEY (id)
);


-- stock.user_stock foreign keys

ALTER TABLE stock.user_stock ADD CONSTRAINT user_stock_fk FOREIGN KEY (id) REFERENCES stock.stock(id);
