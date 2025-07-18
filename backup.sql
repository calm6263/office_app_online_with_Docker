--
-- PostgreSQL database dump
--

-- Dumped from database version 13.21 (Debian 13.21-1.pgdg120+1)
-- Dumped by pg_dump version 13.21 (Debian 13.21-1.pgdg120+1)

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
-- Name: customer; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    email character varying(100),
    password character varying(255),
    registration_date timestamp without time zone
);


ALTER TABLE public.customer OWNER TO "user";

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO "user";

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- Name: expense; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.expense (
    id integer NOT NULL,
    date character varying(20) NOT NULL,
    amount double precision NOT NULL,
    description character varying(200),
    paid_by character varying(50)
);


ALTER TABLE public.expense OWNER TO "user";

--
-- Name: expense_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.expense_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expense_id_seq OWNER TO "user";

--
-- Name: expense_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.expense_id_seq OWNED BY public.expense.id;


--
-- Name: notification; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.notification (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL,
    "timestamp" timestamp without time zone,
    is_read boolean,
    link character varying(200)
);


ALTER TABLE public.notification OWNER TO "user";

--
-- Name: notification_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_id_seq OWNER TO "user";

--
-- Name: notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.notification_id_seq OWNED BY public.notification.id;


--
-- Name: request_file; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.request_file (
    id integer NOT NULL,
    request_id integer,
    file_path character varying(200),
    file_type character varying(20)
);


ALTER TABLE public.request_file OWNER TO "user";

--
-- Name: request_file_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.request_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.request_file_id_seq OWNER TO "user";

--
-- Name: request_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.request_file_id_seq OWNED BY public.request_file.id;


--
-- Name: service_request; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.service_request (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    service_type character varying(50) NOT NULL,
    description text,
    status character varying(20),
    request_date timestamp without time zone,
    transaction_id integer
);


ALTER TABLE public.service_request OWNER TO "user";

--
-- Name: service_request_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.service_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_request_id_seq OWNER TO "user";

--
-- Name: service_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.service_request_id_seq OWNED BY public.service_request.id;


--
-- Name: transaction; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.transaction (
    id integer NOT NULL,
    date character varying(20) NOT NULL,
    "time" character varying(10) NOT NULL,
    "user" character varying(50) NOT NULL,
    client_name character varying(100) NOT NULL,
    phone character varying(20),
    office_location character varying(50),
    services text NOT NULL,
    university_name character varying(100),
    quantity integer,
    total double precision,
    payment_status character varying(20),
    payment_method character varying(20),
    receiver_number character varying(20),
    paid_amount double precision,
    remaining_amount double precision,
    paid_by character varying(50),
    receive_date character varying(20),
    delivery_date character varying(20),
    notes text,
    source_language character varying(50),
    target_language character varying(50),
    status character varying(20),
    paid_date date,
    is_pending boolean,
    is_edit boolean
);


ALTER TABLE public.transaction OWNER TO "user";

--
-- Name: transaction_file; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.transaction_file (
    id integer NOT NULL,
    transaction_id integer,
    file_path character varying(200),
    file_type character varying(20)
);


ALTER TABLE public.transaction_file OWNER TO "user";

--
-- Name: transaction_file_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.transaction_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_file_id_seq OWNER TO "user";

--
-- Name: transaction_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.transaction_file_id_seq OWNED BY public.transaction_file.id;


--
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_id_seq OWNER TO "user";

--
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(20)
);


ALTER TABLE public."user" OWNER TO "user";

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO "user";

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- Name: expense id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.expense ALTER COLUMN id SET DEFAULT nextval('public.expense_id_seq'::regclass);


--
-- Name: notification id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.notification ALTER COLUMN id SET DEFAULT nextval('public.notification_id_seq'::regclass);


--
-- Name: request_file id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.request_file ALTER COLUMN id SET DEFAULT nextval('public.request_file_id_seq'::regclass);


--
-- Name: service_request id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.service_request ALTER COLUMN id SET DEFAULT nextval('public.service_request_id_seq'::regclass);


--
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- Name: transaction_file id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transaction_file ALTER COLUMN id SET DEFAULT nextval('public.transaction_file_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.customer (id, name, phone, email, password, registration_date) FROM stdin;
1	Hasan Asaad	89150735670	Hasanaasaad90@gmail.com	scrypt:32768:8:1$Ec2ZI5ihvc5XtOpV$b557f1eb2c2edb9a43c83842ec7c486619af497e358f26ff714d71176df953a7c202d99ea87c9c0de81d48a5934c042449e4129a3f5cabbf357d64580c3538fa	2025-07-12 11:05:19.783529
\.


--
-- Data for Name: expense; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.expense (id, date, amount, description, paid_by) FROM stdin;
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.notification (id, user_id, message, "timestamp", is_read, link) FROM stdin;
\.


--
-- Data for Name: request_file; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.request_file (id, request_id, file_path, file_type) FROM stdin;
\.


--
-- Data for Name: service_request; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.service_request (id, customer_id, service_type, description, status, request_date, transaction_id) FROM stdin;
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.transaction (id, date, "time", "user", client_name, phone, office_location, services, university_name, quantity, total, payment_status, payment_method, receiver_number, paid_amount, remaining_amount, paid_by, receive_date, delivery_date, notes, source_language, target_language, status, paid_date, is_pending, is_edit) FROM stdin;
\.


--
-- Data for Name: transaction_file; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.transaction_file (id, transaction_id, file_path, file_type) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."user" (id, username, password, role) FROM stdin;
1	┘à╪╡╪╖┘ü┘ë	scrypt:32768:8:1$iPuqDs4P7SGwrMBH$f3026f8fb198a6374587c891604f8b6d6fe79381479cc3e1b34c9030d3a38634f8c1752faa86bee6a739db8c32f12df84e295a3cf3c2f3ea019743ed61ed91ee	user
2	┘à╪¡┘à╪»	scrypt:32768:8:1$G4TCWEzEpljkL9DA$22ae2765c4e2e1a5a270665fbbf3a2754eac8dda961a5aceb712de27c013fea42a720ef08855f81c5293cd589bcacc9875ed416bfae0eeb367e24f737f9791d7	user
3	╪º╪¿╪▒╪º┘ç┘è┘à	scrypt:32768:8:1$WPdsxh8Pb9YzbuIK$adb4bf8e950e1d71a5746da7f9a8f839f8c5300a664c6d3c28c54f4caf10aafe9b6a4b4b0b78b96e1400d7b14ffb592fb1504e0a88ed4612fa7b3ae298636973	admin
\.


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.customer_id_seq', 1, true);


--
-- Name: expense_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.expense_id_seq', 1, false);


--
-- Name: notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.notification_id_seq', 1, false);


--
-- Name: request_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.request_file_id_seq', 1, false);


--
-- Name: service_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.service_request_id_seq', 1, false);


--
-- Name: transaction_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.transaction_file_id_seq', 1, false);


--
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.transaction_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.user_id_seq', 4, true);


--
-- Name: customer customer_phone_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_phone_key UNIQUE (phone);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: expense expense_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.expense
    ADD CONSTRAINT expense_pkey PRIMARY KEY (id);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: request_file request_file_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.request_file
    ADD CONSTRAINT request_file_pkey PRIMARY KEY (id);


--
-- Name: service_request service_request_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.service_request
    ADD CONSTRAINT service_request_pkey PRIMARY KEY (id);


--
-- Name: transaction_file transaction_file_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transaction_file
    ADD CONSTRAINT transaction_file_pkey PRIMARY KEY (id);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: idx_client_phone; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_client_phone ON public.transaction USING btree (client_name, phone);


--
-- Name: idx_date_client; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_date_client ON public.transaction USING btree (date, client_name);


--
-- Name: idx_date_payment; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_date_payment ON public.transaction USING btree (date, payment_status);


--
-- Name: idx_date_status; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_date_status ON public.transaction USING btree (date, status);


--
-- Name: idx_payment_status_method; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_payment_status_method ON public.transaction USING btree (payment_status, payment_method);


--
-- Name: ix_expense_date; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_expense_date ON public.expense USING btree (date);


--
-- Name: ix_transaction_client_name; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_transaction_client_name ON public.transaction USING btree (client_name);


--
-- Name: ix_transaction_date; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_transaction_date ON public.transaction USING btree (date);


--
-- Name: ix_transaction_delivery_date; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_transaction_delivery_date ON public.transaction USING btree (delivery_date);


--
-- Name: ix_transaction_file_transaction_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_transaction_file_transaction_id ON public.transaction_file USING btree (transaction_id);


--
-- Name: ix_transaction_is_pending; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_transaction_is_pending ON public.transaction USING btree (is_pending);


--
-- Name: ix_transaction_payment_method; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_transaction_payment_method ON public.transaction USING btree (payment_method);


--
-- Name: ix_transaction_payment_status; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_transaction_payment_status ON public.transaction USING btree (payment_status);


--
-- Name: ix_transaction_phone; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_transaction_phone ON public.transaction USING btree (phone);


--
-- Name: ix_transaction_receive_date; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_transaction_receive_date ON public.transaction USING btree (receive_date);


--
-- Name: ix_transaction_source_language; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_transaction_source_language ON public.transaction USING btree (source_language);


--
-- Name: ix_transaction_status; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_transaction_status ON public.transaction USING btree (status);


--
-- Name: ix_transaction_target_language; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_transaction_target_language ON public.transaction USING btree (target_language);


--
-- Name: ix_transaction_user; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_transaction_user ON public.transaction USING btree ("user");


--
-- Name: notification notification_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: request_file request_file_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.request_file
    ADD CONSTRAINT request_file_request_id_fkey FOREIGN KEY (request_id) REFERENCES public.service_request(id);


--
-- Name: service_request service_request_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.service_request
    ADD CONSTRAINT service_request_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- Name: service_request service_request_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.service_request
    ADD CONSTRAINT service_request_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction(id);


--
-- Name: transaction_file transaction_file_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transaction_file
    ADD CONSTRAINT transaction_file_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction(id);


--
-- PostgreSQL database dump complete
--

