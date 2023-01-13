--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6
-- Dumped by pg_dump version 14.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alert (
    id bigint NOT NULL,
    version bigint NOT NULL,
    origin character varying(255),
    date_created timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    is_subscription_enabled boolean,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.alert OWNER TO postgres;

--
-- Name: alert_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alert_role (
    alert_restricted_roles_id bigint NOT NULL,
    role_id bigint
);


ALTER TABLE public.alert_role OWNER TO postgres;

--
-- Name: alert_taack_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alert_taack_user (
    alert_users_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.alert_taack_user OWNER TO postgres;

--
-- Name: attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachment (
    id bigint NOT NULL,
    version integer NOT NULL,
    user_updated_id bigint,
    date_created timestamp without time zone NOT NULL,
    active boolean NOT NULL,
    is_restricted_to_my_subsidiary boolean,
    user_created_id bigint NOT NULL,
    date_imported timestamp without time zone,
    file_path text NOT NULL,
    declared_language character varying(255),
    public_name character varying(255),
    content_type character varying(255) NOT NULL,
    content_type_enum character varying(255),
    file_size bigint NOT NULL,
    next_version_id bigint,
    last_updated timestamp without time zone,
    content_sha_one character varying(255) NOT NULL,
    original_name text NOT NULL,
    is_restricted_to_embedding_objects boolean,
    is_restricted_to_my_managers boolean,
    is_restricted_to_my_business_unit boolean,
    type character varying(255),
    file_origin character varying(255),
    content_type_category_enum character varying(255),
    status character varying(255),
    is_internal boolean
);


ALTER TABLE public.attachment OWNER TO postgres;

--
-- Name: attachment_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachment_role (
    attachment_granted_roles_id bigint NOT NULL,
    role_id bigint
);


ALTER TABLE public.attachment_role OWNER TO postgres;

--
-- Name: attachment_taack_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachment_taack_user (
    attachment_granted_users_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.attachment_taack_user OWNER TO postgres;

--
-- Name: attachment_term; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachment_term (
    attachment_tags_id bigint NOT NULL,
    term_id bigint
);


ALTER TABLE public.attachment_term OWNER TO postgres;

--
-- Name: bookstore_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookstore_author (
    id bigint NOT NULL,
    version bigint NOT NULL,
    user_updated_id bigint NOT NULL,
    date_created timestamp without time zone NOT NULL,
    first_name character varying(255) NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    user_created_id bigint NOT NULL,
    last_name character varying(255) NOT NULL
);


ALTER TABLE public.bookstore_author OWNER TO postgres;

--
-- Name: bookstore_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookstore_book (
    id bigint NOT NULL,
    version bigint NOT NULL,
    book_shelf_id bigint,
    user_updated_id bigint NOT NULL,
    date_created timestamp without time zone NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    number integer NOT NULL,
    user_created_id bigint NOT NULL,
    isbn character varying(255),
    author_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    sale_price numeric(19,2),
    abstract_text character varying(255)
);


ALTER TABLE public.bookstore_book OWNER TO postgres;

--
-- Name: bookstore_borrowed_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookstore_borrowed_book (
    id bigint NOT NULL,
    version bigint NOT NULL,
    borrower_id bigint NOT NULL,
    user_updated_id bigint NOT NULL,
    date_created timestamp without time zone NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    user_created_id bigint NOT NULL,
    book_id bigint NOT NULL,
    end_date timestamp without time zone,
    start_date timestamp without time zone NOT NULL,
    leases_idx integer
);


ALTER TABLE public.bookstore_borrowed_book OWNER TO postgres;

--
-- Name: bookstore_borrower; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookstore_borrower (
    id bigint NOT NULL,
    version bigint NOT NULL,
    user_updated_id bigint NOT NULL,
    date_created timestamp without time zone NOT NULL,
    first_name character varying(255) NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    user_created_id bigint NOT NULL,
    last_name character varying(255) NOT NULL
);


ALTER TABLE public.bookstore_borrower OWNER TO postgres;

--
-- Name: bookstore_borrower_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookstore_borrower_book (
    id bigint NOT NULL,
    version bigint NOT NULL,
    borrower_id bigint NOT NULL,
    user_updated_id bigint NOT NULL,
    date_created timestamp without time zone NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    user_created_id bigint NOT NULL,
    book_id bigint NOT NULL,
    end_date timestamp without time zone,
    start_date timestamp without time zone NOT NULL,
    leases_idx integer
);


ALTER TABLE public.bookstore_borrower_book OWNER TO postgres;

--
-- Name: bookstore_shelf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookstore_shelf (
    id bigint NOT NULL,
    version bigint NOT NULL,
    user_updated_id bigint NOT NULL,
    date_created timestamp without time zone NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    user_created_id bigint NOT NULL,
    place character varying(255) NOT NULL
);


ALTER TABLE public.bookstore_shelf OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: persistent_login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persistent_login (
    series character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    token character varying(64) NOT NULL,
    last_used timestamp without time zone NOT NULL
);


ALTER TABLE public.persistent_login OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id bigint NOT NULL,
    version bigint NOT NULL,
    authority character varying(255) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_hierarchy_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_hierarchy_entry (
    id bigint NOT NULL,
    version bigint NOT NULL,
    entry character varying(255) NOT NULL
);


ALTER TABLE public.role_hierarchy_entry OWNER TO postgres;

--
-- Name: roles_read_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles_read_attachment (
    attachment_granted_roles_read_id bigint NOT NULL,
    role_id bigint
);


ALTER TABLE public.roles_read_attachment OWNER TO postgres;

--
-- Name: taack_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taack_user (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    first_name character varying(255),
    password_expired boolean NOT NULL,
    business_unit character varying(255) NOT NULL,
    subsidiary character varying(255),
    account_expired boolean NOT NULL,
    user_created_id bigint,
    mail character varying(255),
    language character varying(255),
    manager_id bigint,
    username character varying(255) NOT NULL,
    account_locked boolean NOT NULL,
    password character varying(255) NOT NULL,
    last_name character varying(255),
    enabled boolean NOT NULL
);


ALTER TABLE public.taack_user OWNER TO postgres;

--
-- Name: taack_user_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taack_user_attachment (
    user_attachments_id bigint NOT NULL,
    attachment_id bigint
);


ALTER TABLE public.taack_user_attachment OWNER TO postgres;

--
-- Name: term; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.term (
    id bigint NOT NULL,
    version bigint NOT NULL,
    term_group_config character varying(255),
    active boolean NOT NULL,
    display boolean NOT NULL,
    name character varying(255) NOT NULL,
    parent_id bigint
);


ALTER TABLE public.term OWNER TO postgres;

--
-- Name: term_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.term_translations (
    term_id bigint,
    translations_object character varying(255),
    translations_idx character varying(255),
    translations_elt character varying(255) NOT NULL
);


ALTER TABLE public.term_translations OWNER TO postgres;

--
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.user_role OWNER TO postgres;

--
-- Name: users_read_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_read_attachment (
    attachment_granted_users_read_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.users_read_attachment OWNER TO postgres;

--
-- Data for Name: alert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alert (id, version, origin, date_created, active, is_subscription_enabled, name, description) FROM stdin;
\.


--
-- Data for Name: alert_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alert_role (alert_restricted_roles_id, role_id) FROM stdin;
\.


--
-- Data for Name: alert_taack_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alert_taack_user (alert_users_id, user_id) FROM stdin;
\.


--
-- Data for Name: attachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attachment (id, version, user_updated_id, date_created, active, is_restricted_to_my_subsidiary, user_created_id, date_imported, file_path, declared_language, public_name, content_type, content_type_enum, file_size, next_version_id, last_updated, content_sha_one, original_name, is_restricted_to_embedding_objects, is_restricted_to_my_managers, is_restricted_to_my_business_unit, type, file_origin, content_type_category_enum, status, is_internal) FROM stdin;
\.


--
-- Data for Name: attachment_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attachment_role (attachment_granted_roles_id, role_id) FROM stdin;
\.


--
-- Data for Name: attachment_taack_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attachment_taack_user (attachment_granted_users_id, user_id) FROM stdin;
\.


--
-- Data for Name: attachment_term; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attachment_term (attachment_tags_id, term_id) FROM stdin;
\.


--
-- Data for Name: bookstore_author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookstore_author (id, version, user_updated_id, date_created, first_name, last_updated, user_created_id, last_name) FROM stdin;
3	0	2	2023-01-06 09:53:18.073	Tintin	2023-01-06 09:53:18.073	2	Dupont
4	0	2	2023-01-06 09:57:18.179	Super	2023-01-06 09:57:18.179	2	Man
7	0	2	2023-01-07 20:04:24.511	Stephen	2023-01-07 20:04:24.511	2	King
\.


--
-- Data for Name: bookstore_book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookstore_book (id, version, book_shelf_id, user_updated_id, date_created, last_updated, number, user_created_id, isbn, author_id, name, sale_price, abstract_text) FROM stdin;
5	0	\N	2	2023-01-06 11:15:06.206	2023-01-06 11:15:06.206	0	2	\N	3	Les aventures de Tintin	\N	This is not a Marvel Comic book
6	0	\N	2	2023-01-06 11:18:22.748	2023-01-06 11:18:22.748	0	2	\N	4	test	\N	\N
9	1	\N	2	2023-01-07 21:10:16.161	2023-01-09 20:51:46.727	0	2	\N	3	Test42	123.05	Test
8	2	11	2	2023-01-07 21:03:34.505	2023-01-11 03:26:28.062	50	2	\N	4	Super 4 life	\N	\N
\.


--
-- Data for Name: bookstore_borrowed_book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookstore_borrowed_book (id, version, borrower_id, user_updated_id, date_created, last_updated, user_created_id, book_id, end_date, start_date, leases_idx) FROM stdin;
12	0	10	2	2023-01-09 23:44:49.448	2023-01-09 23:44:49.448	2	8	\N	2023-01-09 23:44:49.428	0
\.


--
-- Data for Name: bookstore_borrower; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookstore_borrower (id, version, user_updated_id, date_created, first_name, last_updated, user_created_id, last_name) FROM stdin;
10	1	2	2023-01-09 22:02:53.731	Test1	2023-01-09 23:44:49.453	2	LN1
\.


--
-- Data for Name: bookstore_borrower_book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookstore_borrower_book (id, version, borrower_id, user_updated_id, date_created, last_updated, user_created_id, book_id, end_date, start_date, leases_idx) FROM stdin;
\.


--
-- Data for Name: bookstore_shelf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookstore_shelf (id, version, user_updated_id, date_created, last_updated, user_created_id, place) FROM stdin;
11	0	2	2023-01-09 22:04:30.643	2023-01-09 22:04:30.643	2	TEST1
\.


--
-- Data for Name: persistent_login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persistent_login (series, username, token, last_used) FROM stdin;
csokBz2vdhtktdHjOoMdkw==	admin	zk6vFz7aL5gXbSDAxQQA2g==	2023-01-06 10:52:02.825
bi4vYKN40awvd/ctFcSktg==	admin	Dp1umBp57UfzJ5wkO9xTfQ==	2023-01-06 11:17:52.614
sa4oP7xp94s5Mz8nylG2xQ==	admin	m7PgOyPYKCqZRDJINIBUrg==	2023-01-06 11:25:57.895
OHEQKmbR8kaUVOQ40gP4bQ==	admin	TTFd7UqJnMwUDXdwegQJAA==	2023-01-06 14:26:27.29
wownQEcWx+/RYDseFVdU+w==	admin	c4dep1Lachud0kdTKiwfAA==	2023-01-08 18:19:36.937
LJJ1JledYlPlVL3aiUa5VQ==	admin	+XUcSC+RjqAXwT+afRNy1A==	2023-01-11 03:20:41.408
zFTPwsoe+T/oKXh+AuiHlw==	admin	Nm5HGo7Jw731hRFWjWaxGg==	2023-01-11 06:58:27.5
NWsU7P9U+92bZDZs1ZXG8g==	admin	L5cBdpuDfY0H136aiNwtJw==	2023-01-13 23:52:26.963
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, version, authority) FROM stdin;
1	0	ROLE_ADMIN
\.


--
-- Data for Name: role_hierarchy_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_hierarchy_entry (id, version, entry) FROM stdin;
\.


--
-- Data for Name: roles_read_attachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles_read_attachment (attachment_granted_roles_read_id, role_id) FROM stdin;
\.


--
-- Data for Name: taack_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taack_user (id, version, date_created, first_name, password_expired, business_unit, subsidiary, account_expired, user_created_id, mail, language, manager_id, username, account_locked, password, last_name, enabled) FROM stdin;
2	0	2023-01-06 08:10:59.781	\N	f	IT	\N	f	\N	\N	\N	\N	admin	f	{bcrypt}$2a$10$1W9edI7FMMD7hGM7.IY1H.fUL7teozX/EfnZXNTP0.a4k0tYRBeY6	\N	t
\.


--
-- Data for Name: taack_user_attachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taack_user_attachment (user_attachments_id, attachment_id) FROM stdin;
\.


--
-- Data for Name: term; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.term (id, version, term_group_config, active, display, name, parent_id) FROM stdin;
\.


--
-- Data for Name: term_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.term_translations (term_id, translations_object, translations_idx, translations_elt) FROM stdin;
\.


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_role (user_id, role_id) FROM stdin;
2	1
\.


--
-- Data for Name: users_read_attachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_read_attachment (attachment_granted_users_read_id, user_id) FROM stdin;
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 12, true);


--
-- Name: alert alert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert
    ADD CONSTRAINT alert_pkey PRIMARY KEY (id);


--
-- Name: attachment attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT attachment_pkey PRIMARY KEY (id);


--
-- Name: bookstore_author bookstore_author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_author
    ADD CONSTRAINT bookstore_author_pkey PRIMARY KEY (id);


--
-- Name: bookstore_book bookstore_book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_book
    ADD CONSTRAINT bookstore_book_pkey PRIMARY KEY (id);


--
-- Name: bookstore_borrowed_book bookstore_borrowed_book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_borrowed_book
    ADD CONSTRAINT bookstore_borrowed_book_pkey PRIMARY KEY (id);


--
-- Name: bookstore_borrower_book bookstore_borrower_book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_borrower_book
    ADD CONSTRAINT bookstore_borrower_book_pkey PRIMARY KEY (id);


--
-- Name: bookstore_borrower bookstore_borrower_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_borrower
    ADD CONSTRAINT bookstore_borrower_pkey PRIMARY KEY (id);


--
-- Name: bookstore_shelf bookstore_shelf_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_shelf
    ADD CONSTRAINT bookstore_shelf_pkey PRIMARY KEY (id);


--
-- Name: persistent_login persistent_login_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persistent_login
    ADD CONSTRAINT persistent_login_pkey PRIMARY KEY (series);


--
-- Name: role_hierarchy_entry role_hierarchy_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_hierarchy_entry
    ADD CONSTRAINT role_hierarchy_entry_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: taack_user taack_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taack_user
    ADD CONSTRAINT taack_user_pkey PRIMARY KEY (id);


--
-- Name: term term_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.term
    ADD CONSTRAINT term_pkey PRIMARY KEY (id);


--
-- Name: term uk7c832287badc9e402cc930e74988; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.term
    ADD CONSTRAINT uk7c832287badc9e402cc930e74988 UNIQUE (term_group_config, name);


--
-- Name: taack_user uk_8qw5dilbwd67p190g9xpuktv0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taack_user
    ADD CONSTRAINT uk_8qw5dilbwd67p190g9xpuktv0 UNIQUE (username);


--
-- Name: alert uk_g5vej0b7cm32xwf8f867dyfhr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert
    ADD CONSTRAINT uk_g5vej0b7cm32xwf8f867dyfhr UNIQUE (name);


--
-- Name: attachment uk_hwbood1cxxnmqriecp8rsteow; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT uk_hwbood1cxxnmqriecp8rsteow UNIQUE (next_version_id);


--
-- Name: role uk_irsamgnera6angm0prq1kemt2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT uk_irsamgnera6angm0prq1kemt2 UNIQUE (authority);


--
-- Name: role_hierarchy_entry uk_k1j0pacdfek7h4o3te5ugab8e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_hierarchy_entry
    ADD CONSTRAINT uk_k1j0pacdfek7h4o3te5ugab8e UNIQUE (entry);


--
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: bookstore_shelf fk17v98p9idl701wtwmhtxv15ot; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_shelf
    ADD CONSTRAINT fk17v98p9idl701wtwmhtxv15ot FOREIGN KEY (user_updated_id) REFERENCES public.taack_user(id);


--
-- Name: attachment fk1bx8t44weuwbssc0sojeh2rej; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT fk1bx8t44weuwbssc0sojeh2rej FOREIGN KEY (next_version_id) REFERENCES public.attachment(id);


--
-- Name: bookstore_borrower fk2r448sd941bmd2b8624w39lfo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_borrower
    ADD CONSTRAINT fk2r448sd941bmd2b8624w39lfo FOREIGN KEY (user_updated_id) REFERENCES public.taack_user(id);


--
-- Name: bookstore_shelf fk3a4p3wmxmaj85ldjl0cm0scda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_shelf
    ADD CONSTRAINT fk3a4p3wmxmaj85ldjl0cm0scda FOREIGN KEY (user_created_id) REFERENCES public.taack_user(id);


--
-- Name: bookstore_borrowed_book fk4syv9gakw5a2wd32xy9nqw0cx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_borrowed_book
    ADD CONSTRAINT fk4syv9gakw5a2wd32xy9nqw0cx FOREIGN KEY (user_created_id) REFERENCES public.taack_user(id);


--
-- Name: bookstore_book fk4w5xu83n873frv1wddjr5u4pb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_book
    ADD CONSTRAINT fk4w5xu83n873frv1wddjr5u4pb FOREIGN KEY (author_id) REFERENCES public.bookstore_author(id);


--
-- Name: attachment_role fk5th8ygrg6fnqekgmq17k4fbt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment_role
    ADD CONSTRAINT fk5th8ygrg6fnqekgmq17k4fbt FOREIGN KEY (attachment_granted_roles_id) REFERENCES public.attachment(id);


--
-- Name: bookstore_author fk62f7tgy2exe1j0gmi4s4vltco; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_author
    ADD CONSTRAINT fk62f7tgy2exe1j0gmi4s4vltco FOREIGN KEY (user_created_id) REFERENCES public.taack_user(id);


--
-- Name: attachment_role fk6850dspl7w3q5l9ea2l00p0ic; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment_role
    ADD CONSTRAINT fk6850dspl7w3q5l9ea2l00p0ic FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: taack_user_attachment fk6g436w6262spjbgvioostt6hf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taack_user_attachment
    ADD CONSTRAINT fk6g436w6262spjbgvioostt6hf FOREIGN KEY (attachment_id) REFERENCES public.attachment(id);


--
-- Name: bookstore_borrower_book fk6q99sc5kvql4uu4qkhdn2flpd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_borrower_book
    ADD CONSTRAINT fk6q99sc5kvql4uu4qkhdn2flpd FOREIGN KEY (user_updated_id) REFERENCES public.taack_user(id);


--
-- Name: term fk78vuobrchwyxdrt1el3rengal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.term
    ADD CONSTRAINT fk78vuobrchwyxdrt1el3rengal FOREIGN KEY (parent_id) REFERENCES public.term(id);


--
-- Name: attachment fk7rcajc63ag01nddj99xpjgf48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT fk7rcajc63ag01nddj99xpjgf48 FOREIGN KEY (user_created_id) REFERENCES public.taack_user(id);


--
-- Name: taack_user fk7x5oc2ipx63940xn5vruu3k21; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taack_user
    ADD CONSTRAINT fk7x5oc2ipx63940xn5vruu3k21 FOREIGN KEY (user_created_id) REFERENCES public.taack_user(id);


--
-- Name: attachment_term fk8atxjg43k5ofmwrpr4gqrbdne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment_term
    ADD CONSTRAINT fk8atxjg43k5ofmwrpr4gqrbdne FOREIGN KEY (attachment_tags_id) REFERENCES public.attachment(id);


--
-- Name: bookstore_borrowed_book fk9efujq1svhl3teb0lvroh1yy9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_borrowed_book
    ADD CONSTRAINT fk9efujq1svhl3teb0lvroh1yy9 FOREIGN KEY (book_id) REFERENCES public.bookstore_book(id);


--
-- Name: alert_taack_user fk9xna8u6229esmmekw2974tadp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_taack_user
    ADD CONSTRAINT fk9xna8u6229esmmekw2974tadp FOREIGN KEY (user_id) REFERENCES public.taack_user(id);


--
-- Name: user_role fka68196081fvovjhkek5m97n3y; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fka68196081fvovjhkek5m97n3y FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: attachment_taack_user fkaibm7wnv9ehm86pkcahn7wylt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment_taack_user
    ADD CONSTRAINT fkaibm7wnv9ehm86pkcahn7wylt FOREIGN KEY (user_id) REFERENCES public.taack_user(id);


--
-- Name: roles_read_attachment fkbt0tei5cx12xx55j86n8jk4u6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_read_attachment
    ADD CONSTRAINT fkbt0tei5cx12xx55j86n8jk4u6 FOREIGN KEY (attachment_granted_roles_read_id) REFERENCES public.attachment(id);


--
-- Name: user_role fkcjjd5iwes2yktldkenmfsrq43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fkcjjd5iwes2yktldkenmfsrq43 FOREIGN KEY (user_id) REFERENCES public.taack_user(id);


--
-- Name: attachment_term fkckm434wrayj9h8dcs16maugta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment_term
    ADD CONSTRAINT fkckm434wrayj9h8dcs16maugta FOREIGN KEY (term_id) REFERENCES public.term(id);


--
-- Name: bookstore_borrowed_book fkemb608a0w4g9ymrerbfueldxo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_borrowed_book
    ADD CONSTRAINT fkemb608a0w4g9ymrerbfueldxo FOREIGN KEY (borrower_id) REFERENCES public.bookstore_borrower(id);


--
-- Name: users_read_attachment fkfkhof53t37g54uqu2ujqgy1uy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_read_attachment
    ADD CONSTRAINT fkfkhof53t37g54uqu2ujqgy1uy FOREIGN KEY (user_id) REFERENCES public.taack_user(id);


--
-- Name: bookstore_book fkfrttbck9i1i174qu9rtfduitf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_book
    ADD CONSTRAINT fkfrttbck9i1i174qu9rtfduitf FOREIGN KEY (user_created_id) REFERENCES public.taack_user(id);


--
-- Name: taack_user_attachment fkh5q6jabxo6m2s33m5cd22r53t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taack_user_attachment
    ADD CONSTRAINT fkh5q6jabxo6m2s33m5cd22r53t FOREIGN KEY (user_attachments_id) REFERENCES public.taack_user(id);


--
-- Name: attachment_taack_user fkhr8tfw3foo70k8rn4ufpki8da; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment_taack_user
    ADD CONSTRAINT fkhr8tfw3foo70k8rn4ufpki8da FOREIGN KEY (attachment_granted_users_id) REFERENCES public.attachment(id);


--
-- Name: bookstore_borrower_book fkk5stlhad6l8akd8ps87hjfgsf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_borrower_book
    ADD CONSTRAINT fkk5stlhad6l8akd8ps87hjfgsf FOREIGN KEY (user_created_id) REFERENCES public.taack_user(id);


--
-- Name: alert_role fkkfsnf3vc03oyf982wiike4jmg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_role
    ADD CONSTRAINT fkkfsnf3vc03oyf982wiike4jmg FOREIGN KEY (alert_restricted_roles_id) REFERENCES public.alert(id);


--
-- Name: taack_user fkkm5ivk79eqcomn5amkweuhmr8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taack_user
    ADD CONSTRAINT fkkm5ivk79eqcomn5amkweuhmr8 FOREIGN KEY (manager_id) REFERENCES public.taack_user(id);


--
-- Name: bookstore_borrowed_book fkl7flhhcylps9i18tivnl7j3nk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_borrowed_book
    ADD CONSTRAINT fkl7flhhcylps9i18tivnl7j3nk FOREIGN KEY (user_updated_id) REFERENCES public.taack_user(id);


--
-- Name: roles_read_attachment fklqnouon93xyeh08vwk6cwmlna; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_read_attachment
    ADD CONSTRAINT fklqnouon93xyeh08vwk6cwmlna FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: users_read_attachment fklyuenmjuc885m9nyqwvhp3t6y; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_read_attachment
    ADD CONSTRAINT fklyuenmjuc885m9nyqwvhp3t6y FOREIGN KEY (attachment_granted_users_read_id) REFERENCES public.attachment(id);


--
-- Name: bookstore_borrower_book fkm9v1wggb9yrc7x2abmcb4ffed; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_borrower_book
    ADD CONSTRAINT fkm9v1wggb9yrc7x2abmcb4ffed FOREIGN KEY (borrower_id) REFERENCES public.bookstore_borrower(id);


--
-- Name: bookstore_borrower_book fko0e1qhdh11yl6k0m51rhs7r38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_borrower_book
    ADD CONSTRAINT fko0e1qhdh11yl6k0m51rhs7r38 FOREIGN KEY (book_id) REFERENCES public.bookstore_book(id);


--
-- Name: bookstore_author fkp94iy3mjlclwp184lwicdy77u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_author
    ADD CONSTRAINT fkp94iy3mjlclwp184lwicdy77u FOREIGN KEY (user_updated_id) REFERENCES public.taack_user(id);


--
-- Name: alert_taack_user fkpd4hu55y56li07e28hlshma4o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_taack_user
    ADD CONSTRAINT fkpd4hu55y56li07e28hlshma4o FOREIGN KEY (alert_users_id) REFERENCES public.alert(id);


--
-- Name: attachment fkpscfmagtuu6y1hxbkhsvrpf0d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT fkpscfmagtuu6y1hxbkhsvrpf0d FOREIGN KEY (user_updated_id) REFERENCES public.taack_user(id);


--
-- Name: bookstore_book fkqgok2nlg7tkowafh2kj6y822a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_book
    ADD CONSTRAINT fkqgok2nlg7tkowafh2kj6y822a FOREIGN KEY (book_shelf_id) REFERENCES public.bookstore_shelf(id);


--
-- Name: alert_role fkra4go3828mo8davfac9oipwcd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_role
    ADD CONSTRAINT fkra4go3828mo8davfac9oipwcd FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: bookstore_book fksqkyflnvx653etpx87dn6igra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_book
    ADD CONSTRAINT fksqkyflnvx653etpx87dn6igra FOREIGN KEY (user_updated_id) REFERENCES public.taack_user(id);


--
-- Name: bookstore_borrower fkw0ucl1ft3xrh56v865p5xpbg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookstore_borrower
    ADD CONSTRAINT fkw0ucl1ft3xrh56v865p5xpbg FOREIGN KEY (user_created_id) REFERENCES public.taack_user(id);


--
-- PostgreSQL database dump complete
--

