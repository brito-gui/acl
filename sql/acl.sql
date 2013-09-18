--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-09-18 00:13:32 BRT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1955 (class 1262 OID 16384)
-- Name: codeigniter; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE codeigniter WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';


ALTER DATABASE codeigniter OWNER TO postgres;

\connect codeigniter

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 171 (class 3079 OID 11681)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1958 (class 0 OID 0)
-- Dependencies: 171
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 16447)
-- Dependencies: 5
-- Name: acl; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE acl (
    id integer NOT NULL,
    menuid integer NOT NULL,
    userid integer,
    roleid integer,
    actionid integer NOT NULL
);


ALTER TABLE public.acl OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 16445)
-- Dependencies: 5 170
-- Name: acl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE acl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acl_id_seq OWNER TO postgres;

--
-- TOC entry 1959 (class 0 OID 0)
-- Dependencies: 169
-- Name: acl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE acl_id_seq OWNED BY acl.id;


--
-- TOC entry 166 (class 1259 OID 16423)
-- Dependencies: 1921 5
-- Name: actions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE actions (
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    "order" integer NOT NULL,
    active smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.actions OWNER TO postgres;

--
-- TOC entry 165 (class 1259 OID 16421)
-- Dependencies: 166 5
-- Name: actions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actions_id_seq OWNER TO postgres;

--
-- TOC entry 1960 (class 0 OID 0)
-- Dependencies: 165
-- Name: actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE actions_id_seq OWNED BY actions.id;


--
-- TOC entry 168 (class 1259 OID 16435)
-- Dependencies: 1923 5
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menu (
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    controller character varying(100) NOT NULL,
    parentid integer,
    "order" integer NOT NULL,
    active smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- TOC entry 167 (class 1259 OID 16433)
-- Dependencies: 168 5
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_seq OWNER TO postgres;

--
-- TOC entry 1961 (class 0 OID 0)
-- Dependencies: 167
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.id;


--
-- TOC entry 164 (class 1259 OID 16399)
-- Dependencies: 1919 5
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    active smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 163 (class 1259 OID 16397)
-- Dependencies: 164 5
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 1962 (class 0 OID 0)
-- Dependencies: 163
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- TOC entry 162 (class 1259 OID 16387)
-- Dependencies: 1917 5
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    roleid integer,
    active smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 161 (class 1259 OID 16385)
-- Dependencies: 162 5
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 1963 (class 0 OID 0)
-- Dependencies: 161
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 1924 (class 2604 OID 16450)
-- Dependencies: 170 169 170
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl ALTER COLUMN id SET DEFAULT nextval('acl_id_seq'::regclass);


--
-- TOC entry 1920 (class 2604 OID 16426)
-- Dependencies: 166 165 166
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actions ALTER COLUMN id SET DEFAULT nextval('actions_id_seq'::regclass);


--
-- TOC entry 1922 (class 2604 OID 16438)
-- Dependencies: 167 168 168
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- TOC entry 1918 (class 2604 OID 16402)
-- Dependencies: 163 164 164
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- TOC entry 1916 (class 2604 OID 16390)
-- Dependencies: 161 162 162
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 1950 (class 0 OID 16447)
-- Dependencies: 170 1951
-- Data for Name: acl; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1964 (class 0 OID 0)
-- Dependencies: 169
-- Name: acl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('acl_id_seq', 1, false);


--
-- TOC entry 1946 (class 0 OID 16423)
-- Dependencies: 166 1951
-- Data for Name: actions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1965 (class 0 OID 0)
-- Dependencies: 165
-- Name: actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('actions_id_seq', 1, false);


--
-- TOC entry 1948 (class 0 OID 16435)
-- Dependencies: 168 1951
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1966 (class 0 OID 0)
-- Dependencies: 167
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menu_id_seq', 1, false);


--
-- TOC entry 1944 (class 0 OID 16399)
-- Dependencies: 164 1951
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1967 (class 0 OID 0)
-- Dependencies: 163
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 1, false);


--
-- TOC entry 1942 (class 0 OID 16387)
-- Dependencies: 162 1951
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1968 (class 0 OID 0)
-- Dependencies: 161
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- TOC entry 1934 (class 2606 OID 16452)
-- Dependencies: 170 170 1952
-- Name: acl_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY acl
    ADD CONSTRAINT acl_pk PRIMARY KEY (id);


--
-- TOC entry 1930 (class 2606 OID 16432)
-- Dependencies: 166 166 1952
-- Name: actions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY actions
    ADD CONSTRAINT actions_pk PRIMARY KEY (id);


--
-- TOC entry 1932 (class 2606 OID 16444)
-- Dependencies: 168 168 1952
-- Name: menu_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pk PRIMARY KEY (id);


--
-- TOC entry 1928 (class 2606 OID 16408)
-- Dependencies: 164 164 1952
-- Name: roles_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pk PRIMARY KEY (id);


--
-- TOC entry 1926 (class 2606 OID 16396)
-- Dependencies: 162 162 1952
-- Name: users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- TOC entry 1940 (class 2606 OID 16469)
-- Dependencies: 166 1929 170 1952
-- Name: acl_actionid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl
    ADD CONSTRAINT acl_actionid_fk FOREIGN KEY (actionid) REFERENCES actions(id);


--
-- TOC entry 1937 (class 2606 OID 16454)
-- Dependencies: 170 1931 168 1952
-- Name: acl_menu_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl
    ADD CONSTRAINT acl_menu_fk FOREIGN KEY (menuid) REFERENCES menu(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1939 (class 2606 OID 16464)
-- Dependencies: 170 1927 164 1952
-- Name: acl_roleid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl
    ADD CONSTRAINT acl_roleid_fk FOREIGN KEY (roleid) REFERENCES roles(id);


--
-- TOC entry 1938 (class 2606 OID 16459)
-- Dependencies: 1925 170 162 1952
-- Name: acl_userid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl
    ADD CONSTRAINT acl_userid_fk FOREIGN KEY (userid) REFERENCES users(id);


--
-- TOC entry 1936 (class 2606 OID 16474)
-- Dependencies: 1931 168 168 1952
-- Name: menu_parentid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_parentid_fk FOREIGN KEY (parentid) REFERENCES menu(id);


--
-- TOC entry 1935 (class 2606 OID 16479)
-- Dependencies: 1927 162 164 1952
-- Name: users_roleid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_roleid_fk FOREIGN KEY (roleid) REFERENCES roles(id);


--
-- TOC entry 1957 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-09-18 00:13:32 BRT

--
-- PostgreSQL database dump complete
--

