--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.4

-- Started on 2022-10-17 14:49:01

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
-- TOC entry 217 (class 1259 OID 24597)
-- Name: aircrafts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aircrafts (
    aircraft_id integer NOT NULL,
    user_id character varying(50) NOT NULL
);


ALTER TABLE public.aircrafts OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24596)
-- Name: aircrafts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.aircrafts ALTER COLUMN aircraft_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.aircrafts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 24601)
-- Name: airports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airports (
    airport_id integer NOT NULL,
    code character varying(3) NOT NULL,
    city character varying(50) NOT NULL,
    name character varying
);


ALTER TABLE public.airports OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24600)
-- Name: airports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.airports ALTER COLUMN airport_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.airports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16417)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    fullname character varying(100)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16416)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 16387)
-- Name: flights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flights (
    flight_id integer NOT NULL,
    flight_no character varying(10) NOT NULL,
    scheduled_departure timestamp(0) with time zone NOT NULL,
    scheduled_arrival timestamp(0) with time zone NOT NULL,
    actual_departure timestamp(0) with time zone,
    actual_arrival timestamp(0) with time zone,
    departure_airport integer NOT NULL,
    arrival_airport integer NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    aircraft_id integer NOT NULL
);


ALTER TABLE public.flights OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16386)
-- Name: flights_flight_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flights_flight_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flights_flight_id_seq OWNER TO postgres;

--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 209
-- Name: flights_flight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flights_flight_id_seq OWNED BY public.flights.flight_id;


--
-- TOC entry 211 (class 1259 OID 16409)
-- Name: flights_flight_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.flights ALTER COLUMN flight_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.flights_flight_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 213 (class 1259 OID 16411)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer,
    created timestamp(0) with time zone
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16410)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN order_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 24653)
-- Name: seats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seats (
    aircraft_id integer NOT NULL,
    seat_no character varying(5) NOT NULL,
    class integer NOT NULL
);


ALTER TABLE public.seats OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24643)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    status_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24642)
-- Name: status_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.status ALTER COLUMN status_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.status_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 24664)
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    ticket_id integer NOT NULL,
    order_id integer NOT NULL,
    passenger_id integer NOT NULL,
    flight_id integer NOT NULL
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24663)
-- Name: tickets_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tickets ALTER COLUMN ticket_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tickets_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3380 (class 0 OID 24597)
-- Dependencies: 217
-- Data for Name: aircrafts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aircrafts (aircraft_id, user_id) FROM stdin;
\.


--
-- TOC entry 3382 (class 0 OID 24601)
-- Dependencies: 219
-- Data for Name: airports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airports (airport_id, code, city, name) FROM stdin;
\.


--
-- TOC entry 3378 (class 0 OID 16417)
-- Dependencies: 215
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, fullname) FROM stdin;
1	Иван
2	Алексей
4	Алекс
5	Василий
6	Василий 2
9	Иван 3
3	Александр
8	Александрина
7	Алексий
\.


--
-- TOC entry 3373 (class 0 OID 16387)
-- Dependencies: 210
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flights (flight_id, flight_no, scheduled_departure, scheduled_arrival, actual_departure, actual_arrival, departure_airport, arrival_airport, status, aircraft_id) FROM stdin;
\.


--
-- TOC entry 3376 (class 0 OID 16411)
-- Dependencies: 213
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_id, created) FROM stdin;
1	1	\N
2	2	\N
4	4	\N
5	1	\N
6	3	\N
9	7	\N
7	6	\N
3	9	\N
8	8	\N
\.


--
-- TOC entry 3385 (class 0 OID 24653)
-- Dependencies: 222
-- Data for Name: seats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seats (aircraft_id, seat_no, class) FROM stdin;
\.


--
-- TOC entry 3384 (class 0 OID 24643)
-- Dependencies: 221
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (status_id, name) FROM stdin;
\.


--
-- TOC entry 3387 (class 0 OID 24664)
-- Dependencies: 224
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tickets (ticket_id, order_id, passenger_id, flight_id) FROM stdin;
\.


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 216
-- Name: aircrafts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aircrafts_id_seq', 1, false);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 218
-- Name: airports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.airports_id_seq', 1, false);


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 214
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 9, true);


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 209
-- Name: flights_flight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flights_flight_id_seq', 1, false);


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 211
-- Name: flights_flight_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flights_flight_id_seq1', 1, false);


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 212
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 9, true);


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 220
-- Name: status_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_status_id_seq', 1, false);


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 223
-- Name: tickets_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_ticket_id_seq', 1, false);


--
-- TOC entry 3215 (class 2606 OID 24626)
-- Name: aircrafts aircrafts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aircrafts
    ADD CONSTRAINT aircrafts_pk PRIMARY KEY (aircraft_id);


--
-- TOC entry 3217 (class 2606 OID 24622)
-- Name: airports airports_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_pk PRIMARY KEY (airport_id);


--
-- TOC entry 3213 (class 2606 OID 16421)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 16405)
-- Name: flights flights_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_pk PRIMARY KEY (flight_id);


--
-- TOC entry 3208 (class 2606 OID 16407)
-- Name: flights flights_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_un UNIQUE (flight_no, scheduled_departure);


--
-- TOC entry 3211 (class 2606 OID 16415)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 3221 (class 2606 OID 24657)
-- Name: seats seats_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_pk PRIMARY KEY (aircraft_id, seat_no);


--
-- TOC entry 3219 (class 2606 OID 24647)
-- Name: status status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pk PRIMARY KEY (status_id);


--
-- TOC entry 3223 (class 2606 OID 24668)
-- Name: tickets tickets_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pk PRIMARY KEY (ticket_id);


--
-- TOC entry 3209 (class 1259 OID 24620)
-- Name: orders_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_id_idx ON public.orders USING btree (order_id);


--
-- TOC entry 3224 (class 2606 OID 24627)
-- Name: flights flights_aircraft_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_aircraft_fk FOREIGN KEY (aircraft_id) REFERENCES public.aircrafts(aircraft_id);


--
-- TOC entry 3225 (class 2606 OID 24632)
-- Name: flights flights_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_fk FOREIGN KEY (departure_airport) REFERENCES public.airports(airport_id);


--
-- TOC entry 3226 (class 2606 OID 24637)
-- Name: flights flights_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_fk_1 FOREIGN KEY (arrival_airport) REFERENCES public.airports(airport_id);


--
-- TOC entry 3227 (class 2606 OID 24648)
-- Name: flights flights_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_fk_2 FOREIGN KEY (status) REFERENCES public.status(status_id);


--
-- TOC entry 3228 (class 2606 OID 16457)
-- Name: orders orders_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_fk FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- TOC entry 3229 (class 2606 OID 24658)
-- Name: seats seats_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_fk FOREIGN KEY (aircraft_id) REFERENCES public.aircrafts(aircraft_id);


--
-- TOC entry 3230 (class 2606 OID 24669)
-- Name: tickets tickets_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_fk FOREIGN KEY (flight_id) REFERENCES public.flights(flight_id);


--
-- TOC entry 3231 (class 2606 OID 24674)
-- Name: tickets tickets_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_fk_1 FOREIGN KEY (passenger_id) REFERENCES public.customers(id);


--
-- TOC entry 3232 (class 2606 OID 24679)
-- Name: tickets tickets_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_fk_2 FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


-- Completed on 2022-10-17 14:49:01

--
-- PostgreSQL database dump complete
--

