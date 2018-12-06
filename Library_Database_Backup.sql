--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: author; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.author (
    id integer NOT NULL,
    name character varying,
    books character varying
);


ALTER TABLE public.author OWNER TO "Guest";

--
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_id_seq OWNER TO "Guest";

--
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.author_id_seq OWNED BY public.author.id;


--
-- Name: book; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.book (
    id integer NOT NULL,
    author character varying,
    title character varying,
    status boolean
);


ALTER TABLE public.book OWNER TO "Guest";

--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_id_seq OWNER TO "Guest";

--
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;


--
-- Name: checkout; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.checkout (
    id integer NOT NULL,
    book_id integer,
    patron character varying,
    test date,
    duedate date
);


ALTER TABLE public.checkout OWNER TO "Guest";

--
-- Name: checkout_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.checkout_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checkout_id_seq OWNER TO "Guest";

--
-- Name: checkout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.checkout_id_seq OWNED BY public.checkout.id;


--
-- Name: patron; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.patron (
    id integer NOT NULL,
    name character varying,
    checkout_books character varying
);


ALTER TABLE public.patron OWNER TO "Guest";

--
-- Name: patron_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.patron_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patron_id_seq OWNER TO "Guest";

--
-- Name: patron_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.patron_id_seq OWNED BY public.patron.id;


--
-- Name: author id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.author ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);


--
-- Name: book id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);


--
-- Name: checkout id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.checkout ALTER COLUMN id SET DEFAULT nextval('public.checkout_id_seq'::regclass);


--
-- Name: patron id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.patron ALTER COLUMN id SET DEFAULT nextval('public.patron_id_seq'::regclass);


--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.author (id, name, books) FROM stdin;
\.


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.book (id, author, title, status) FROM stdin;
\.


--
-- Data for Name: checkout; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.checkout (id, book_id, patron, test, duedate) FROM stdin;
\.


--
-- Data for Name: patron; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.patron (id, name, checkout_books) FROM stdin;
\.


--
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.author_id_seq', 1, false);


--
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.book_id_seq', 1041, true);


--
-- Name: checkout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.checkout_id_seq', 1, false);


--
-- Name: patron_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.patron_id_seq', 1, false);


--
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: checkout checkout_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkout_pkey PRIMARY KEY (id);


--
-- Name: patron patron_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.patron
    ADD CONSTRAINT patron_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

