--
-- PostgreSQL database dump
--

-- Dumped from database version 11.16 (Debian 11.16-0+deb10u1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-07-27 12:56:45

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

--DROP DATABASE "2023-BFS-1-G4";
--
-- TOC entry 3161 (class 1262 OID 206201)
-- Name: 2023-BFS-1-G4; Type: DATABASE; Schema: -; Owner: -
--

--CREATE DATABASE "2023-BFS-1-G4" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


\connect -reuse-previous=on "dbname='2023-BFS-1-G4'"

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

--CREATE SCHEMA public;


--
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 198 (class 1259 OID 208494)
-- Name: a; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.a
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 208 (class 1259 OID 208787)
-- Name: b; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.b
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 222 (class 1259 OID 229314)
-- Name: bookingseq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bookingseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

--
-- TOC entry 223 (class 1259 OID 229316)
-- Name: booking; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.booking (
    id_booking integer DEFAULT nextval('public.bookingseq'::regclass) NOT NULL,
    id_trip integer NOT NULL,
    id_user character varying(50) NOT NULL,
    time_booking timestamp without time zone NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 229151)
-- Name: brand; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.brand
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 213 (class 1259 OID 229118)
-- Name: bseq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 210 (class 1259 OID 208988)
-- Name: c; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.c
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 218 (class 1259 OID 229268)
-- Name: carseq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.carseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 219 (class 1259 OID 229270)
-- Name: car; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.car (
    id_car integer DEFAULT nextval('public.carseq'::regclass) NOT NULL,
    seats integer,
    car_registration character varying(20),
    id_user character varying(50) NOT NULL,
    id_color integer NOT NULL,
    id_car_brand integer NOT NULL,
    id_car_model integer NOT NULL,
    active boolean DEFAULT true NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 229153)
-- Name: car_brand; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.car_brand (
    id_car_brand integer DEFAULT nextval('public.brand'::regclass) NOT NULL,
    brand_name character varying(100) NOT NULL,
    brand_image character varying DEFAULT 'default.png'::character varying
);


--
-- TOC entry 216 (class 1259 OID 229159)
-- Name: model; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.model
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 217 (class 1259 OID 229167)
-- Name: car_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.car_model (
    id_car_model integer DEFAULT nextval('public.model'::regclass) NOT NULL,
    model_name character varying(100) NOT NULL,
    id_car_brand integer NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 207154)
-- Name: car_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.car_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 211 (class 1259 OID 227813)
-- Name: colorseq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.colorseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 212 (class 1259 OID 227815)
-- Name: color; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.color (
    id_color integer DEFAULT nextval('public.colorseq'::regclass) NOT NULL,
    color_name character varying(50) NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 264523)
-- Name: headquarterseq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.headquarterseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 232 (class 1259 OID 264525)
-- Name: headquarter; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.headquarter (
    id_headquarter integer DEFAULT nextval('public.headquarterseq'::regclass) NOT NULL,
    headquarter_destination_title character varying(100) NOT NULL,
    headquarter_destination_address character varying(200) NOT NULL,
    image_headquarter_name character varying(50) NOT NULL,
    headquarter_type integer NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 263168)
-- Name: notificationseq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notificationseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 228 (class 1259 OID 263170)
-- Name: notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notification (
    id_notification integer DEFAULT nextval('public.notificationseq'::regclass) NOT NULL,
    text_notification character varying(500) NOT NULL,
    time_notification timestamp without time zone NOT NULL,
    id_trip integer NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 229296)
-- Name: tripseq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tripseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 221 (class 1259 OID 229298)
-- Name: trip; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trip (
    id_trip integer DEFAULT nextval('public.tripseq'::regclass) NOT NULL,
    origin_address character varying(200),
    destination_address character varying(200),
    date date,
    "time" timestamp without time zone,
    id_user character varying(50) NOT NULL,
    id_car integer NOT NULL,
    origin_title character varying NOT NULL,
    destination_title character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    destination_image character varying(50) DEFAULT 'default.png'::character varying
);


--
-- TOC entry 224 (class 1259 OID 243039)
-- Name: numberbookings; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.numberbookings AS
 SELECT count(b.*) AS number_bookings,
    t.id_trip
   FROM (public.trip t
     LEFT JOIN public.booking b ON ((t.id_trip = b.id_trip)))
  GROUP BY t.id_trip;


--
-- TOC entry 225 (class 1259 OID 262356)
-- Name: ratingseq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ratingseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 226 (class 1259 OID 262358)
-- Name: rating; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rating (
    id_rating integer DEFAULT nextval('public.ratingseq'::regclass) NOT NULL,
    rate integer NOT NULL,
    id_booking integer NOT NULL,
    id_user character varying(50) NOT NULL,
    id_driver character varying(50) NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 208629)
-- Name: tuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser (
    user_ character varying(50) NOT NULL,
    password character varying(255),
    name character varying(50),
    surname1 character varying(50),
    email character varying(50),
    nif character varying(50),
    userblocked timestamp without time zone,
    lastpasswordupdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    firstlogin boolean DEFAULT true,
    surname2 character varying(50)
);


--
-- TOC entry 233 (class 1259 OID 267582)
-- Name: personal_ratings; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.personal_ratings AS
 SELECT tu.user_,
    COALESCE(avg(r.rate), (0)::numeric) AS rate,
    COALESCE(count(r.id_rating), (0)::bigint) AS number_rates
   FROM (public.tuser tu
     LEFT JOIN public.rating r ON (((tu.user_)::text = (r.id_driver)::text)))
  GROUP BY tu.user_;


--
-- TOC entry 234 (class 1259 OID 267894)
-- Name: ratings_per_trip; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.ratings_per_trip AS
 SELECT t.id_trip,
    COALESCE(avg(r.rate), (0)::numeric) AS rate,
    COALESCE(count(r.*), (0)::bigint) AS number_rates
   FROM ((public.trip t
     LEFT JOIN public.booking b ON ((b.id_trip = t.id_trip)))
     LEFT JOIN public.rating r ON ((r.id_booking = b.id_booking)))
  GROUP BY t.id_trip;


--
-- TOC entry 199 (class 1259 OID 208507)
-- Name: ti18n; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ti18n (
    id_i18n integer DEFAULT nextval('public.a'::regclass) NOT NULL,
    class_name character varying(150),
    i18n_description character varying(250)
);


--
-- TOC entry 200 (class 1259 OID 208541)
-- Name: ti18n_value; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ti18n_value (
    id_i18n_value integer DEFAULT nextval('public.a'::regclass) NOT NULL,
    id_i18n integer NOT NULL,
    "KEY" character varying(250),
    es_es character varying(10485760),
    en_us character varying(10485760),
    gl_es character varying(10485760)
);


--
-- TOC entry 201 (class 1259 OID 208581)
-- Name: trequest_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trequest_statistics (
    id_request_statistics integer NOT NULL,
    service_name character varying(255),
    method_name character varying(50),
    user_name character varying(50),
    execution_date date,
    execution_time integer,
    method_params character varying(5000),
    service_exception character varying(5000)
);


--
-- TOC entry 229 (class 1259 OID 263635)
-- Name: triptrashseq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.triptrashseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 263637)
-- Name: trip_historical; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trip_historical (
    id_trip_historical integer DEFAULT nextval('public.triptrashseq'::regclass) NOT NULL,
    origin_title character varying NOT NULL,
    destination_title character varying NOT NULL,
    origin_address character varying(200),
    destination_address character varying(200),
    date date,
    "time" timestamp without time zone,
    id_user character varying(50) NOT NULL,
    id_car integer NOT NULL,
    id_trip integer NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 207167)
-- Name: trip_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trip_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 202 (class 1259 OID 208590)
-- Name: trole; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trole (
    id_rolename integer DEFAULT nextval('public.a'::regclass) NOT NULL,
    rolename character varying(255),
    xmlclientpermission character varying(10485760)
);


--
-- TOC entry 203 (class 1259 OID 208600)
-- Name: trole_server_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trole_server_permission (
    id_role_server_permission integer DEFAULT nextval('public.a'::regclass) NOT NULL,
    id_rolename integer,
    id_server_permission integer
);


--
-- TOC entry 204 (class 1259 OID 208609)
-- Name: tserver_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tserver_permission (
    id_server_permission integer DEFAULT nextval('public.a'::regclass) NOT NULL,
    permission_name character varying(10485760)
);


--
-- TOC entry 209 (class 1259 OID 208789)
-- Name: tsetting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tsetting (
    id_setting integer DEFAULT nextval('public.b'::regclass) NOT NULL,
    setting_key character varying(10485760),
    setting_value character varying(10485760),
    setting_comment character varying(10485760)
);


--
-- TOC entry 206 (class 1259 OID 208640)
-- Name: tuser_preference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser_preference (
    id_user_preference integer DEFAULT nextval('public.a'::regclass) NOT NULL,
    preference_name character varying(150),
    user_login character varying(150),
    preference_value character varying(10485760)
);


--
-- TOC entry 207 (class 1259 OID 208656)
-- Name: tuser_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser_role (
    id_user_role integer DEFAULT nextval('public.a'::regclass) NOT NULL,
    id_rolename integer,
    user_ character varying(50)
);


--
-- TOC entry 3147 (class 0 OID 229316)
-- Dependencies: 223
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.booking VALUES (73, 70, 'prueba', '2023-07-18 11:07:43.433');
INSERT INTO public.booking VALUES (87, 73, 'jaalva', '2023-07-19 09:59:03.684');
INSERT INTO public.booking VALUES (89, 76, 'jaalva', '2023-07-21 10:28:58.636');
INSERT INTO public.booking VALUES (96, 76, 'dagodi', '2023-07-26 12:23:28.928');
INSERT INTO public.booking VALUES (99, 81, 'jaalva', '2023-07-26 14:41:38.689');
INSERT INTO public.booking VALUES (102, 59, 'jaalva', '2023-07-27 12:02:27.975');
INSERT INTO public.booking VALUES (45, 55, 'guiviro', '2023-07-18 11:07:43.433');
INSERT INTO public.booking VALUES (47, 56, 'guiviro', '2023-07-18 11:07:43.433');
INSERT INTO public.booking VALUES (48, 59, 'guiviro', '2023-07-18 11:07:43.433');
INSERT INTO public.booking VALUES (72, 67, 'jaalva', '2023-07-18 11:07:43.433');
INSERT INTO public.booking VALUES (80, 54, 'prueba', '2023-07-18 11:44:46.904');
INSERT INTO public.booking VALUES (81, 72, 'jaalva', '2023-07-18 14:06:45.759');
INSERT INTO public.booking VALUES (82, 74, 'jaalva', '2023-07-18 14:06:54.023');
INSERT INTO public.booking VALUES (84, 72, 'guiviro', '2023-07-18 14:06:45.759');
INSERT INTO public.booking VALUES (85, 74, 'guiviro', '2023-07-18 14:06:54.023');
INSERT INTO public.booking VALUES (86, 73, 'guiviro', '2023-07-18 14:07:02.89');
INSERT INTO public.booking VALUES (3, 3, 'guiviro', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (4, 3, 'dagodi', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (5, 3, 'jaalva', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (7, 4, 'dagodi', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (8, 5, 'dagodi', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (9, 5, 'dagodi', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (10, 6, 'jaalva', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (12, 5, 'jaalva', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (16, 4, 'guiviro', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (17, 10, 'jaalva', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (18, 29, 'juanjo', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (21, 43, 'jaalva', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (22, 31, 'dagodi', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (23, 61, 'jaalva', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (24, 60, 'guiviro', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (26, 43, 'millan', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (27, 31, 'millan', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (28, 57, 'jaalva', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (34, 55, 'jaalva', '2023-07-10 11:07:43.433');
INSERT INTO public.booking VALUES (36, 63, 'guiviro', '2023-07-10 11:07:43.433');


--
-- TOC entry 3143 (class 0 OID 229270)
-- Dependencies: 219
-- Data for Name: car; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.car VALUES (2, 4, '1111ZZZ', 'guiviro', 2, 2, 8, true);
INSERT INTO public.car VALUES (3, 4, '1111MMM', 'dagodi', 1, 1, 1, true);
INSERT INTO public.car VALUES (29, 3, '2222CCC', 'roque', 1, 67, 814, false);
INSERT INTO public.car VALUES (5, 4, '6543NGH', 'juanjo', 4, 19, 209, true);
INSERT INTO public.car VALUES (28, 4, '1111SSS', 'roque', 11, 52, 544, false);
INSERT INTO public.car VALUES (30, 4, '1111SSS', 'roque', 2, 52, 544, true);
INSERT INTO public.car VALUES (8, 4, '6756JKG', 'millan', 2, 7, 55, true);
INSERT INTO public.car VALUES (9, 4, '8774CTW', 'jaalva', 5, 27, 307, true);
INSERT INTO public.car VALUES (11, 4, '5555DDD', 'guiviro', 3, 1, 1, true);
INSERT INTO public.car VALUES (12, 4, '6666RRR', 'guiviro', 11, 80, 1012, true);
INSERT INTO public.car VALUES (13, 3, '3333TTT', 'guiviro', 13, 67, 814, true);
INSERT INTO public.car VALUES (31, 3, '2222TTT', 'roque', 12, 67, 814, false);
INSERT INTO public.car VALUES (7, 4, '2222SSS', 'jaalva', 6, 38, 402, true);
INSERT INTO public.car VALUES (1, 4, '1111ZZZ', 'jaalva', 12, 12, 105, true);
INSERT INTO public.car VALUES (14, 4, '4444CDT', 'prueba', 13, 75, 1018, true);
INSERT INTO public.car VALUES (15, 3, '9999JJJ', 'prueba', 17, 42, 446, false);
INSERT INTO public.car VALUES (10, 4, '5278KFG', 'jaalva', 13, 30, 338, false);
INSERT INTO public.car VALUES (16, 3, '5555TTT', 'jaalva', 3, 52, 544, true);
INSERT INTO public.car VALUES (18, 4, '1111RRR', 'demo', 12, 52, 545, false);
INSERT INTO public.car VALUES (17, 3, '5454SSS', 'demo', 11, 79, 950, true);
INSERT INTO public.car VALUES (19, 4, '1111TTT', 'demo', 12, 75, 1013, true);
INSERT INTO public.car VALUES (20, 4, '5555FFF', 'demo', 13, 67, 814, true);


--
-- TOC entry 3139 (class 0 OID 229153)
-- Dependencies: 215
-- Data for Name: car_brand; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.car_brand VALUES (1, 'Abarth', 'default.png');
INSERT INTO public.car_brand VALUES (3, 'Aro', 'default.png');
INSERT INTO public.car_brand VALUES (4, 'Asia', 'default.png');
INSERT INTO public.car_brand VALUES (5, 'Asia Motors', 'default.png');
INSERT INTO public.car_brand VALUES (8, 'Austin', 'default.png');
INSERT INTO public.car_brand VALUES (9, 'Auverland', 'default.png');
INSERT INTO public.car_brand VALUES (10, 'Bentley', 'default.png');
INSERT INTO public.car_brand VALUES (11, 'Bertone', 'default.png');
INSERT INTO public.car_brand VALUES (15, 'Chrysler', 'default.png');
INSERT INTO public.car_brand VALUES (17, 'Corvette', 'default.png');
INSERT INTO public.car_brand VALUES (18, 'Cupra', 'default.png');
INSERT INTO public.car_brand VALUES (19, 'Dacia', 'default.png');
INSERT INTO public.car_brand VALUES (20, 'Daewoo', 'default.png');
INSERT INTO public.car_brand VALUES (21, 'DAF', 'default.png');
INSERT INTO public.car_brand VALUES (22, 'Daihatsu', 'default.png');
INSERT INTO public.car_brand VALUES (23, 'Daimler', 'default.png');
INSERT INTO public.car_brand VALUES (24, 'Dodge', 'default.png');
INSERT INTO public.car_brand VALUES (26, 'Fiat', 'default.png');
INSERT INTO public.car_brand VALUES (28, 'Galloper', 'default.png');
INSERT INTO public.car_brand VALUES (29, 'GMC', 'default.png');
INSERT INTO public.car_brand VALUES (31, 'Hummer', 'default.png');
INSERT INTO public.car_brand VALUES (32, 'Hyundai', 'default.png');
INSERT INTO public.car_brand VALUES (33, 'Infiniti', 'default.png');
INSERT INTO public.car_brand VALUES (34, 'Innocenti', 'default.png');
INSERT INTO public.car_brand VALUES (35, 'Isuzu', 'default.png');
INSERT INTO public.car_brand VALUES (36, 'Iveco', 'default.png');
INSERT INTO public.car_brand VALUES (37, 'Iveco-Pegaso', 'default.png');
INSERT INTO public.car_brand VALUES (39, 'Jeep', 'default.png');
INSERT INTO public.car_brand VALUES (40, 'Kia', 'default.png');
INSERT INTO public.car_brand VALUES (41, 'Lada', 'default.png');
INSERT INTO public.car_brand VALUES (43, 'Lancia', 'default.png');
INSERT INTO public.car_brand VALUES (44, 'Land Rover', 'default.png');
INSERT INTO public.car_brand VALUES (45, 'LDV', 'default.png');
INSERT INTO public.car_brand VALUES (47, 'Lotus', 'default.png');
INSERT INTO public.car_brand VALUES (48, 'Mahindra', 'default.png');
INSERT INTO public.car_brand VALUES (50, 'Maybach', 'default.png');
INSERT INTO public.car_brand VALUES (53, 'MG', 'default.png');
INSERT INTO public.car_brand VALUES (54, 'Mini', 'default.png');
INSERT INTO public.car_brand VALUES (55, 'Mitsubishi', 'default.png');
INSERT INTO public.car_brand VALUES (56, 'Morgan', 'default.png');
INSERT INTO public.car_brand VALUES (60, 'Pontiac', 'default.png');
INSERT INTO public.car_brand VALUES (63, 'Rolls-Royce', 'default.png');
INSERT INTO public.car_brand VALUES (64, 'Rover', 'default.png');
INSERT INTO public.car_brand VALUES (65, 'Saab', 'default.png');
INSERT INTO public.car_brand VALUES (66, 'Santana', 'default.png');
INSERT INTO public.car_brand VALUES (69, 'Smart', 'default.png');
INSERT INTO public.car_brand VALUES (70, 'SsangYong', 'default.png');
INSERT INTO public.car_brand VALUES (72, 'Suzuki', 'default.png');
INSERT INTO public.car_brand VALUES (73, 'Talbot', 'default.png');
INSERT INTO public.car_brand VALUES (74, 'Tata', 'default.png');
INSERT INTO public.car_brand VALUES (77, 'UMM', 'default.png');
INSERT INTO public.car_brand VALUES (78, 'VAZ', 'default.png');
INSERT INTO public.car_brand VALUES (81, 'Wartburg', 'default.png');
INSERT INTO public.car_brand VALUES (2, 'Alfa Romeo', 'alfaromeo.jpg');
INSERT INTO public.car_brand VALUES (6, 'Aston Martin', 'astonmartin.jpg');
INSERT INTO public.car_brand VALUES (7, 'Audi', 'audi.jpg');
INSERT INTO public.car_brand VALUES (12, 'BMW', 'bmw.jpg');
INSERT INTO public.car_brand VALUES (13, 'Cadillac', 'cadillac.jpg');
INSERT INTO public.car_brand VALUES (14, 'Chevrolet', 'chevrolet.jpg');
INSERT INTO public.car_brand VALUES (16, 'Citroën', 'citroen.png');
INSERT INTO public.car_brand VALUES (25, 'Ferrari', 'ferrari.png');
INSERT INTO public.car_brand VALUES (27, 'Ford', 'ford.png');
INSERT INTO public.car_brand VALUES (30, 'Honda', 'honda.png');
INSERT INTO public.car_brand VALUES (38, 'Jaguar', 'jaguar.png');
INSERT INTO public.car_brand VALUES (42, 'Lamborghini', 'lamborghini.png');
INSERT INTO public.car_brand VALUES (46, 'Lexus', 'lexus.jpg');
INSERT INTO public.car_brand VALUES (49, 'Maserati', 'maserati.png');
INSERT INTO public.car_brand VALUES (51, 'Mazda', 'mazda.jpeg');
INSERT INTO public.car_brand VALUES (52, 'Mercedes-Benz', 'mercedes.jpg');
INSERT INTO public.car_brand VALUES (57, 'Nissan', 'nissan.jpg');
INSERT INTO public.car_brand VALUES (58, 'Opel', 'opel.png');
INSERT INTO public.car_brand VALUES (59, 'Peugeot', 'peugeot.png');
INSERT INTO public.car_brand VALUES (61, 'Porsche', 'porsche.jpg');
INSERT INTO public.car_brand VALUES (62, 'Renault', 'renault.png');
INSERT INTO public.car_brand VALUES (67, 'SEAT', 'seat.png');
INSERT INTO public.car_brand VALUES (68, 'Škoda', 'skoda.jpg');
INSERT INTO public.car_brand VALUES (71, 'Subaru', 'subaru.png');
INSERT INTO public.car_brand VALUES (75, 'Tesla', 'tesla.png');
INSERT INTO public.car_brand VALUES (76, 'Toyota', 'toyota.jpg');
INSERT INTO public.car_brand VALUES (79, 'Volkswagen', 'volkswagen.jpg');
INSERT INTO public.car_brand VALUES (80, 'Volvo', 'volvo.jpg');


--
-- TOC entry 3141 (class 0 OID 229167)
-- Dependencies: 217
-- Data for Name: car_model; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.car_model VALUES (1, '500', 1);
INSERT INTO public.car_model VALUES (2, 'Grande Punto', 1);
INSERT INTO public.car_model VALUES (3, 'Punto Evo', 1);
INSERT INTO public.car_model VALUES (4, '500c', 1);
INSERT INTO public.car_model VALUES (5, '695', 1);
INSERT INTO public.car_model VALUES (6, 'Punto', 1);
INSERT INTO public.car_model VALUES (7, '155', 2);
INSERT INTO public.car_model VALUES (8, '156', 2);
INSERT INTO public.car_model VALUES (9, '159', 2);
INSERT INTO public.car_model VALUES (10, '164', 2);
INSERT INTO public.car_model VALUES (11, '145', 2);
INSERT INTO public.car_model VALUES (12, '147', 2);
INSERT INTO public.car_model VALUES (13, '146', 2);
INSERT INTO public.car_model VALUES (14, 'Gtv', 2);
INSERT INTO public.car_model VALUES (15, 'Spider', 2);
INSERT INTO public.car_model VALUES (16, '166', 2);
INSERT INTO public.car_model VALUES (17, 'Gt', 2);
INSERT INTO public.car_model VALUES (18, 'Crosswagon', 2);
INSERT INTO public.car_model VALUES (19, 'Brera', 2);
INSERT INTO public.car_model VALUES (20, '90', 2);
INSERT INTO public.car_model VALUES (21, '75', 2);
INSERT INTO public.car_model VALUES (22, '33', 2);
INSERT INTO public.car_model VALUES (23, 'Giulietta', 2);
INSERT INTO public.car_model VALUES (24, 'Sprint', 2);
INSERT INTO public.car_model VALUES (25, 'Mito', 2);
INSERT INTO public.car_model VALUES (26, 'Expander', 3);
INSERT INTO public.car_model VALUES (27, '10', 3);
INSERT INTO public.car_model VALUES (28, '24', 3);
INSERT INTO public.car_model VALUES (29, 'Dacia', 3);
INSERT INTO public.car_model VALUES (30, 'Rocsta', 4);
INSERT INTO public.car_model VALUES (31, 'Rocsta', 5);
INSERT INTO public.car_model VALUES (32, 'Db7', 6);
INSERT INTO public.car_model VALUES (33, 'V8', 6);
INSERT INTO public.car_model VALUES (34, 'Db9', 6);
INSERT INTO public.car_model VALUES (35, 'Vanquish', 6);
INSERT INTO public.car_model VALUES (36, 'V8 Vantage', 6);
INSERT INTO public.car_model VALUES (37, 'Vantage', 6);
INSERT INTO public.car_model VALUES (38, 'Dbs', 6);
INSERT INTO public.car_model VALUES (39, 'Volante', 6);
INSERT INTO public.car_model VALUES (40, 'Virage', 6);
INSERT INTO public.car_model VALUES (41, 'Vantage V8', 6);
INSERT INTO public.car_model VALUES (42, 'Vantage V12', 6);
INSERT INTO public.car_model VALUES (43, 'Rapide', 6);
INSERT INTO public.car_model VALUES (44, 'Cygnet', 6);
INSERT INTO public.car_model VALUES (45, '80', 7);
INSERT INTO public.car_model VALUES (46, 'A4', 7);
INSERT INTO public.car_model VALUES (47, 'A6', 7);
INSERT INTO public.car_model VALUES (48, 'S6', 7);
INSERT INTO public.car_model VALUES (49, 'Coupe', 7);
INSERT INTO public.car_model VALUES (50, 'S2', 7);
INSERT INTO public.car_model VALUES (51, 'Rs2', 7);
INSERT INTO public.car_model VALUES (52, 'A8', 7);
INSERT INTO public.car_model VALUES (53, 'Cabriolet', 7);
INSERT INTO public.car_model VALUES (54, 'S8', 7);
INSERT INTO public.car_model VALUES (55, 'A3', 7);
INSERT INTO public.car_model VALUES (56, 'S4', 7);
INSERT INTO public.car_model VALUES (57, 'Tt', 7);
INSERT INTO public.car_model VALUES (58, 'S3', 7);
INSERT INTO public.car_model VALUES (59, 'Allroad Quattro', 7);
INSERT INTO public.car_model VALUES (60, 'Rs4', 7);
INSERT INTO public.car_model VALUES (61, 'A2', 7);
INSERT INTO public.car_model VALUES (62, 'Rs6', 7);
INSERT INTO public.car_model VALUES (63, 'Q7', 7);
INSERT INTO public.car_model VALUES (64, 'R8', 7);
INSERT INTO public.car_model VALUES (65, 'A5', 7);
INSERT INTO public.car_model VALUES (66, 'S5', 7);
INSERT INTO public.car_model VALUES (67, 'V8', 7);
INSERT INTO public.car_model VALUES (68, '200', 7);
INSERT INTO public.car_model VALUES (69, '100', 7);
INSERT INTO public.car_model VALUES (70, '90', 7);
INSERT INTO public.car_model VALUES (71, 'Tts', 7);
INSERT INTO public.car_model VALUES (72, 'Q5', 7);
INSERT INTO public.car_model VALUES (73, 'A4 Allroad Quattro', 7);
INSERT INTO public.car_model VALUES (74, 'Tt Rs', 7);
INSERT INTO public.car_model VALUES (75, 'Rs5', 7);
INSERT INTO public.car_model VALUES (76, 'A1', 7);
INSERT INTO public.car_model VALUES (77, 'A7', 7);
INSERT INTO public.car_model VALUES (78, 'Rs3', 7);
INSERT INTO public.car_model VALUES (79, 'Q3', 7);
INSERT INTO public.car_model VALUES (80, 'A6 Allroad Quattro', 7);
INSERT INTO public.car_model VALUES (81, 'S7', 7);
INSERT INTO public.car_model VALUES (82, 'Sq5', 7);
INSERT INTO public.car_model VALUES (83, 'Mini', 8);
INSERT INTO public.car_model VALUES (84, 'Montego', 8);
INSERT INTO public.car_model VALUES (85, 'Maestro', 8);
INSERT INTO public.car_model VALUES (86, 'Metro', 8);
INSERT INTO public.car_model VALUES (87, 'Mini Moke', 8);
INSERT INTO public.car_model VALUES (88, 'Diesel', 9);
INSERT INTO public.car_model VALUES (89, 'Brooklands', 10);
INSERT INTO public.car_model VALUES (90, 'Turbo', 10);
INSERT INTO public.car_model VALUES (91, 'Continental', 10);
INSERT INTO public.car_model VALUES (92, 'Azure', 10);
INSERT INTO public.car_model VALUES (93, 'Arnage', 10);
INSERT INTO public.car_model VALUES (94, 'Continental Gt', 10);
INSERT INTO public.car_model VALUES (95, 'Continental Flying Spur', 10);
INSERT INTO public.car_model VALUES (96, 'Turbo R', 10);
INSERT INTO public.car_model VALUES (97, 'Mulsanne', 10);
INSERT INTO public.car_model VALUES (98, 'Eight', 10);
INSERT INTO public.car_model VALUES (99, 'Continental Gtc', 10);
INSERT INTO public.car_model VALUES (100, 'Continental Supersports', 10);
INSERT INTO public.car_model VALUES (101, 'Freeclimber Diesel', 11);
INSERT INTO public.car_model VALUES (102, 'Serie 3', 12);
INSERT INTO public.car_model VALUES (103, 'Serie 5', 12);
INSERT INTO public.car_model VALUES (104, 'Compact', 12);
INSERT INTO public.car_model VALUES (105, 'Serie 7', 12);
INSERT INTO public.car_model VALUES (106, 'Serie 8', 12);
INSERT INTO public.car_model VALUES (107, 'Z3', 12);
INSERT INTO public.car_model VALUES (108, 'Z4', 12);
INSERT INTO public.car_model VALUES (109, 'Z8', 12);
INSERT INTO public.car_model VALUES (110, 'X5', 12);
INSERT INTO public.car_model VALUES (111, 'Serie 6', 12);
INSERT INTO public.car_model VALUES (112, 'X3', 12);
INSERT INTO public.car_model VALUES (113, 'Serie 1', 12);
INSERT INTO public.car_model VALUES (114, 'Z1', 12);
INSERT INTO public.car_model VALUES (115, 'X6', 12);
INSERT INTO public.car_model VALUES (116, 'X1', 12);
INSERT INTO public.car_model VALUES (117, 'Seville', 13);
INSERT INTO public.car_model VALUES (118, 'Sts', 13);
INSERT INTO public.car_model VALUES (119, 'El Dorado', 13);
INSERT INTO public.car_model VALUES (120, 'Cts', 13);
INSERT INTO public.car_model VALUES (121, 'Xlr', 13);
INSERT INTO public.car_model VALUES (122, 'Srx', 13);
INSERT INTO public.car_model VALUES (123, 'Escalade', 13);
INSERT INTO public.car_model VALUES (124, 'Bls', 13);
INSERT INTO public.car_model VALUES (125, 'Corvette', 14);
INSERT INTO public.car_model VALUES (126, 'Blazer', 14);
INSERT INTO public.car_model VALUES (127, 'Astro', 14);
INSERT INTO public.car_model VALUES (128, 'Nubira', 14);
INSERT INTO public.car_model VALUES (129, 'Evanda', 14);
INSERT INTO public.car_model VALUES (130, 'Trans Sport', 14);
INSERT INTO public.car_model VALUES (131, 'Camaro', 14);
INSERT INTO public.car_model VALUES (132, 'Matiz', 14);
INSERT INTO public.car_model VALUES (133, 'Alero', 14);
INSERT INTO public.car_model VALUES (134, 'Tahoe', 14);
INSERT INTO public.car_model VALUES (135, 'Tacuma', 14);
INSERT INTO public.car_model VALUES (136, 'Trailblazer', 14);
INSERT INTO public.car_model VALUES (137, 'Kalos', 14);
INSERT INTO public.car_model VALUES (138, 'Aveo', 14);
INSERT INTO public.car_model VALUES (139, 'Lacetti', 14);
INSERT INTO public.car_model VALUES (140, 'Epica', 14);
INSERT INTO public.car_model VALUES (141, 'Captiva', 14);
INSERT INTO public.car_model VALUES (142, 'Hhr', 14);
INSERT INTO public.car_model VALUES (143, 'Cruze', 14);
INSERT INTO public.car_model VALUES (144, 'Spark', 14);
INSERT INTO public.car_model VALUES (145, 'Orlando', 14);
INSERT INTO public.car_model VALUES (146, 'Volt', 14);
INSERT INTO public.car_model VALUES (147, 'Malibu', 14);
INSERT INTO public.car_model VALUES (148, 'Vision', 15);
INSERT INTO public.car_model VALUES (149, '300m', 15);
INSERT INTO public.car_model VALUES (150, 'Grand Voyager', 15);
INSERT INTO public.car_model VALUES (151, 'Viper', 15);
INSERT INTO public.car_model VALUES (152, 'Neon', 15);
INSERT INTO public.car_model VALUES (153, 'Voyager', 15);
INSERT INTO public.car_model VALUES (154, 'Stratus', 15);
INSERT INTO public.car_model VALUES (155, 'Sebring', 15);
INSERT INTO public.car_model VALUES (156, 'Sebring 200c', 15);
INSERT INTO public.car_model VALUES (157, 'New Yorker', 15);
INSERT INTO public.car_model VALUES (158, 'Pt Cruiser', 15);
INSERT INTO public.car_model VALUES (159, 'Crossfire', 15);
INSERT INTO public.car_model VALUES (160, '300c', 15);
INSERT INTO public.car_model VALUES (161, 'Le Baron', 15);
INSERT INTO public.car_model VALUES (162, 'Saratoga', 15);
INSERT INTO public.car_model VALUES (163, 'Xantia', 16);
INSERT INTO public.car_model VALUES (164, 'Xm', 16);
INSERT INTO public.car_model VALUES (165, 'Ax', 16);
INSERT INTO public.car_model VALUES (166, 'Zx', 16);
INSERT INTO public.car_model VALUES (167, 'Evasion', 16);
INSERT INTO public.car_model VALUES (168, 'C8', 16);
INSERT INTO public.car_model VALUES (169, 'Saxo', 16);
INSERT INTO public.car_model VALUES (170, 'C2', 16);
INSERT INTO public.car_model VALUES (171, 'Xsara', 16);
INSERT INTO public.car_model VALUES (172, 'C4', 16);
INSERT INTO public.car_model VALUES (173, 'Xsara Picasso', 16);
INSERT INTO public.car_model VALUES (174, 'C5', 16);
INSERT INTO public.car_model VALUES (175, 'C3', 16);
INSERT INTO public.car_model VALUES (176, 'C3 Pluriel', 16);
INSERT INTO public.car_model VALUES (177, 'C1', 16);
INSERT INTO public.car_model VALUES (178, 'C6', 16);
INSERT INTO public.car_model VALUES (179, 'Grand C4 Picasso', 16);
INSERT INTO public.car_model VALUES (180, 'C4 Picasso', 16);
INSERT INTO public.car_model VALUES (181, 'Ccrosser', 16);
INSERT INTO public.car_model VALUES (182, 'C15', 16);
INSERT INTO public.car_model VALUES (183, 'Jumper', 16);
INSERT INTO public.car_model VALUES (184, 'Jumpy', 16);
INSERT INTO public.car_model VALUES (185, 'Berlingo', 16);
INSERT INTO public.car_model VALUES (186, 'Bx', 16);
INSERT INTO public.car_model VALUES (187, 'C25', 16);
INSERT INTO public.car_model VALUES (188, 'Cx', 16);
INSERT INTO public.car_model VALUES (189, 'Gsa', 16);
INSERT INTO public.car_model VALUES (190, 'Visa', 16);
INSERT INTO public.car_model VALUES (191, 'Lna', 16);
INSERT INTO public.car_model VALUES (192, '2cv', 16);
INSERT INTO public.car_model VALUES (193, 'Nemo', 16);
INSERT INTO public.car_model VALUES (194, 'C4 Sedan', 16);
INSERT INTO public.car_model VALUES (195, 'Berlingo First', 16);
INSERT INTO public.car_model VALUES (196, 'C3 Picasso', 16);
INSERT INTO public.car_model VALUES (197, 'Ds3', 16);
INSERT INTO public.car_model VALUES (198, 'Czero', 16);
INSERT INTO public.car_model VALUES (199, 'Ds4', 16);
INSERT INTO public.car_model VALUES (200, 'Ds5', 16);
INSERT INTO public.car_model VALUES (201, 'C4 Aircross', 16);
INSERT INTO public.car_model VALUES (202, 'Celysee', 16);
INSERT INTO public.car_model VALUES (203, 'Corvette', 17);
INSERT INTO public.car_model VALUES (204, 'Ateca', 18);
INSERT INTO public.car_model VALUES (205, 'Leon', 18);
INSERT INTO public.car_model VALUES (206, 'Formentor', 18);
INSERT INTO public.car_model VALUES (207, 'Born', 18);
INSERT INTO public.car_model VALUES (208, 'Contac', 19);
INSERT INTO public.car_model VALUES (209, 'Logan', 19);
INSERT INTO public.car_model VALUES (210, 'Sandero', 19);
INSERT INTO public.car_model VALUES (211, 'Duster', 19);
INSERT INTO public.car_model VALUES (212, 'Lodgy', 19);
INSERT INTO public.car_model VALUES (213, 'Nexia', 20);
INSERT INTO public.car_model VALUES (214, 'Aranos', 20);
INSERT INTO public.car_model VALUES (215, 'Lanos', 20);
INSERT INTO public.car_model VALUES (216, 'Nubira', 20);
INSERT INTO public.car_model VALUES (217, 'Compact', 20);
INSERT INTO public.car_model VALUES (218, 'Nubira Compact', 20);
INSERT INTO public.car_model VALUES (219, 'Leganza', 20);
INSERT INTO public.car_model VALUES (220, 'Evanda', 20);
INSERT INTO public.car_model VALUES (221, 'Matiz', 20);
INSERT INTO public.car_model VALUES (222, 'Tacuma', 20);
INSERT INTO public.car_model VALUES (223, 'Kalos', 20);
INSERT INTO public.car_model VALUES (224, 'Lacetti', 20);
INSERT INTO public.car_model VALUES (225, 'Applause', 22);
INSERT INTO public.car_model VALUES (226, 'Charade', 22);
INSERT INTO public.car_model VALUES (227, 'Rocky', 22);
INSERT INTO public.car_model VALUES (228, 'Feroza', 22);
INSERT INTO public.car_model VALUES (229, 'Terios', 22);
INSERT INTO public.car_model VALUES (230, 'Sirion', 22);
INSERT INTO public.car_model VALUES (231, 'Serie Xj', 23);
INSERT INTO public.car_model VALUES (232, 'Xj', 23);
INSERT INTO public.car_model VALUES (233, 'Double Six', 23);
INSERT INTO public.car_model VALUES (234, 'Six', 23);
INSERT INTO public.car_model VALUES (235, 'Series Iii', 23);
INSERT INTO public.car_model VALUES (236, 'Viper', 24);
INSERT INTO public.car_model VALUES (237, 'Caliber', 24);
INSERT INTO public.car_model VALUES (238, 'Nitro', 24);
INSERT INTO public.car_model VALUES (239, 'Avenger', 24);
INSERT INTO public.car_model VALUES (240, 'Journey', 24);
INSERT INTO public.car_model VALUES (241, 'F355', 25);
INSERT INTO public.car_model VALUES (242, '360', 25);
INSERT INTO public.car_model VALUES (243, 'F430', 25);
INSERT INTO public.car_model VALUES (244, 'F512 M', 25);
INSERT INTO public.car_model VALUES (245, '550 Maranello', 25);
INSERT INTO public.car_model VALUES (246, '575m Maranello', 25);
INSERT INTO public.car_model VALUES (247, '599', 25);
INSERT INTO public.car_model VALUES (248, '456', 25);
INSERT INTO public.car_model VALUES (249, '456m', 25);
INSERT INTO public.car_model VALUES (250, '612', 25);
INSERT INTO public.car_model VALUES (251, 'F50', 25);
INSERT INTO public.car_model VALUES (252, 'Enzo', 25);
INSERT INTO public.car_model VALUES (253, 'Superamerica', 25);
INSERT INTO public.car_model VALUES (254, '430', 25);
INSERT INTO public.car_model VALUES (255, '348', 25);
INSERT INTO public.car_model VALUES (256, 'Testarossa', 25);
INSERT INTO public.car_model VALUES (257, '512', 25);
INSERT INTO public.car_model VALUES (258, '355', 25);
INSERT INTO public.car_model VALUES (259, 'F40', 25);
INSERT INTO public.car_model VALUES (260, '412', 25);
INSERT INTO public.car_model VALUES (261, 'Mondial', 25);
INSERT INTO public.car_model VALUES (262, '328', 25);
INSERT INTO public.car_model VALUES (263, 'California', 25);
INSERT INTO public.car_model VALUES (264, '458', 25);
INSERT INTO public.car_model VALUES (265, 'Ff', 25);
INSERT INTO public.car_model VALUES (266, 'Croma', 26);
INSERT INTO public.car_model VALUES (267, 'Cinquecento', 26);
INSERT INTO public.car_model VALUES (268, 'Seicento', 26);
INSERT INTO public.car_model VALUES (269, 'Punto', 26);
INSERT INTO public.car_model VALUES (270, 'Grande Punto', 26);
INSERT INTO public.car_model VALUES (271, 'Panda', 26);
INSERT INTO public.car_model VALUES (272, 'Tipo', 26);
INSERT INTO public.car_model VALUES (273, 'Coupe', 26);
INSERT INTO public.car_model VALUES (274, 'Uno', 26);
INSERT INTO public.car_model VALUES (275, 'Ulysse', 26);
INSERT INTO public.car_model VALUES (276, 'Tempra', 26);
INSERT INTO public.car_model VALUES (277, 'Marea', 26);
INSERT INTO public.car_model VALUES (278, 'Barchetta', 26);
INSERT INTO public.car_model VALUES (279, 'Bravo', 26);
INSERT INTO public.car_model VALUES (280, 'Stilo', 26);
INSERT INTO public.car_model VALUES (281, 'Brava', 26);
INSERT INTO public.car_model VALUES (282, 'Palio Weekend', 26);
INSERT INTO public.car_model VALUES (283, '600', 26);
INSERT INTO public.car_model VALUES (284, 'Multipla', 26);
INSERT INTO public.car_model VALUES (285, 'Idea', 26);
INSERT INTO public.car_model VALUES (286, 'Sedici', 26);
INSERT INTO public.car_model VALUES (287, 'Linea', 26);
INSERT INTO public.car_model VALUES (288, '500', 26);
INSERT INTO public.car_model VALUES (289, 'Fiorino', 26);
INSERT INTO public.car_model VALUES (290, 'Ducato', 26);
INSERT INTO public.car_model VALUES (291, 'Doblo Cargo', 26);
INSERT INTO public.car_model VALUES (292, 'Doblo', 26);
INSERT INTO public.car_model VALUES (293, 'Strada', 26);
INSERT INTO public.car_model VALUES (294, 'Regata', 26);
INSERT INTO public.car_model VALUES (295, 'Talento', 26);
INSERT INTO public.car_model VALUES (296, 'Argenta', 26);
INSERT INTO public.car_model VALUES (297, 'Ritmo', 26);
INSERT INTO public.car_model VALUES (298, 'Punto Classic', 26);
INSERT INTO public.car_model VALUES (299, 'Qubo', 26);
INSERT INTO public.car_model VALUES (300, 'Punto Evo', 26);
INSERT INTO public.car_model VALUES (301, '500c', 26);
INSERT INTO public.car_model VALUES (302, 'Freemont', 26);
INSERT INTO public.car_model VALUES (303, 'Panda Classic', 26);
INSERT INTO public.car_model VALUES (304, '500l', 26);
INSERT INTO public.car_model VALUES (305, 'Maverick', 27);
INSERT INTO public.car_model VALUES (306, 'Escort', 27);
INSERT INTO public.car_model VALUES (307, 'Focus', 27);
INSERT INTO public.car_model VALUES (308, 'Mondeo', 27);
INSERT INTO public.car_model VALUES (309, 'Scorpio', 27);
INSERT INTO public.car_model VALUES (310, 'Fiesta', 27);
INSERT INTO public.car_model VALUES (311, 'Probe', 27);
INSERT INTO public.car_model VALUES (312, 'Explorer', 27);
INSERT INTO public.car_model VALUES (313, 'Galaxy', 27);
INSERT INTO public.car_model VALUES (314, 'Ka', 27);
INSERT INTO public.car_model VALUES (315, 'Puma', 27);
INSERT INTO public.car_model VALUES (316, 'Cougar', 27);
INSERT INTO public.car_model VALUES (317, 'Focus Cmax', 27);
INSERT INTO public.car_model VALUES (318, 'Fusion', 27);
INSERT INTO public.car_model VALUES (319, 'Streetka', 27);
INSERT INTO public.car_model VALUES (320, 'Cmax', 27);
INSERT INTO public.car_model VALUES (321, 'Smax', 27);
INSERT INTO public.car_model VALUES (322, 'Transit', 27);
INSERT INTO public.car_model VALUES (323, 'Courier', 27);
INSERT INTO public.car_model VALUES (324, 'Ranger', 27);
INSERT INTO public.car_model VALUES (325, 'Sierra', 27);
INSERT INTO public.car_model VALUES (326, 'Orion', 27);
INSERT INTO public.car_model VALUES (327, 'Pick Up', 27);
INSERT INTO public.car_model VALUES (328, 'Capri', 27);
INSERT INTO public.car_model VALUES (329, 'Granada', 27);
INSERT INTO public.car_model VALUES (330, 'Kuga', 27);
INSERT INTO public.car_model VALUES (331, 'Grand Cmax', 27);
INSERT INTO public.car_model VALUES (332, 'Bmax', 27);
INSERT INTO public.car_model VALUES (333, 'Tourneo Custom', 27);
INSERT INTO public.car_model VALUES (334, 'Exceed', 28);
INSERT INTO public.car_model VALUES (335, 'Santamo', 28);
INSERT INTO public.car_model VALUES (336, 'Super Exceed', 28);
INSERT INTO public.car_model VALUES (337, 'Accord', 30);
INSERT INTO public.car_model VALUES (338, 'Civic', 30);
INSERT INTO public.car_model VALUES (339, 'Crx', 30);
INSERT INTO public.car_model VALUES (340, 'Prelude', 30);
INSERT INTO public.car_model VALUES (341, 'Nsx', 30);
INSERT INTO public.car_model VALUES (342, 'Legend', 30);
INSERT INTO public.car_model VALUES (343, 'Crv', 30);
INSERT INTO public.car_model VALUES (344, 'Hrv', 30);
INSERT INTO public.car_model VALUES (345, 'Logo', 30);
INSERT INTO public.car_model VALUES (346, 'S2000', 30);
INSERT INTO public.car_model VALUES (347, 'Stream', 30);
INSERT INTO public.car_model VALUES (348, 'Jazz', 30);
INSERT INTO public.car_model VALUES (349, 'Frv', 30);
INSERT INTO public.car_model VALUES (350, 'Concerto', 30);
INSERT INTO public.car_model VALUES (351, 'Insight', 30);
INSERT INTO public.car_model VALUES (352, 'Crz', 30);
INSERT INTO public.car_model VALUES (353, 'H2', 31);
INSERT INTO public.car_model VALUES (354, 'H3', 31);
INSERT INTO public.car_model VALUES (355, 'H3t', 31);
INSERT INTO public.car_model VALUES (356, 'Lantra', 32);
INSERT INTO public.car_model VALUES (357, 'Sonata', 32);
INSERT INTO public.car_model VALUES (358, 'Elantra', 32);
INSERT INTO public.car_model VALUES (359, 'Accent', 32);
INSERT INTO public.car_model VALUES (360, 'Scoupe', 32);
INSERT INTO public.car_model VALUES (361, 'Coupe', 32);
INSERT INTO public.car_model VALUES (362, 'Atos', 32);
INSERT INTO public.car_model VALUES (363, 'H1', 32);
INSERT INTO public.car_model VALUES (364, 'Atos Prime', 32);
INSERT INTO public.car_model VALUES (365, 'Xg', 32);
INSERT INTO public.car_model VALUES (366, 'Trajet', 32);
INSERT INTO public.car_model VALUES (367, 'Santa Fe', 32);
INSERT INTO public.car_model VALUES (368, 'Terracan', 32);
INSERT INTO public.car_model VALUES (369, 'Matrix', 32);
INSERT INTO public.car_model VALUES (370, 'Getz', 32);
INSERT INTO public.car_model VALUES (371, 'Tucson', 32);
INSERT INTO public.car_model VALUES (372, 'I30', 32);
INSERT INTO public.car_model VALUES (373, 'Pony', 32);
INSERT INTO public.car_model VALUES (374, 'Grandeur', 32);
INSERT INTO public.car_model VALUES (375, 'I10', 32);
INSERT INTO public.car_model VALUES (376, 'I800', 32);
INSERT INTO public.car_model VALUES (377, 'Sonata Fl', 32);
INSERT INTO public.car_model VALUES (378, 'Ix55', 32);
INSERT INTO public.car_model VALUES (379, 'I20', 32);
INSERT INTO public.car_model VALUES (380, 'Ix35', 32);
INSERT INTO public.car_model VALUES (381, 'Ix20', 32);
INSERT INTO public.car_model VALUES (382, 'Genesis', 32);
INSERT INTO public.car_model VALUES (383, 'I40', 32);
INSERT INTO public.car_model VALUES (384, 'Veloster', 32);
INSERT INTO public.car_model VALUES (385, 'G', 33);
INSERT INTO public.car_model VALUES (386, 'Ex', 33);
INSERT INTO public.car_model VALUES (387, 'Fx', 33);
INSERT INTO public.car_model VALUES (388, 'M', 33);
INSERT INTO public.car_model VALUES (389, 'Elba', 34);
INSERT INTO public.car_model VALUES (390, 'Minitre', 34);
INSERT INTO public.car_model VALUES (391, 'Trooper', 35);
INSERT INTO public.car_model VALUES (392, 'Pick Up', 35);
INSERT INTO public.car_model VALUES (393, 'D Max', 35);
INSERT INTO public.car_model VALUES (394, 'Rodeo', 35);
INSERT INTO public.car_model VALUES (395, 'Dmax', 35);
INSERT INTO public.car_model VALUES (396, 'Trroper', 35);
INSERT INTO public.car_model VALUES (397, 'Daily', 36);
INSERT INTO public.car_model VALUES (398, 'Massif', 36);
INSERT INTO public.car_model VALUES (399, 'Daily', 37);
INSERT INTO public.car_model VALUES (400, 'Duty', 37);
INSERT INTO public.car_model VALUES (401, 'Serie Xj', 38);
INSERT INTO public.car_model VALUES (402, 'Serie Xk', 38);
INSERT INTO public.car_model VALUES (403, 'Xj', 38);
INSERT INTO public.car_model VALUES (404, 'Stype', 38);
INSERT INTO public.car_model VALUES (405, 'Xf', 38);
INSERT INTO public.car_model VALUES (406, 'Xtype', 38);
INSERT INTO public.car_model VALUES (407, 'Wrangler', 39);
INSERT INTO public.car_model VALUES (408, 'Cherokee', 39);
INSERT INTO public.car_model VALUES (409, 'Grand Cherokee', 39);
INSERT INTO public.car_model VALUES (410, 'Commander', 39);
INSERT INTO public.car_model VALUES (411, 'Compass', 39);
INSERT INTO public.car_model VALUES (412, 'Wrangler Unlimited', 39);
INSERT INTO public.car_model VALUES (413, 'Patriot', 39);
INSERT INTO public.car_model VALUES (414, 'Sportage', 40);
INSERT INTO public.car_model VALUES (415, 'Sephia', 40);
INSERT INTO public.car_model VALUES (416, 'Sephia II', 40);
INSERT INTO public.car_model VALUES (417, 'Pride', 40);
INSERT INTO public.car_model VALUES (418, 'Clarus', 40);
INSERT INTO public.car_model VALUES (419, 'Shuma', 40);
INSERT INTO public.car_model VALUES (420, 'Carnival', 40);
INSERT INTO public.car_model VALUES (421, 'Joice', 40);
INSERT INTO public.car_model VALUES (422, 'Magentis', 40);
INSERT INTO public.car_model VALUES (423, 'Carens', 40);
INSERT INTO public.car_model VALUES (424, 'Rio', 40);
INSERT INTO public.car_model VALUES (425, 'Cerato', 40);
INSERT INTO public.car_model VALUES (426, 'Sorento', 40);
INSERT INTO public.car_model VALUES (427, 'Opirus', 40);
INSERT INTO public.car_model VALUES (428, 'Picanto', 40);
INSERT INTO public.car_model VALUES (429, 'Ceed', 40);
INSERT INTO public.car_model VALUES (430, 'Ceed Sporty Wagon', 40);
INSERT INTO public.car_model VALUES (431, 'Proceed', 40);
INSERT INTO public.car_model VALUES (432, 'K2500 Frontier', 40);
INSERT INTO public.car_model VALUES (433, 'K2500', 40);
INSERT INTO public.car_model VALUES (434, 'Soul', 40);
INSERT INTO public.car_model VALUES (435, 'Venga', 40);
INSERT INTO public.car_model VALUES (436, 'Optima', 40);
INSERT INTO public.car_model VALUES (437, 'Ceed Sportswagon', 40);
INSERT INTO public.car_model VALUES (438, 'Samara', 41);
INSERT INTO public.car_model VALUES (439, 'Niva', 41);
INSERT INTO public.car_model VALUES (440, 'Sagona', 41);
INSERT INTO public.car_model VALUES (441, 'Stawra 2110', 41);
INSERT INTO public.car_model VALUES (442, '214', 41);
INSERT INTO public.car_model VALUES (443, 'Kalina', 41);
INSERT INTO public.car_model VALUES (444, 'Serie 2100', 41);
INSERT INTO public.car_model VALUES (445, 'Priora', 41);
INSERT INTO public.car_model VALUES (446, 'Gallardo', 42);
INSERT INTO public.car_model VALUES (447, 'Murcielago', 42);
INSERT INTO public.car_model VALUES (448, 'Aventador', 42);
INSERT INTO public.car_model VALUES (449, 'Delta', 43);
INSERT INTO public.car_model VALUES (450, 'K', 43);
INSERT INTO public.car_model VALUES (451, 'Y10', 43);
INSERT INTO public.car_model VALUES (452, 'Dedra', 43);
INSERT INTO public.car_model VALUES (453, 'Lybra', 43);
INSERT INTO public.car_model VALUES (454, 'Z', 43);
INSERT INTO public.car_model VALUES (455, 'Y', 43);
INSERT INTO public.car_model VALUES (456, 'Ypsilon', 43);
INSERT INTO public.car_model VALUES (457, 'Thesis', 43);
INSERT INTO public.car_model VALUES (458, 'Phedra', 43);
INSERT INTO public.car_model VALUES (459, 'Musa', 43);
INSERT INTO public.car_model VALUES (460, 'Thema', 43);
INSERT INTO public.car_model VALUES (461, 'Zeta', 43);
INSERT INTO public.car_model VALUES (462, 'Kappa', 43);
INSERT INTO public.car_model VALUES (463, 'Trevi', 43);
INSERT INTO public.car_model VALUES (464, 'Prisma', 43);
INSERT INTO public.car_model VALUES (465, 'A112', 43);
INSERT INTO public.car_model VALUES (466, 'Ypsilon Elefantino', 43);
INSERT INTO public.car_model VALUES (467, 'Voyager', 43);
INSERT INTO public.car_model VALUES (468, 'Range Rover', 44);
INSERT INTO public.car_model VALUES (469, 'Defender', 44);
INSERT INTO public.car_model VALUES (470, 'Discovery', 44);
INSERT INTO public.car_model VALUES (471, 'Freelander', 44);
INSERT INTO public.car_model VALUES (472, 'Range Rover Sport', 44);
INSERT INTO public.car_model VALUES (473, 'Discovery 4', 44);
INSERT INTO public.car_model VALUES (474, 'Range Rover Evoque', 44);
INSERT INTO public.car_model VALUES (475, 'Maxus', 45);
INSERT INTO public.car_model VALUES (476, 'Ls400', 46);
INSERT INTO public.car_model VALUES (477, 'Ls430', 46);
INSERT INTO public.car_model VALUES (478, 'Gs300', 46);
INSERT INTO public.car_model VALUES (479, 'Is200', 46);
INSERT INTO public.car_model VALUES (480, 'Rx300', 46);
INSERT INTO public.car_model VALUES (481, 'Gs430', 46);
INSERT INTO public.car_model VALUES (482, 'Gs460', 46);
INSERT INTO public.car_model VALUES (483, 'Sc430', 46);
INSERT INTO public.car_model VALUES (484, 'Is300', 46);
INSERT INTO public.car_model VALUES (485, 'Is250', 46);
INSERT INTO public.car_model VALUES (486, 'Rx400h', 46);
INSERT INTO public.car_model VALUES (487, 'Is220d', 46);
INSERT INTO public.car_model VALUES (488, 'Rx350', 46);
INSERT INTO public.car_model VALUES (489, 'Gs450h', 46);
INSERT INTO public.car_model VALUES (490, 'Ls460', 46);
INSERT INTO public.car_model VALUES (491, 'Ls600h', 46);
INSERT INTO public.car_model VALUES (492, 'Ls', 46);
INSERT INTO public.car_model VALUES (493, 'Gs', 46);
INSERT INTO public.car_model VALUES (494, 'Is', 46);
INSERT INTO public.car_model VALUES (495, 'Sc', 46);
INSERT INTO public.car_model VALUES (496, 'Rx', 46);
INSERT INTO public.car_model VALUES (497, 'Ct', 46);
INSERT INTO public.car_model VALUES (498, 'Elise', 47);
INSERT INTO public.car_model VALUES (499, 'Exige', 47);
INSERT INTO public.car_model VALUES (500, 'Bolero Pickup', 48);
INSERT INTO public.car_model VALUES (501, 'Goa Pickup', 48);
INSERT INTO public.car_model VALUES (502, 'Goa', 48);
INSERT INTO public.car_model VALUES (503, 'Cj', 48);
INSERT INTO public.car_model VALUES (504, 'Pikup', 48);
INSERT INTO public.car_model VALUES (505, 'Thar', 48);
INSERT INTO public.car_model VALUES (506, 'Ghibli', 49);
INSERT INTO public.car_model VALUES (507, 'Shamal', 49);
INSERT INTO public.car_model VALUES (508, 'Quattroporte', 49);
INSERT INTO public.car_model VALUES (509, '3200 Gt', 49);
INSERT INTO public.car_model VALUES (510, 'Coupe', 49);
INSERT INTO public.car_model VALUES (511, 'Spyder', 49);
INSERT INTO public.car_model VALUES (512, 'Gransport', 49);
INSERT INTO public.car_model VALUES (513, 'Granturismo', 49);
INSERT INTO public.car_model VALUES (514, '430', 49);
INSERT INTO public.car_model VALUES (515, 'Biturbo', 49);
INSERT INTO public.car_model VALUES (516, '228', 49);
INSERT INTO public.car_model VALUES (517, '224', 49);
INSERT INTO public.car_model VALUES (518, 'Grancabrio', 49);
INSERT INTO public.car_model VALUES (519, 'Maybach', 50);
INSERT INTO public.car_model VALUES (520, 'Xedos 6', 51);
INSERT INTO public.car_model VALUES (521, '626', 51);
INSERT INTO public.car_model VALUES (522, '121', 51);
INSERT INTO public.car_model VALUES (523, 'Xedos 9', 51);
INSERT INTO public.car_model VALUES (524, '323', 51);
INSERT INTO public.car_model VALUES (525, 'Mx3', 51);
INSERT INTO public.car_model VALUES (526, 'Rx7', 51);
INSERT INTO public.car_model VALUES (527, 'Mx5', 51);
INSERT INTO public.car_model VALUES (528, 'Mazda3', 51);
INSERT INTO public.car_model VALUES (529, 'Mpv', 51);
INSERT INTO public.car_model VALUES (530, 'Demio', 51);
INSERT INTO public.car_model VALUES (531, 'Premacy', 51);
INSERT INTO public.car_model VALUES (532, 'Tribute', 51);
INSERT INTO public.car_model VALUES (533, 'Mazda6', 51);
INSERT INTO public.car_model VALUES (534, 'Mazda2', 51);
INSERT INTO public.car_model VALUES (535, 'Rx8', 51);
INSERT INTO public.car_model VALUES (536, 'Mazda5', 51);
INSERT INTO public.car_model VALUES (537, 'Cx7', 51);
INSERT INTO public.car_model VALUES (538, 'Serie B', 51);
INSERT INTO public.car_model VALUES (539, 'B2500', 51);
INSERT INTO public.car_model VALUES (540, 'Bt50', 51);
INSERT INTO public.car_model VALUES (541, 'Mx6', 51);
INSERT INTO public.car_model VALUES (542, '929', 51);
INSERT INTO public.car_model VALUES (543, 'Cx5', 51);
INSERT INTO public.car_model VALUES (544, 'Clase C', 52);
INSERT INTO public.car_model VALUES (545, 'Clase E', 52);
INSERT INTO public.car_model VALUES (546, 'Clase Sl', 52);
INSERT INTO public.car_model VALUES (547, 'Clase S', 52);
INSERT INTO public.car_model VALUES (548, 'Clase Cl', 52);
INSERT INTO public.car_model VALUES (549, 'Clase G', 52);
INSERT INTO public.car_model VALUES (550, 'Clase Slk', 52);
INSERT INTO public.car_model VALUES (551, 'Clase V', 52);
INSERT INTO public.car_model VALUES (552, 'Viano', 52);
INSERT INTO public.car_model VALUES (553, 'Clase Clk', 52);
INSERT INTO public.car_model VALUES (554, 'Clase A', 52);
INSERT INTO public.car_model VALUES (555, 'Clase M', 52);
INSERT INTO public.car_model VALUES (556, 'Vaneo', 52);
INSERT INTO public.car_model VALUES (557, 'Slklasse', 52);
INSERT INTO public.car_model VALUES (558, 'Slr Mclaren', 52);
INSERT INTO public.car_model VALUES (559, 'Clase Cls', 52);
INSERT INTO public.car_model VALUES (560, 'Clase R', 52);
INSERT INTO public.car_model VALUES (561, 'Clase Gl', 52);
INSERT INTO public.car_model VALUES (562, 'Clase B', 52);
INSERT INTO public.car_model VALUES (563, '100d', 52);
INSERT INTO public.car_model VALUES (564, '140d', 52);
INSERT INTO public.car_model VALUES (565, '180d', 52);
INSERT INTO public.car_model VALUES (566, 'Sprinter', 52);
INSERT INTO public.car_model VALUES (567, 'Vito', 52);
INSERT INTO public.car_model VALUES (568, 'Transporter', 52);
INSERT INTO public.car_model VALUES (569, '280', 52);
INSERT INTO public.car_model VALUES (570, '220', 52);
INSERT INTO public.car_model VALUES (571, '200', 52);
INSERT INTO public.car_model VALUES (572, '190', 52);
INSERT INTO public.car_model VALUES (573, '600', 52);
INSERT INTO public.car_model VALUES (574, '400', 52);
INSERT INTO public.car_model VALUES (575, 'Clase Sl R129', 52);
INSERT INTO public.car_model VALUES (576, '300', 52);
INSERT INTO public.car_model VALUES (577, '500', 52);
INSERT INTO public.car_model VALUES (578, '420', 52);
INSERT INTO public.car_model VALUES (579, '260', 52);
INSERT INTO public.car_model VALUES (580, '230', 52);
INSERT INTO public.car_model VALUES (581, 'Clase Clc', 52);
INSERT INTO public.car_model VALUES (582, 'Clase Glk', 52);
INSERT INTO public.car_model VALUES (583, 'Sls Amg', 52);
INSERT INTO public.car_model VALUES (584, 'Mgf', 53);
INSERT INTO public.car_model VALUES (585, 'Tf', 53);
INSERT INTO public.car_model VALUES (586, 'Zr', 53);
INSERT INTO public.car_model VALUES (587, 'Zs', 53);
INSERT INTO public.car_model VALUES (588, 'Zt', 53);
INSERT INTO public.car_model VALUES (589, 'Ztt', 53);
INSERT INTO public.car_model VALUES (590, 'Mini', 53);
INSERT INTO public.car_model VALUES (591, 'Countryman', 53);
INSERT INTO public.car_model VALUES (592, 'Paceman', 53);
INSERT INTO public.car_model VALUES (593, 'Mini', 54);
INSERT INTO public.car_model VALUES (594, 'Countryman', 54);
INSERT INTO public.car_model VALUES (595, 'Paceman', 54);
INSERT INTO public.car_model VALUES (596, 'Montero', 55);
INSERT INTO public.car_model VALUES (597, 'Galant', 55);
INSERT INTO public.car_model VALUES (598, 'Colt', 55);
INSERT INTO public.car_model VALUES (599, 'Space Wagon', 55);
INSERT INTO public.car_model VALUES (600, 'Space Runner', 55);
INSERT INTO public.car_model VALUES (601, 'Space Gear', 55);
INSERT INTO public.car_model VALUES (602, '3000 Gt', 55);
INSERT INTO public.car_model VALUES (603, 'Carisma', 55);
INSERT INTO public.car_model VALUES (604, 'Eclipse', 55);
INSERT INTO public.car_model VALUES (605, 'Space Star', 55);
INSERT INTO public.car_model VALUES (606, 'Montero Sport', 55);
INSERT INTO public.car_model VALUES (607, 'Montero Io', 55);
INSERT INTO public.car_model VALUES (608, 'Outlander', 55);
INSERT INTO public.car_model VALUES (609, 'Lancer', 55);
INSERT INTO public.car_model VALUES (610, 'Grandis', 55);
INSERT INTO public.car_model VALUES (611, 'L200', 55);
INSERT INTO public.car_model VALUES (612, 'Canter', 55);
INSERT INTO public.car_model VALUES (613, '300 Gt', 55);
INSERT INTO public.car_model VALUES (614, 'Asx', 55);
INSERT INTO public.car_model VALUES (615, 'Imiev', 55);
INSERT INTO public.car_model VALUES (616, '44', 56);
INSERT INTO public.car_model VALUES (617, 'Plus 8', 56);
INSERT INTO public.car_model VALUES (618, 'Aero 8', 56);
INSERT INTO public.car_model VALUES (619, 'V6', 56);
INSERT INTO public.car_model VALUES (620, 'Roadster', 56);
INSERT INTO public.car_model VALUES (621, '4', 56);
INSERT INTO public.car_model VALUES (622, 'Plus 4', 56);
INSERT INTO public.car_model VALUES (623, 'Terrano Ii', 57);
INSERT INTO public.car_model VALUES (624, 'Terrano', 57);
INSERT INTO public.car_model VALUES (625, 'Micra', 57);
INSERT INTO public.car_model VALUES (626, 'Sunny', 57);
INSERT INTO public.car_model VALUES (627, 'Primera', 57);
INSERT INTO public.car_model VALUES (628, 'Serena', 57);
INSERT INTO public.car_model VALUES (629, 'Patrol', 57);
INSERT INTO public.car_model VALUES (630, 'Maxima Qx', 57);
INSERT INTO public.car_model VALUES (631, '200 Sx', 57);
INSERT INTO public.car_model VALUES (632, '300 Zx', 57);
INSERT INTO public.car_model VALUES (633, 'Patrol Gr', 57);
INSERT INTO public.car_model VALUES (634, '100 Nx', 57);
INSERT INTO public.car_model VALUES (635, 'Almera', 57);
INSERT INTO public.car_model VALUES (636, 'Pathfinder', 57);
INSERT INTO public.car_model VALUES (637, 'Almera Tino', 57);
INSERT INTO public.car_model VALUES (638, 'Xtrail', 57);
INSERT INTO public.car_model VALUES (639, '350z', 57);
INSERT INTO public.car_model VALUES (640, 'Murano', 57);
INSERT INTO public.car_model VALUES (641, 'Note', 57);
INSERT INTO public.car_model VALUES (642, 'Qashqai', 57);
INSERT INTO public.car_model VALUES (643, 'Tiida', 57);
INSERT INTO public.car_model VALUES (644, 'Vanette', 57);
INSERT INTO public.car_model VALUES (645, 'Trade', 57);
INSERT INTO public.car_model VALUES (646, 'Vanette Cargo', 57);
INSERT INTO public.car_model VALUES (647, 'Pickup', 57);
INSERT INTO public.car_model VALUES (648, 'Navara', 57);
INSERT INTO public.car_model VALUES (649, 'Cabstar E', 57);
INSERT INTO public.car_model VALUES (650, 'Cabstar', 57);
INSERT INTO public.car_model VALUES (651, 'Maxima', 57);
INSERT INTO public.car_model VALUES (652, 'Camion', 57);
INSERT INTO public.car_model VALUES (653, 'Prairie', 57);
INSERT INTO public.car_model VALUES (654, 'Bluebird', 57);
INSERT INTO public.car_model VALUES (655, 'Np300 Pick Up', 57);
INSERT INTO public.car_model VALUES (656, 'Qashqai2', 57);
INSERT INTO public.car_model VALUES (657, 'Pixo', 57);
INSERT INTO public.car_model VALUES (658, 'Gtr', 57);
INSERT INTO public.car_model VALUES (659, '370z', 57);
INSERT INTO public.car_model VALUES (660, 'Cube', 57);
INSERT INTO public.car_model VALUES (661, 'Juke', 57);
INSERT INTO public.car_model VALUES (662, 'Leaf', 57);
INSERT INTO public.car_model VALUES (663, 'Evalia', 57);
INSERT INTO public.car_model VALUES (664, 'Astra', 58);
INSERT INTO public.car_model VALUES (665, 'Vectra', 58);
INSERT INTO public.car_model VALUES (666, 'Calibra', 58);
INSERT INTO public.car_model VALUES (667, 'Corsa', 58);
INSERT INTO public.car_model VALUES (668, 'Omega', 58);
INSERT INTO public.car_model VALUES (669, 'Frontera', 58);
INSERT INTO public.car_model VALUES (670, 'Tigra', 58);
INSERT INTO public.car_model VALUES (671, 'Monterey', 58);
INSERT INTO public.car_model VALUES (672, 'Sintra', 58);
INSERT INTO public.car_model VALUES (673, 'Zafira', 58);
INSERT INTO public.car_model VALUES (674, 'Agila', 58);
INSERT INTO public.car_model VALUES (675, 'Speedster', 58);
INSERT INTO public.car_model VALUES (676, 'Signum', 58);
INSERT INTO public.car_model VALUES (677, 'Meriva', 58);
INSERT INTO public.car_model VALUES (678, 'Antara', 58);
INSERT INTO public.car_model VALUES (679, 'Gt', 58);
INSERT INTO public.car_model VALUES (680, 'Combo', 58);
INSERT INTO public.car_model VALUES (681, 'Movano', 58);
INSERT INTO public.car_model VALUES (682, 'Vivaro', 58);
INSERT INTO public.car_model VALUES (683, 'Kadett', 58);
INSERT INTO public.car_model VALUES (684, 'Monza', 58);
INSERT INTO public.car_model VALUES (685, 'Senator', 58);
INSERT INTO public.car_model VALUES (686, 'Rekord', 58);
INSERT INTO public.car_model VALUES (687, 'Manta', 58);
INSERT INTO public.car_model VALUES (688, 'Ascona', 58);
INSERT INTO public.car_model VALUES (689, 'Insignia', 58);
INSERT INTO public.car_model VALUES (690, 'Zafira Tourer', 58);
INSERT INTO public.car_model VALUES (691, 'Ampera', 58);
INSERT INTO public.car_model VALUES (692, 'Mokka', 58);
INSERT INTO public.car_model VALUES (693, 'Adam', 58);
INSERT INTO public.car_model VALUES (694, '306', 59);
INSERT INTO public.car_model VALUES (695, '605', 59);
INSERT INTO public.car_model VALUES (696, '106', 59);
INSERT INTO public.car_model VALUES (697, '205', 59);
INSERT INTO public.car_model VALUES (698, '405', 59);
INSERT INTO public.car_model VALUES (699, '406', 59);
INSERT INTO public.car_model VALUES (700, '806', 59);
INSERT INTO public.car_model VALUES (701, '807', 59);
INSERT INTO public.car_model VALUES (702, '407', 59);
INSERT INTO public.car_model VALUES (703, '307', 59);
INSERT INTO public.car_model VALUES (704, '206', 59);
INSERT INTO public.car_model VALUES (705, '607', 59);
INSERT INTO public.car_model VALUES (706, '308', 59);
INSERT INTO public.car_model VALUES (707, '307 Sw', 59);
INSERT INTO public.car_model VALUES (708, '206 Sw', 59);
INSERT INTO public.car_model VALUES (709, '407 Sw', 59);
INSERT INTO public.car_model VALUES (710, '1007', 59);
INSERT INTO public.car_model VALUES (711, '107', 59);
INSERT INTO public.car_model VALUES (712, '207', 59);
INSERT INTO public.car_model VALUES (713, '4007', 59);
INSERT INTO public.car_model VALUES (714, 'Boxer', 59);
INSERT INTO public.car_model VALUES (715, 'Partner', 59);
INSERT INTO public.car_model VALUES (716, 'J5', 59);
INSERT INTO public.car_model VALUES (717, '604', 59);
INSERT INTO public.car_model VALUES (718, '505', 59);
INSERT INTO public.car_model VALUES (719, '309', 59);
INSERT INTO public.car_model VALUES (720, 'Bipper', 59);
INSERT INTO public.car_model VALUES (721, 'Partner Origin', 59);
INSERT INTO public.car_model VALUES (722, '3008', 59);
INSERT INTO public.car_model VALUES (723, '5008', 59);
INSERT INTO public.car_model VALUES (724, 'Rcz', 59);
INSERT INTO public.car_model VALUES (725, '508', 59);
INSERT INTO public.car_model VALUES (726, 'Ion', 59);
INSERT INTO public.car_model VALUES (727, '208', 59);
INSERT INTO public.car_model VALUES (728, '4008', 59);
INSERT INTO public.car_model VALUES (729, 'Trans Sport', 60);
INSERT INTO public.car_model VALUES (730, 'Firebird', 60);
INSERT INTO public.car_model VALUES (731, 'Trans Am', 60);
INSERT INTO public.car_model VALUES (732, '911', 61);
INSERT INTO public.car_model VALUES (733, 'Boxster', 61);
INSERT INTO public.car_model VALUES (734, 'Cayenne', 61);
INSERT INTO public.car_model VALUES (735, 'Carrera Gt', 61);
INSERT INTO public.car_model VALUES (736, 'Cayman', 61);
INSERT INTO public.car_model VALUES (737, '928', 61);
INSERT INTO public.car_model VALUES (738, '968', 61);
INSERT INTO public.car_model VALUES (739, '944', 61);
INSERT INTO public.car_model VALUES (740, '924', 61);
INSERT INTO public.car_model VALUES (741, 'Panamera', 61);
INSERT INTO public.car_model VALUES (742, '918', 61);
INSERT INTO public.car_model VALUES (743, 'Megane', 62);
INSERT INTO public.car_model VALUES (744, 'Safrane', 62);
INSERT INTO public.car_model VALUES (745, 'Laguna', 62);
INSERT INTO public.car_model VALUES (746, 'Clio', 62);
INSERT INTO public.car_model VALUES (747, 'Twingo', 62);
INSERT INTO public.car_model VALUES (748, 'Nevada', 62);
INSERT INTO public.car_model VALUES (749, 'Espace', 62);
INSERT INTO public.car_model VALUES (750, 'Spider', 62);
INSERT INTO public.car_model VALUES (751, 'Scenic', 62);
INSERT INTO public.car_model VALUES (752, 'Grand Espace', 62);
INSERT INTO public.car_model VALUES (753, 'Avantime', 62);
INSERT INTO public.car_model VALUES (754, 'Vel Satis', 62);
INSERT INTO public.car_model VALUES (755, 'Grand Scenic', 62);
INSERT INTO public.car_model VALUES (756, 'Clio Campus', 62);
INSERT INTO public.car_model VALUES (757, 'Modus', 62);
INSERT INTO public.car_model VALUES (758, 'Express', 62);
INSERT INTO public.car_model VALUES (759, 'Trafic', 62);
INSERT INTO public.car_model VALUES (760, 'Master', 62);
INSERT INTO public.car_model VALUES (761, 'Kangoo', 62);
INSERT INTO public.car_model VALUES (762, 'Mascott', 62);
INSERT INTO public.car_model VALUES (763, 'Master Propulsion', 62);
INSERT INTO public.car_model VALUES (764, 'Maxity', 62);
INSERT INTO public.car_model VALUES (765, 'R19', 62);
INSERT INTO public.car_model VALUES (766, 'R25', 62);
INSERT INTO public.car_model VALUES (767, 'R5', 62);
INSERT INTO public.car_model VALUES (768, 'R21', 62);
INSERT INTO public.car_model VALUES (769, 'R4', 62);
INSERT INTO public.car_model VALUES (770, 'Alpine', 62);
INSERT INTO public.car_model VALUES (771, 'Fuego', 62);
INSERT INTO public.car_model VALUES (772, 'R18', 62);
INSERT INTO public.car_model VALUES (773, 'R11', 62);
INSERT INTO public.car_model VALUES (774, 'R9', 62);
INSERT INTO public.car_model VALUES (775, 'R6', 62);
INSERT INTO public.car_model VALUES (776, 'Grand Modus', 62);
INSERT INTO public.car_model VALUES (777, 'Kangoo Combi', 62);
INSERT INTO public.car_model VALUES (778, 'Koleos', 62);
INSERT INTO public.car_model VALUES (779, 'Fluence', 62);
INSERT INTO public.car_model VALUES (780, 'Wind', 62);
INSERT INTO public.car_model VALUES (781, 'Latitude', 62);
INSERT INTO public.car_model VALUES (782, 'Grand Kangoo Combi', 62);
INSERT INTO public.car_model VALUES (783, 'Silver Dawn', 63);
INSERT INTO public.car_model VALUES (784, 'Silver Spur', 63);
INSERT INTO public.car_model VALUES (785, 'Park Ward', 63);
INSERT INTO public.car_model VALUES (786, 'Silver Seraph', 63);
INSERT INTO public.car_model VALUES (787, 'Corniche', 63);
INSERT INTO public.car_model VALUES (788, 'Phantom', 63);
INSERT INTO public.car_model VALUES (789, 'Touring', 63);
INSERT INTO public.car_model VALUES (790, 'Silvier', 63);
INSERT INTO public.car_model VALUES (791, '800', 64);
INSERT INTO public.car_model VALUES (792, '600', 64);
INSERT INTO public.car_model VALUES (793, '100', 64);
INSERT INTO public.car_model VALUES (794, '200', 64);
INSERT INTO public.car_model VALUES (795, 'Coupe', 64);
INSERT INTO public.car_model VALUES (796, '400', 64);
INSERT INTO public.car_model VALUES (797, '45', 64);
INSERT INTO public.car_model VALUES (798, 'Cabriolet', 64);
INSERT INTO public.car_model VALUES (799, '25', 64);
INSERT INTO public.car_model VALUES (800, 'Mini', 64);
INSERT INTO public.car_model VALUES (801, '75', 64);
INSERT INTO public.car_model VALUES (802, 'Streetwise', 64);
INSERT INTO public.car_model VALUES (803, 'Sd', 64);
INSERT INTO public.car_model VALUES (804, '900', 65);
INSERT INTO public.car_model VALUES (805, '93', 65);
INSERT INTO public.car_model VALUES (806, '9000', 65);
INSERT INTO public.car_model VALUES (807, '95', 65);
INSERT INTO public.car_model VALUES (808, '93x', 65);
INSERT INTO public.car_model VALUES (809, '94x', 65);
INSERT INTO public.car_model VALUES (810, '300', 66);
INSERT INTO public.car_model VALUES (811, '350', 66);
INSERT INTO public.car_model VALUES (812, 'Anibal', 66);
INSERT INTO public.car_model VALUES (813, 'Anibal Pick Up', 66);
INSERT INTO public.car_model VALUES (814, 'Ibiza', 67);
INSERT INTO public.car_model VALUES (815, 'Cordoba', 67);
INSERT INTO public.car_model VALUES (816, 'Toledo', 67);
INSERT INTO public.car_model VALUES (817, 'Marbella', 67);
INSERT INTO public.car_model VALUES (818, 'Alhambra', 67);
INSERT INTO public.car_model VALUES (819, 'Arosa', 67);
INSERT INTO public.car_model VALUES (820, 'Leon', 67);
INSERT INTO public.car_model VALUES (821, 'Altea', 67);
INSERT INTO public.car_model VALUES (822, 'Altea Xl', 67);
INSERT INTO public.car_model VALUES (823, 'Altea Freetrack', 67);
INSERT INTO public.car_model VALUES (824, 'Terra', 67);
INSERT INTO public.car_model VALUES (825, 'Inca', 67);
INSERT INTO public.car_model VALUES (826, 'Malaga', 67);
INSERT INTO public.car_model VALUES (827, 'Ronda', 67);
INSERT INTO public.car_model VALUES (828, 'Exeo', 67);
INSERT INTO public.car_model VALUES (829, 'Mii', 67);
INSERT INTO public.car_model VALUES (830, 'Felicia', 68);
INSERT INTO public.car_model VALUES (831, 'Forman', 68);
INSERT INTO public.car_model VALUES (832, 'Octavia', 68);
INSERT INTO public.car_model VALUES (833, 'Octavia Tour', 68);
INSERT INTO public.car_model VALUES (834, 'Fabia', 68);
INSERT INTO public.car_model VALUES (835, 'Superb', 68);
INSERT INTO public.car_model VALUES (836, 'Roomster', 68);
INSERT INTO public.car_model VALUES (837, 'Scout', 68);
INSERT INTO public.car_model VALUES (838, 'Pickup', 68);
INSERT INTO public.car_model VALUES (839, 'Favorit', 68);
INSERT INTO public.car_model VALUES (840, '130', 68);
INSERT INTO public.car_model VALUES (841, 'S', 68);
INSERT INTO public.car_model VALUES (842, 'Yeti', 68);
INSERT INTO public.car_model VALUES (843, 'Citigo', 68);
INSERT INTO public.car_model VALUES (844, 'Rapid', 68);
INSERT INTO public.car_model VALUES (845, 'Smart', 69);
INSERT INTO public.car_model VALUES (846, 'Citycoupe', 69);
INSERT INTO public.car_model VALUES (847, 'Fortwo', 69);
INSERT INTO public.car_model VALUES (848, 'Cabrio', 69);
INSERT INTO public.car_model VALUES (849, 'Crossblade', 69);
INSERT INTO public.car_model VALUES (850, 'Roadster', 69);
INSERT INTO public.car_model VALUES (851, 'Forfour', 69);
INSERT INTO public.car_model VALUES (852, 'Korando', 70);
INSERT INTO public.car_model VALUES (853, 'Family', 70);
INSERT INTO public.car_model VALUES (854, 'K4d', 70);
INSERT INTO public.car_model VALUES (855, 'Musso', 70);
INSERT INTO public.car_model VALUES (856, 'Korando Kj', 70);
INSERT INTO public.car_model VALUES (857, 'Rexton', 70);
INSERT INTO public.car_model VALUES (858, 'Rexton Ii', 70);
INSERT INTO public.car_model VALUES (859, 'Rodius', 70);
INSERT INTO public.car_model VALUES (860, 'Kyron', 70);
INSERT INTO public.car_model VALUES (861, 'Actyon', 70);
INSERT INTO public.car_model VALUES (862, 'Sports Pick Up', 70);
INSERT INTO public.car_model VALUES (863, 'Actyon Sports Pick Up', 70);
INSERT INTO public.car_model VALUES (864, 'Kodando', 70);
INSERT INTO public.car_model VALUES (865, 'Legacy', 71);
INSERT INTO public.car_model VALUES (866, 'Impreza', 71);
INSERT INTO public.car_model VALUES (867, 'Svx', 71);
INSERT INTO public.car_model VALUES (868, 'Justy', 71);
INSERT INTO public.car_model VALUES (869, 'Outback', 71);
INSERT INTO public.car_model VALUES (870, 'Forester', 71);
INSERT INTO public.car_model VALUES (871, 'G3x Justy', 71);
INSERT INTO public.car_model VALUES (872, 'B9 Tribeca', 71);
INSERT INTO public.car_model VALUES (873, 'Xt', 71);
INSERT INTO public.car_model VALUES (874, '1800', 71);
INSERT INTO public.car_model VALUES (875, 'Tribeca', 71);
INSERT INTO public.car_model VALUES (876, 'Wrx Sti', 71);
INSERT INTO public.car_model VALUES (877, 'Trezia', 71);
INSERT INTO public.car_model VALUES (878, 'Xv', 71);
INSERT INTO public.car_model VALUES (879, 'Brz', 71);
INSERT INTO public.car_model VALUES (880, 'Maruti', 72);
INSERT INTO public.car_model VALUES (881, 'Swift', 72);
INSERT INTO public.car_model VALUES (882, 'Vitara', 72);
INSERT INTO public.car_model VALUES (883, 'Baleno', 72);
INSERT INTO public.car_model VALUES (884, 'Samurai', 72);
INSERT INTO public.car_model VALUES (885, 'Alto', 72);
INSERT INTO public.car_model VALUES (886, 'Wagon R', 72);
INSERT INTO public.car_model VALUES (887, 'Jimny', 72);
INSERT INTO public.car_model VALUES (888, 'Grand Vitara', 72);
INSERT INTO public.car_model VALUES (889, 'Ignis', 72);
INSERT INTO public.car_model VALUES (890, 'Liana', 72);
INSERT INTO public.car_model VALUES (891, 'Grand Vitara Xl7', 72);
INSERT INTO public.car_model VALUES (892, 'Sx4', 72);
INSERT INTO public.car_model VALUES (893, 'Splash', 72);
INSERT INTO public.car_model VALUES (894, 'Kizashi', 72);
INSERT INTO public.car_model VALUES (895, 'Samba', 73);
INSERT INTO public.car_model VALUES (896, 'Tagora', 73);
INSERT INTO public.car_model VALUES (897, 'Solara', 73);
INSERT INTO public.car_model VALUES (898, 'Horizon', 73);
INSERT INTO public.car_model VALUES (899, 'Telcosport', 74);
INSERT INTO public.car_model VALUES (900, 'Telco', 74);
INSERT INTO public.car_model VALUES (1012, '353', 80);
INSERT INTO public.car_model VALUES (994, 'V40', 80);
INSERT INTO public.car_model VALUES (995, 'V50', 80);
INSERT INTO public.car_model VALUES (996, 'V70 Xc', 80);
INSERT INTO public.car_model VALUES (997, 'Xc70', 80);
INSERT INTO public.car_model VALUES (998, 'C70', 80);
INSERT INTO public.car_model VALUES (999, 'S80', 80);
INSERT INTO public.car_model VALUES (1000, 'S60', 80);
INSERT INTO public.car_model VALUES (1001, 'Xc90', 80);
INSERT INTO public.car_model VALUES (1002, 'C30', 80);
INSERT INTO public.car_model VALUES (1003, '780', 80);
INSERT INTO public.car_model VALUES (1004, '760', 80);
INSERT INTO public.car_model VALUES (1005, '740', 80);
INSERT INTO public.car_model VALUES (1006, '240', 80);
INSERT INTO public.car_model VALUES (1007, '360', 80);
INSERT INTO public.car_model VALUES (1008, '340', 80);
INSERT INTO public.car_model VALUES (1009, 'Xc60', 80);
INSERT INTO public.car_model VALUES (1010, 'V60', 80);
INSERT INTO public.car_model VALUES (1011, 'V40 Cross Country', 80);
INSERT INTO public.car_model VALUES (993, 'S40', 80);
INSERT INTO public.car_model VALUES (981, '440', 80);
INSERT INTO public.car_model VALUES (982, '850', 80);
INSERT INTO public.car_model VALUES (983, 'S70', 80);
INSERT INTO public.car_model VALUES (984, 'V70', 80);
INSERT INTO public.car_model VALUES (985, 'V70 Classic', 80);
INSERT INTO public.car_model VALUES (986, '940', 80);
INSERT INTO public.car_model VALUES (987, '480', 80);
INSERT INTO public.car_model VALUES (988, '460', 80);
INSERT INTO public.car_model VALUES (989, '960', 80);
INSERT INTO public.car_model VALUES (990, 'S90', 80);
INSERT INTO public.car_model VALUES (991, 'V90', 80);
INSERT INTO public.car_model VALUES (992, 'Classic', 80);
INSERT INTO public.car_model VALUES (1013, 'Model S', 75);
INSERT INTO public.car_model VALUES (1014, 'Model 3', 75);
INSERT INTO public.car_model VALUES (1015, 'Model X', 75);
INSERT INTO public.car_model VALUES (1016, 'Model Y', 75);
INSERT INTO public.car_model VALUES (1017, 'Roadster', 75);
INSERT INTO public.car_model VALUES (1018, 'Cybertruck', 75);
INSERT INTO public.car_model VALUES (949, 'Passat', 79);
INSERT INTO public.car_model VALUES (950, 'Golf', 79);
INSERT INTO public.car_model VALUES (951, 'Vento', 79);
INSERT INTO public.car_model VALUES (952, 'Polo', 79);
INSERT INTO public.car_model VALUES (953, 'Corrado', 79);
INSERT INTO public.car_model VALUES (954, 'Sharan', 79);
INSERT INTO public.car_model VALUES (955, 'Lupo', 79);
INSERT INTO public.car_model VALUES (956, 'Bora', 79);
INSERT INTO public.car_model VALUES (957, 'Jetta', 79);
INSERT INTO public.car_model VALUES (958, 'New Beetle', 79);
INSERT INTO public.car_model VALUES (959, 'Phaeton', 79);
INSERT INTO public.car_model VALUES (960, 'Touareg', 79);
INSERT INTO public.car_model VALUES (961, 'Touran', 79);
INSERT INTO public.car_model VALUES (962, 'Multivan', 79);
INSERT INTO public.car_model VALUES (963, 'Caddy', 79);
INSERT INTO public.car_model VALUES (964, 'Golf Plus', 79);
INSERT INTO public.car_model VALUES (965, 'Fox', 79);
INSERT INTO public.car_model VALUES (966, 'Eos', 79);
INSERT INTO public.car_model VALUES (967, 'Caravelle', 79);
INSERT INTO public.car_model VALUES (968, 'Tiguan', 79);
INSERT INTO public.car_model VALUES (969, 'Transporter', 79);
INSERT INTO public.car_model VALUES (970, 'Lt', 79);
INSERT INTO public.car_model VALUES (971, 'Taro', 79);
INSERT INTO public.car_model VALUES (972, 'Crafter', 79);
INSERT INTO public.car_model VALUES (973, 'California', 79);
INSERT INTO public.car_model VALUES (974, 'Santana', 79);
INSERT INTO public.car_model VALUES (975, 'Scirocco', 79);
INSERT INTO public.car_model VALUES (976, 'Passat Cc', 79);
INSERT INTO public.car_model VALUES (977, 'Amarok', 79);
INSERT INTO public.car_model VALUES (978, 'Beetle', 79);
INSERT INTO public.car_model VALUES (979, 'Up', 79);
INSERT INTO public.car_model VALUES (980, 'Cc', 79);
INSERT INTO public.car_model VALUES (942, '100', 78);
INSERT INTO public.car_model VALUES (943, '121', 78);
INSERT INTO public.car_model VALUES (944, '214', 78);
INSERT INTO public.car_model VALUES (945, '110 Stawra', 78);
INSERT INTO public.car_model VALUES (946, '111 Stawra', 78);
INSERT INTO public.car_model VALUES (947, '215', 78);
INSERT INTO public.car_model VALUES (948, '112 Stawra', 78);
INSERT INTO public.car_model VALUES (915, 'Celica', 76);
INSERT INTO public.car_model VALUES (916, 'Supra', 76);
INSERT INTO public.car_model VALUES (917, 'Paseo', 76);
INSERT INTO public.car_model VALUES (918, 'Land Cruiser 80', 76);
INSERT INTO public.car_model VALUES (919, 'Land Cruiser 100', 76);
INSERT INTO public.car_model VALUES (920, 'Land Cruiser', 76);
INSERT INTO public.car_model VALUES (921, 'Land Cruiser 90', 76);
INSERT INTO public.car_model VALUES (922, 'Corolla', 76);
INSERT INTO public.car_model VALUES (923, 'Auris', 76);
INSERT INTO public.car_model VALUES (924, 'Avensis', 76);
INSERT INTO public.car_model VALUES (925, 'Picnic', 76);
INSERT INTO public.car_model VALUES (926, 'Yaris', 76);
INSERT INTO public.car_model VALUES (927, 'Yaris Verso', 76);
INSERT INTO public.car_model VALUES (928, 'Mr2', 76);
INSERT INTO public.car_model VALUES (929, 'Previa', 76);
INSERT INTO public.car_model VALUES (930, 'Prius', 76);
INSERT INTO public.car_model VALUES (931, 'Avensis Verso', 76);
INSERT INTO public.car_model VALUES (932, 'Corolla Verso', 76);
INSERT INTO public.car_model VALUES (933, 'Corolla Sedan', 76);
INSERT INTO public.car_model VALUES (934, 'Aygo', 76);
INSERT INTO public.car_model VALUES (935, 'Hilux', 76);
INSERT INTO public.car_model VALUES (936, 'Dyna', 76);
INSERT INTO public.car_model VALUES (937, 'Land Cruiser 200', 76);
INSERT INTO public.car_model VALUES (938, 'Verso', 76);
INSERT INTO public.car_model VALUES (939, 'Iq', 76);
INSERT INTO public.car_model VALUES (940, 'Urban Cruiser', 76);
INSERT INTO public.car_model VALUES (941, 'Gt86', 76);
INSERT INTO public.car_model VALUES (914, 'Rav4', 76);
INSERT INTO public.car_model VALUES (911, 'Carina E', 76);
INSERT INTO public.car_model VALUES (912, '4runner', 76);
INSERT INTO public.car_model VALUES (913, 'Camry', 76);
INSERT INTO public.car_model VALUES (908, 'Vista', 76);
INSERT INTO public.car_model VALUES (909, 'Xenon', 76);
INSERT INTO public.car_model VALUES (910, 'Aria', 76);
INSERT INTO public.car_model VALUES (901, 'Sumo', 76);
INSERT INTO public.car_model VALUES (902, 'Safari', 76);
INSERT INTO public.car_model VALUES (903, 'Indica', 76);
INSERT INTO public.car_model VALUES (904, 'Indigo', 76);
INSERT INTO public.car_model VALUES (905, 'Grand Safari', 76);
INSERT INTO public.car_model VALUES (906, 'Tl Pick Up', 76);
INSERT INTO public.car_model VALUES (907, 'Xenon Pick Up', 76);
INSERT INTO public.car_model VALUES (1019, 'Alter', 77);
INSERT INTO public.car_model VALUES (1020, 'Alter II', 77);
INSERT INTO public.car_model VALUES (1021, 'Alter Turbo', 77);
INSERT INTO public.car_model VALUES (1022, 'Alter Trofeu', 77);
INSERT INTO public.car_model VALUES (1023, 'Cournil', 77);
INSERT INTO public.car_model VALUES (1024, 'Cournil Safari', 77);
INSERT INTO public.car_model VALUES (1025, 'Alter II Cournil', 77);
INSERT INTO public.car_model VALUES (1026, 'Alter II Trofeu', 77);
INSERT INTO public.car_model VALUES (1027, 'Alter II Longo', 77);
INSERT INTO public.car_model VALUES (1028, 'Alter II Turbo Longo', 77);
INSERT INTO public.car_model VALUES (1029, 'Alter II Trofeu Longo', 77);


--
-- TOC entry 3136 (class 0 OID 227815)
-- Dependencies: 212
-- Data for Name: color; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.color VALUES (11, 'Pink');
INSERT INTO public.color VALUES (12, 'Purple');
INSERT INTO public.color VALUES (13, 'Orange');
INSERT INTO public.color VALUES (14, 'Turquoise');
INSERT INTO public.color VALUES (15, 'Light Blue');
INSERT INTO public.color VALUES (16, 'Dark Blue');
INSERT INTO public.color VALUES (17, 'Light Green');
INSERT INTO public.color VALUES (18, 'Gold');
INSERT INTO public.color VALUES (19, 'Coral');
INSERT INTO public.color VALUES (20, 'Lilac');
INSERT INTO public.color VALUES (21, 'Ochre');
INSERT INTO public.color VALUES (22, 'Salmon');
INSERT INTO public.color VALUES (23, 'Cyan');
INSERT INTO public.color VALUES (24, 'Aqua');
INSERT INTO public.color VALUES (25, 'Violet');
INSERT INTO public.color VALUES (26, 'Indigo');
INSERT INTO public.color VALUES (27, 'Fuchsia');
INSERT INTO public.color VALUES (28, 'Crimson');
INSERT INTO public.color VALUES (29, 'Emerald');
INSERT INTO public.color VALUES (30, 'Magenta');
INSERT INTO public.color VALUES (31, 'Amber');
INSERT INTO public.color VALUES (32, 'Cinnamon');
INSERT INTO public.color VALUES (33, 'Dark Red');
INSERT INTO public.color VALUES (1, 'White');
INSERT INTO public.color VALUES (2, 'Black');
INSERT INTO public.color VALUES (3, 'Gray');
INSERT INTO public.color VALUES (4, 'Silver');
INSERT INTO public.color VALUES (5, 'Blue');
INSERT INTO public.color VALUES (6, 'Red');
INSERT INTO public.color VALUES (7, 'Green');
INSERT INTO public.color VALUES (8, 'Beige');
INSERT INTO public.color VALUES (9, 'Yellow');
INSERT INTO public.color VALUES (10, 'Brown');


--
-- TOC entry 3155 (class 0 OID 264525)
-- Dependencies: 232
-- Data for Name: headquarter; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.headquarter VALUES (1, 'Oficinas Santiago', 'Cidade da Cultura de Galicia, Monte Gaiás, s/n, 15707', 'santiago.png', 0);
INSERT INTO public.headquarter VALUES (2, 'Oficinas A Coruña', 'Galileo Galilei, 64, 15008', 'coruna.png', 0);
INSERT INTO public.headquarter VALUES (3, 'Oficinas Vigo', 'Edificio Citexvi, Fonte das Abelleiras, s/n · Local 27, 36310', 'vigo.png', 0);
INSERT INTO public.headquarter VALUES (4, 'Oficinas Ourense', 'Avd. Edificio CEI, Parque Tecnolóxico De, 32900', 'ourense.png', 0);


--
-- TOC entry 3151 (class 0 OID 263170)
-- Dependencies: 228
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.notification VALUES (84, 'has changed', '2023-07-19 09:53:51.833', 75);
INSERT INTO public.notification VALUES (85, 'has changed', '2023-07-19 09:54:08.73', 75);
INSERT INTO public.notification VALUES (86, 'has changed', '2023-07-19 09:54:23.246', 75);
INSERT INTO public.notification VALUES (87, 'has changed', '2023-07-19 09:56:02.35', 3);
INSERT INTO public.notification VALUES (88, 'has canceled', '2023-07-19 09:57:08.468', 3);
INSERT INTO public.notification VALUES (89, 'has changed', '2023-07-19 09:59:19.462', 73);
INSERT INTO public.notification VALUES (90, 'has canceled', '2023-07-19 10:00:05.375', 73);
INSERT INTO public.notification VALUES (91, 'has changed', '2023-07-20 14:25:36.699', 54);
INSERT INTO public.notification VALUES (92, 'has changed', '2023-07-21 10:28:10.659', 76);
INSERT INTO public.notification VALUES (93, 'has changed', '2023-07-21 10:30:31.175', 76);
INSERT INTO public.notification VALUES (94, 'has changed', '2023-07-21 13:44:03.552', 77);
INSERT INTO public.notification VALUES (95, 'has canceled', '2023-07-21 13:44:34.303', 77);
INSERT INTO public.notification VALUES (96, 'has canceled', '2023-07-21 13:44:38.516', 78);
INSERT INTO public.notification VALUES (97, 'has canceled', '2023-07-21 13:45:32.049', 79);
INSERT INTO public.notification VALUES (98, 'has canceled', '2023-07-21 13:49:41.555', 80);
INSERT INTO public.notification VALUES (99, 'has changed', '2023-07-21 13:57:03.195', 76);
INSERT INTO public.notification VALUES (100, 'has changed', '2023-07-26 09:27:19.985', 82);
INSERT INTO public.notification VALUES (101, 'has canceled', '2023-07-26 09:28:03.375', 82);
INSERT INTO public.notification VALUES (102, 'has canceled', '2023-07-26 09:35:48.509', 82);
INSERT INTO public.notification VALUES (103, 'has changed', '2023-07-26 11:59:29.035', 84);
INSERT INTO public.notification VALUES (104, 'has canceled', '2023-07-26 12:06:39.428', 84);
INSERT INTO public.notification VALUES (105, 'has canceled', '2023-07-26 12:22:26.883', 85);
INSERT INTO public.notification VALUES (106, 'has canceled', '2023-07-26 12:24:22.211', 86);
INSERT INTO public.notification VALUES (107, 'has canceled', '2023-07-26 12:55:28.52', 87);
INSERT INTO public.notification VALUES (108, 'has canceled', '2023-07-26 12:57:23.858', 88);
INSERT INTO public.notification VALUES (109, 'has changed', '2023-07-26 14:38:13.289', 89);
INSERT INTO public.notification VALUES (113, 'has changed', '2023-07-27 09:46:51.722', 90);
INSERT INTO public.notification VALUES (114, 'has canceled', '2023-07-27 09:47:00.944', 90);
INSERT INTO public.notification VALUES (115, 'has changed', '2023-07-27 11:58:27.26', 91);
INSERT INTO public.notification VALUES (116, 'has changed', '2023-07-27 12:02:51.313', 59);
INSERT INTO public.notification VALUES (117, 'has canceled', '2023-07-27 12:03:13.042', 59);


--
-- TOC entry 3149 (class 0 OID 262358)
-- Dependencies: 226
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.rating VALUES (68, 5, 34, 'jaalva', 'juanjo');
INSERT INTO public.rating VALUES (9, 4, 26, 'millan', 'juanjo');
INSERT INTO public.rating VALUES (69, 5, 23, 'jaalva', 'guiviro');
INSERT INTO public.rating VALUES (70, 4, 21, 'jaalva', 'juanjo');
INSERT INTO public.rating VALUES (75, 5, 28, 'jaalva', 'juanjo');
INSERT INTO public.rating VALUES (77, 4, 12, 'jaalva', 'guiviro');
INSERT INTO public.rating VALUES (78, 5, 27, 'millan', 'jaalva');
INSERT INTO public.rating VALUES (81, 5, 82, 'jaalva', 'prueba');
INSERT INTO public.rating VALUES (82, 4, 81, 'jaalva', 'prueba');
INSERT INTO public.rating VALUES (83, 4, 87, 'jaalva', 'prueba');
INSERT INTO public.rating VALUES (88, 5, 24, 'guiviro', 'dagodi');
INSERT INTO public.rating VALUES (89, 4, 10, 'jaalva', 'dagodi');
INSERT INTO public.rating VALUES (93, 4, 22, 'dagodi', 'jaalva');
INSERT INTO public.rating VALUES (94, 4, 9, 'dagodi', 'guiviro');


--
-- TOC entry 3123 (class 0 OID 208507)
-- Dependencies: 199
-- Data for Name: ti18n; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ti18n VALUES (0, 'i18n.bundle', 'Resource bundle in database');


--
-- TOC entry 3124 (class 0 OID 208541)
-- Dependencies: 200
-- Data for Name: ti18n_value; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3125 (class 0 OID 208581)
-- Dependencies: 201
-- Data for Name: trequest_statistics; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3145 (class 0 OID 229298)
-- Dependencies: 221
-- Data for Name: trip; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trip VALUES (2, 'Avenida de Malatosis, 34', 'A Grela, 4', '2023-07-05', '2023-07-05 12:00:00', 'jaalva', 1, 'Pabellón A Malata', 'Oficinas Imatia Santiago', true, 'default.png');
INSERT INTO public.trip VALUES (43, 'Casa', 'Galileo Galilei, 64, 15008', '2023-07-04', '2023-06-30 22:00:00', 'juanjo', 5, 'Imatia', 'Oficinas Imatia Santiago', true, 'default.png');
INSERT INTO public.trip VALUES (55, 'Plaza Compostela', 'Cidade da Cultura', '2023-07-13', '2023-07-04 16:00:00', 'juanjo', 5, 'Oficinas Imatia', 'Plaza Compostela', true, 'default.png');
INSERT INTO public.trip VALUES (62, 'Avenida de Marin 40', 'Avenida de Santiago 40', '2023-07-06', '2023-07-05 12:00:00', 'jaalva', 9, 'Santiago de Compostela', 'Ourense', true, 'default.png');
INSERT INTO public.trip VALUES (1, 'Avenida de Lugo, 123', 'Montealto City, 42', '2023-06-04', '2023-06-23 12:00:00', 'jaalva', 1, 'Taller Midas Santiago', 'Oficinas Imatia A Grela', true, 'default.png');
INSERT INTO public.trip VALUES (74, 'Parada buses', 'Avd. Edificio CEI, Parque Tecnolóxico De, 32900', '2023-07-17', '2023-07-17 12:00:00', 'prueba', 14, 'Parada buses', 'Oficinas Ourense', true, 'ourense.png');
INSERT INTO public.trip VALUES (58, 'Pabellon da malata 5', 'A grela 4', '2023-07-12', '2023-07-04 19:00:00', 'dagodi', 3, 'Pabellon A Malata', 'Oficinas Imatia A grela', true, 'coruna.png');
INSERT INTO public.trip VALUES (61, 'Plaza de la Marina', 'Parque Tecnológico', '2023-07-06', '2023-07-04 13:00:00', 'guiviro', 2, 'Parada buses', 'Oficinas Imatia Ourense', true, 'ourense.png');
INSERT INTO public.trip VALUES (80, 'Calle Hórreo, 2', 'Cidade da Cultura de Galicia, Monte Gaiás, s/n, 15707', '2023-07-22', '2023-07-21 12:00:00', 'demo', 17, 'Estación Intermodal', 'Oficinas Santiago', false, 'santiago.png');
INSERT INTO public.trip VALUES (3, 'Avenida de Navia, 4', 'Cidade da Cultura de Galicia, Monte Gaiás, s/n, 15707', '2023-07-31', '2023-07-30 12:00:00', 'jaalva', 1, 'Santiago', 'Oficinas Santiago', false, 'santiago.png');
INSERT INTO public.trip VALUES (73, 'Plaza América', 'Galileo Galilei, 64, 15008', '2023-07-20', '2023-07-18 12:00:00', 'prueba', 14, 'Plaza América', 'Oficinas A Coruña', false, 'coruna.png');
INSERT INTO public.trip VALUES (78, 'Plaza América', 'Edificio Citexvi, Fonte das Abelleiras, s/n · Local 27, 36310', '2023-07-30', '2023-07-21 12:00:00', 'demo', 17, 'Plaza América', 'Oficinas Vigo', true, 'vigo.png');
INSERT INTO public.trip VALUES (76, 'Riazor, 2', 'Edificio Citexvi, Fonte das Abelleiras, s/n · Local 27, 36310', '2023-07-28', '2023-07-21 12:00:00', 'demo', 17, 'A Coruña', 'Oficinas Vigo', true, 'vigo.png');
INSERT INTO public.trip VALUES (90, 'asdad', 'Edificio Citexvi, Fonte das Abelleiras, s/n · Local 27, 36310', '2023-07-28', '2023-07-27 12:00:00', 'roque', 28, 'asdaa', 'Oficinas Vigo', false, 'vigo.png');
INSERT INTO public.trip VALUES (70, 'Avenida de Riazor, 2', 'Galileo Galilei, 64, 15008', '2023-07-27', '2023-07-17 18:00:00', 'jaalva', 9, 'Riazor', 'Oficinas A Coruña', true, 'coruna.png');
INSERT INTO public.trip VALUES (71, 'Avenida de Marconi, 1', 'Avd. Edificio CEI, Parque Tecnolóxico De, 32900', '2023-07-30', '2023-07-18 12:00:00', 'prueba', 14, 'Área Central', 'Oficinas Ourense', true, 'ourense.png');
INSERT INTO public.trip VALUES (68, 'Luis Seoane 5', 'Edificio Citexvi, Fonte das Abelleiras, s/n · Local 27, 36310', '2023-07-15', '2023-07-12 12:00:00', 'guiviro', 2, 'Plaza Compostela', 'Oficinas Vigo', true, 'vigo.png');
INSERT INTO public.trip VALUES (64, 'Plaza de Ourense, 4', 'Navia, 5', '2023-07-14', '2023-07-12 12:00:00', 'guiviro', 2, 'Ourense', 'Vigo', true, 'default.png');
INSERT INTO public.trip VALUES (65, 'Rúa de San Pedro, 70', 'Avd. Edificio CEI, Parque Tecnolóxico De, 32900', '2023-07-13', '2023-07-12 12:00:00', 'guiviro', 2, 'Taller Midas Santiago', 'Oficinas Imatia Ourense', true, 'default.png');
INSERT INTO public.trip VALUES (81, 'Avenida Otero Pedrayo 11, Ourense', 'Edificio Citexvi, Fonte das Abelleiras, s/n · Local 27, 36310', '2023-07-28', '2023-07-26 19:00:00', 'dagodi', 3, 'Rotonda Lagunas', 'Oficinas Vigo', false, 'vigo.png');
INSERT INTO public.trip VALUES (4, 'CC Marineda, A Coruña', 'Montealto City, 80, A Coruña', '2023-05-29', '2023-06-23 12:00:00', 'jaalva', 1, 'MegaJump de Marineda', 'Oficinas de visita programada
Oficinas Imatia A Grela
Oficinas Imatia A Coruña', true, 'default.png');
INSERT INTO public.trip VALUES (5, 'A Malata', 'Riazor, 2', '2023-06-29', '2023-06-26 12:00:00', 'guiviro', 2, 'Pabellón A Malata', 'Oficinas Imatia Santiago', true, 'default.png');
INSERT INTO public.trip VALUES (13, 'CC Marineda, A Coruña', 'Montealto City, 80, A Coruña', '2023-06-04', '2023-06-30 15:00:00', 'guiviro', 2, 'Navia', 'Oficinas Imatia A Grela', true, 'default.png');
INSERT INTO public.trip VALUES (15, 'Avenida de Ourense 4', 'Poligono industrial Orense', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Riazor', 'Oficinas Imatia Santiago', true, 'default.png');
INSERT INTO public.trip VALUES (60, 'Luis Seoane 5', 'Poligono industrial Orense', '2023-07-10', '2023-07-04 12:00:00', 'dagodi', 3, 'Mercadona Lagunas', 'Oficinas Imatia Ourense', true, 'default.png');
INSERT INTO public.trip VALUES (21, 'Avenida de Navia, 4', 'Avd. Edificio CEI, Parque Tecnolóxico De, 32900', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Riazor', 'Oficinas Imatia A Grela', true, 'default.png');
INSERT INTO public.trip VALUES (63, 'Avenida Buenos Aires', 'Cuatros caminos', '2023-07-12', '2023-07-05 12:00:00', 'jaalva', 10, 'Ourense', 'A Coruña', true, 'default.png');
INSERT INTO public.trip VALUES (75, 'Calle Hórreo, 2', 'Avd. Edificio CEI, Parque Tecnolóxico De, 32900', '2023-07-20', '2023-07-18 12:00:00', 'jaalva', 9, 'Estación Intermodal', 'Oficinas Ourense', true, 'ourense.png');
INSERT INTO public.trip VALUES (23, 'Avenida de Navia, 4', 'Montealto City, 80, A Coruña', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Pabellón A Malata', 'Oficinas Imatia A Grela', true, 'default.png');
INSERT INTO public.trip VALUES (26, 'Avenida de Lugo, 123', 'Riazor, 2', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Navia', 'Oficinas de visita programada
Oficinas Imatia A Grela
Oficinas Imatia A Coruña', true, 'default.png');
INSERT INTO public.trip VALUES (37, 'Rúa de San Pedro, 70', 'Montealto City, 80, A Coruña', '2023-06-04', '2023-06-30 12:00:00', 'jaalva', 1, 'Navia', 'Oficinas de visita programada
Oficinas Imatia A Grela
Oficinas Imatia A Coruña', true, 'default.png');
INSERT INTO public.trip VALUES (56, 'Plaza Compostela 4', 'Cidade da Cultura', '2023-07-13', '2023-07-04 19:00:00', 'juanjo', 5, 'Plaza Compostela', 'Oficinas Imatia', true, 'default.png');
INSERT INTO public.trip VALUES (57, 'Plaza America 4', 'Universidad de Vigo', '2023-06-11', '2023-06-04 19:00:00', 'juanjo', 5, 'Plaza América', 'Oficinas Imatia Vigo', true, 'default.png');
INSERT INTO public.trip VALUES (72, 'Oficinas Imatia', 'Cidade da Cultura de Galicia, Monte Gaiás, s/n, 15707', '2023-07-16', '2023-07-16 12:00:00', 'prueba', 14, 'Oficinas Imatia', 'Oficinas Santiago', true, 'santiago.png');
INSERT INTO public.trip VALUES (54, 'Rúa de San Pedro, 70', 'Cidade da Cultura de Galicia, Monte Gaiás, s/n, 15707', '2023-07-28', '2023-07-18 12:45:00', 'jaalva', 7, 'Cruceiro de San Pedro', 'Oficinas Santiago', true, 'santiago.png');
INSERT INTO public.trip VALUES (20, 'Oficinas Imatia', 'A Grela, 4', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Navia', 'Oficinas de visita programada
Oficinas Imatia A Grela
Oficinas Imatia A Coruña', true, 'default.png');
INSERT INTO public.trip VALUES (67, 'Plaza Compostela 4', 'Avd. Edificio CEI, Parque Tecnolóxico De, 32900', '2023-07-28', '2023-07-12 12:00:00', 'guiviro', 2, 'Taller Midas Santiago', 'Oficinas Ourense', true, 'ourense.png');
INSERT INTO public.trip VALUES (69, 'Pabellon da malata 5', 'Cidade da Cultura de Galicia, Monte Gaiás, s/n, 15707', '2023-07-29', '2023-07-29 12:00:00', 'guiviro', 2, 'Pabellon A Malata', 'Oficinas Santiago', true, 'santiago.png');
INSERT INTO public.trip VALUES (22, 'Avenida de Ourense 4', 'Plaza de Galicia, 46, Santiago de Compostela', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Taller Midas Santiago', 'Oficinas Imatia Santiago', true, 'default.png');
INSERT INTO public.trip VALUES (30, 'Avenida de Riazor, 2', 'Montealto City, 80, A Coruña', '2023-06-04', '2023-06-30 12:00:00', 'jaalva', 1, 'Taller Midas Santiago', 'Oficinas Imatia A Grela', true, 'default.png');
INSERT INTO public.trip VALUES (24, 'Rúa de San Pedro, 70', 'Plaza de Galicia, 46, Santiago de Compostela', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Navia', 'Oficinas de visita programada
Oficinas Imatia A Grela
Oficinas Imatia A Coruña', true, 'default.png');
INSERT INTO public.trip VALUES (27, 'Oficinas Imatia', 'Poligono industrial 4', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Riazor', 'Oficinas Imatia Santiago', true, 'default.png');
INSERT INTO public.trip VALUES (6, 'asdasd', 'Montealto City, 80, A Coruña', '2023-06-28', '2023-06-26 07:31:00', 'dagodi', 3, 'Taller Midas Santiago', 'Oficinas Imatia A Grela', true, 'default.png');
INSERT INTO public.trip VALUES (31, 'Rúa de San Pedro, 70', 'Galileo Galilei, 64, 15008', '2023-07-05', '2023-06-30 12:00:00', 'jaalva', 1, 'Pabellón A Malata', 'Oficinas Imatia A Grela', true, 'default.png');
INSERT INTO public.trip VALUES (38, 'Rúa de San Pedro, 70', 'Universidad de Vigo', '2023-06-04', '2023-06-30 12:00:00', 'jaalva', 1, 'Riazor', 'Oficinas Imatia Santiago', true, 'default.png');
INSERT INTO public.trip VALUES (35, 'Rúa de San Pedro, 70', 'Poligono industrial 4', '2023-06-04', '2023-06-30 12:00:00', 'jaalva', 1, 'Pabellón A Malata', 'Oficinas Imatia Santiago', true, 'default.png');
INSERT INTO public.trip VALUES (12, 'Avenida de Riazor, 2', 'Avd. Edificio CEI, Parque Tecnolóxico De, 32900', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Pabellón A Malata', 'Oficinas de visita programada
Oficinas Imatia A Grela
Oficinas Imatia A Coruña', true, 'default.png');
INSERT INTO public.trip VALUES (16, 'CC Marineda, A Coruña', 'A Grela, 4', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Navia', 'Oficinas de visita programada
Oficinas Imatia A Grela
Oficinas Imatia A Coruña', true, 'default.png');
INSERT INTO public.trip VALUES (28, 'Avenida de Lugo, 123', 'Avd. Edificio CEI, Parque Tecnolóxico De, 32900', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Pabellón A Malata', 'Oficinas Imatia A Grela', true, 'default.png');
INSERT INTO public.trip VALUES (10, 'Calle Hórreo, 2', 'Montealto City, 80, A Coruña', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Navia', 'Oficinas de visita programada
Oficinas Imatia A Grela
Oficinas Imatia A Coruña', true, 'default.png');
INSERT INTO public.trip VALUES (11, 'Avenida de Navia, 4', 'Poligono industrial Orense', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Riazor', 'Oficinas Imatia Santiago', true, 'default.png');
INSERT INTO public.trip VALUES (17, 'Calle Hórreo, 2', 'Plaza de Galicia, 46, Santiago de Compostela', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Riazor', 'Oficinas Imatia A Grela', true, 'default.png');
INSERT INTO public.trip VALUES (29, 'Calle Hórreo, 2', 'Avd. Edificio CEI, Parque Tecnolóxico De, 32900', '2023-06-04', '2023-06-30 12:00:00', 'jaalva', 1, 'Riazor', 'Oficinas Imatia Santiago', true, 'default.png');
INSERT INTO public.trip VALUES (19, 'Avenida de Lugo, 123', 'Poligono industrial 4', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Pabellón A Malata', 'Oficinas Imatia A Grela', true, 'default.png');
INSERT INTO public.trip VALUES (25, 'Calle Hórreo, 2', 'A Grela, 4', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Riazor', 'Oficinas Imatia A Grela', true, 'default.png');
INSERT INTO public.trip VALUES (91, 'Avenida de Lugo, 140', 'Edificio Citexvi, Fonte das Abelleiras, s/n · Local 27, 36310', '2023-07-28', '2023-07-27 12:00:00', 'roque', 30, 'Taller Midas', 'Oficinas Vigo', true, 'vigo.png');
INSERT INTO public.trip VALUES (14, 'Plaza Compostela 4', 'Montealto City, 80, A Coruña', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Taller Midas Santiago', 'Oficinas Imatia A Grela', true, 'default.png');
INSERT INTO public.trip VALUES (18, 'Luis Seoane 5', 'Riazor, 2', '2023-06-04', '2023-06-30 12:00:00', 'guiviro', 2, 'Taller Midas Santiago', 'Oficinas de visita programada
Oficinas Imatia A Grela
Oficinas Imatia A Coruña', true, 'default.png');
INSERT INTO public.trip VALUES (32, 'Avenida de Riazor, 2', 'Riazor, 2', '2023-06-04', '2023-06-30 12:00:00', 'jaalva', 1, 'Riazor', 'Oficinas Imatia A Grela', true, 'default.png');
INSERT INTO public.trip VALUES (33, 'Avenida de Ourense 4', 'Universidad de Vigo', '2023-06-04', '2023-06-30 12:00:00', 'jaalva', 1, 'Riazor', 'Oficinas de visita programada
Oficinas Imatia A Grela
Oficinas Imatia A Coruña', true, 'default.png');
INSERT INTO public.trip VALUES (36, 'Luis Seoane 5', 'Universidad de Vigo', '2023-06-04', '2023-06-30 12:00:00', 'jaalva', 1, 'Riazor', 'Oficinas Imatia A Grela', true, 'default.png');
INSERT INTO public.trip VALUES (59, 'Avenida de Ourense 4', 'Galileo Galilei, 64, 15008', '2023-07-28', '2023-07-28 12:00:00', 'dagodi', 3, 'Rotonda Lux', 'Oficinas A Coruña', false, 'coruna.png');
INSERT INTO public.trip VALUES (77, 'Calle Hórreo, 2', 'Galileo Galilei, 64, 15008', '2023-07-21', '2023-07-21 20:00:00', 'demo', 17, 'Estación Intermodal', 'Oficinas A Coruña', false, 'coruna.png');
INSERT INTO public.trip VALUES (79, 'Plaza América', 'Galileo Galilei, 64, 15008', '2023-07-28', '2023-07-21 12:00:00', 'demo', 17, 'Plaza América', 'Oficinas A Coruña', true, 'coruna.png');


--
-- TOC entry 3153 (class 0 OID 263637)
-- Dependencies: 230
-- Data for Name: trip_historical; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trip_historical VALUES (14, 'Cruceiro de San Pedro', 'Oficinas Imatia Santiago', 'Rúa de San Pedro, 70', 'Cidade da Cultura, Monte Gaiás, 1', '2023-07-14', '2023-07-04 09:00:00', 'jaalva', 7, 54);
INSERT INTO public.trip_historical VALUES (15, 'Cruceiro de San Pedro', 'Oficinas Imatia Santiago', 'Rúa de San Pedro, 70', 'Cidade da Cultura, Monte Gaiás, 1', '2023-07-14', '2023-07-04 09:00:00', 'jaalva', 7, 54);
INSERT INTO public.trip_historical VALUES (16, 'Cruceiro de San Pedro', 'Oficinas Imatia Santiago', 'Rúa de San Pedro, 70', 'Cidade da Cultura, Monte Gaiás, 1', '2023-07-14', '2023-07-04 09:00:00', 'jaalva', 7, 54);
INSERT INTO public.trip_historical VALUES (17, 'Cruceiro de San Pedro', 'Oficinas Imatia Santiago', 'Rúa de San Pedro, 70', 'Cidade da Cultura, Monte Gaiás, 1', '2023-07-14', '2023-07-04 09:00:00', 'jaalva', 7, 54);
INSERT INTO public.trip_historical VALUES (18, 'Cruceiro de San Pedro', 'Oficinas Imatia Santiago', 'Rúa de San Pedro, 70', 'Cidade da Cultura, Monte Gaiás, 1', '2023-07-14', '2023-07-04 09:00:00', 'jaalva', 7, 54);
INSERT INTO public.trip_historical VALUES (19, 'Cruceiro de San Pedro', 'Oficinas Imatia Santiago', 'Rúa de San Pedro, 70', 'Cidade da Cultura, Monte Gaiás, 1', '2023-07-14', '2023-07-04 09:00:00', 'jaalva', 7, 54);
INSERT INTO public.trip_historical VALUES (20, 'Cruceiro de San Pedro', 'Oficinas Imatia Santiago', 'Rúa de San Pedro, 70', 'Cidade da Cultura, Monte Gaiás, 1', '2023-07-14', '2023-07-04 09:00:00', 'jaalva', 7, 54);


--
-- TOC entry 3126 (class 0 OID 208590)
-- Dependencies: 202
-- Data for Name: trole; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trole VALUES (0, 'admin', '<?xml version="1.0" encoding="UTF-8"?><security></security>');
INSERT INTO public.trole VALUES (1, 'basic', '<?xml version="1.0" encoding="UTF-8"?><security></security>');


--
-- TOC entry 3127 (class 0 OID 208600)
-- Dependencies: 203
-- Data for Name: trole_server_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trole_server_permission VALUES (0, 0, 0);


--
-- TOC entry 3128 (class 0 OID 208609)
-- Dependencies: 204
-- Data for Name: tserver_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tserver_permission VALUES (0, 'com.ontimize.jee.common.services.user.IUserInformationService/getUserInformation');


--
-- TOC entry 3133 (class 0 OID 208789)
-- Dependencies: 209
-- Data for Name: tsetting; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tsetting VALUES (0, 'mail_host', 'smtp.gmail.com', 'Host del servidor');
INSERT INTO public.tsetting VALUES (1, 'mail_port', '587', 'Puerto del servidor de email');
INSERT INTO public.tsetting VALUES (2, 'mail_protocol', 'smtp', 'Protocolo de env\u00edo de mails');
INSERT INTO public.tsetting VALUES (3, 'mail_user', 'mi.mail@example.com', 'Usuario para el env\u00edo de mails');
INSERT INTO public.tsetting VALUES (4, 'mail_password', 'mis_credenciales', 'Password del servidor de mail');
INSERT INTO public.tsetting VALUES (5, 'mail_encoding', 'UTF-8', 'Codificaci\u00f3n de mails');
INSERT INTO public.tsetting VALUES (6, 'mail_properties', 'mail.smtp.auth:true;mail.smtp.starttls.enable:true;', 'Propiedades de mails');
INSERT INTO public.tsetting VALUES (7, 'report_folder', 'C:/applications/ontimize-boot-app/reports', 'Carpeta de las plantillas de report');


--
-- TOC entry 3129 (class 0 OID 208629)
-- Dependencies: 205
-- Data for Name: tuser; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tuser VALUES ('guiviro', '1111111111', 'Guillén', 'Vidal', 'guillen.vidal@campusdual.com', NULL, NULL, NULL, NULL, 'Rodríguez');
INSERT INTO public.tuser VALUES ('dagodi', '2222222222', 'David', 'González', 'david.gonzalez@campusdual.com', NULL, NULL, NULL, NULL, 'Diéguez');
INSERT INTO public.tuser VALUES ('oslosa', '3333333333', 'Óscar', 'López-Boado', 'oscar.lopez@campusdual.com', NULL, NULL, NULL, NULL, 'San Martín');
INSERT INTO public.tuser VALUES ('jaalva', '4444444444', 'Jaime', 'Álvarez-Ossorio', 'jaime.alvarez@campusdual.com', NULL, NULL, NULL, NULL, 'Varela');
INSERT INTO public.tuser VALUES ('demo', 'demouser', 'Álex', 'García', 'alex.garcia@campusdualtic.com', '44460713B', NULL, NULL, NULL, 'Fernández');
INSERT INTO public.tuser VALUES ('daniel', 'abc123.', 'Daniel', 'Suárez', 'jaime.alvarez@campusdual.com', NULL, NULL, NULL, NULL, 'Valcárcel');
INSERT INTO public.tuser VALUES ('juanjo', '5555555555', 'Marga', 'Álvarez', 'marga.alvarez@campusdual.com', NULL, NULL, NULL, NULL, 'González');
INSERT INTO public.tuser VALUES ('maite', 'abc123.', 'Maite', 'Gondar', 'maite.gondar@campusdual.com', NULL, NULL, NULL, NULL, 'Pérez');
INSERT INTO public.tuser VALUES ('roque', 'abc123.', 'Roque', 'Bond', 'roque.bond@campusdual.com', NULL, NULL, NULL, NULL, 'Hamilton');
INSERT INTO public.tuser VALUES ('millan', '6666666666', 'Javier', 'Pérez', 'javier.perez@campusdual.com', NULL, NULL, NULL, NULL, 'Bouzada');
INSERT INTO public.tuser VALUES ('gabriel', '7777777777', 'Gabriel', 'Fernández', 'gabriel.fernandez@campusdual.com', NULL, NULL, NULL, NULL, 'Kirsten');
INSERT INTO public.tuser VALUES ('prueba', 'abc123.', 'Cristina', 'García', 'david.gonzalez@campusdual.com', NULL, NULL, NULL, NULL, 'Varela');
INSERT INTO public.tuser VALUES ('fernando', '8888888888', 'Fernando', 'Lázaro', 'fernando.lazaro@campusdual.com', NULL, NULL, NULL, NULL, 'Miranda');


--
-- TOC entry 3130 (class 0 OID 208640)
-- Dependencies: 206
-- Data for Name: tuser_preference; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tuser_preference VALUES (0, 'user_preference', 'demo', 'Iw0KI1R1ZSBNYXkgMTYgMTI6NTc6MDYgQ0VTVCAyMDE3DQpkZW1vX2FwcF9zdGF0dXNfYmFyX3Zpc2libGU9eWVzDQpkZW1vX2FkanVzdF90cmVlX3NwYWNlPXRydWUNCmRlbW9fYXBwX3dpbmRvd19zdGF0ZT0wDQpkZW1vX3RhYmxlX2NvbmZfc29ydF9maWx0ZXJfZm9ybUN1c3RvbWVyLnhtbF9DdXN0b21lclNlcnZpY2UuY3VzdG9tZXJfVEVTVD1udWxsO251bGw7U1VSTkFNRVw9OThcOjF8SURcPTc1XDoyfE5BTUVcPTk5XDozfENVU1RPTUVSVFlQRUlEXD0wXDo0fENVU1RPTUVSSURcPTEyNVw6NXxBRERSRVNTXD0xMjNcOjZ8UEhPTkVcPTEyMVw6N3xTVEFSVERBVEVcPTEzNlw6OHxMT05HSVRVREVcPTExNlw6OXxMQVRJVFVERVw9MTEzXDoxMHxFTUFJTFw9MTcwXDoxMnw7QkFTRTY0ck8wQUJYTnlBQk5xWVhaaExuVjBhV3d1U0dGemFIUmhZbXhsRTdzUEpTRks1TGdEQUFKR0FBcHNiMkZrUm1GamRHOXlTUUFKZEdoeVpYTm9iMnhrZUhBL1FBQUFBQUFBQ0hjSUFBQUFDd0FBQUFCNA0KZGVtb190YWJsZV9jb25mX3NvcnRfZmlsdGVyX2NvbmZpZ3VyYXRpb25zX2Zvcm1DdXN0b21lci54bWxfQ3VzdG9tZXJTZXJ2aWNlLmN1c3RvbWVyPVRFU1QNCmRlbW9fdGFibGVfY29udHJvbF9wYW5lbF9mb3JtQWNjb3VudHMtZGV0YWlsLnhtbF9Nb3ZlbWVudFNlcnZpY2UubW92ZW1lbnQ9Z3JvdXB0YWJsZWtleTtkZWZhdWx0Y2hhcnRidXR0b247ZXhjZWxleHBvcnRidXR0b247c3Vtcm93YnV0dG9uO2NhbGN1bGVkY29sc2J1dHRvbjtwcmludGluZ2J1dHRvbjtmaWx0ZXJzYXZlYnV0dG9uO3Zpc2libGVjb2xzYnV0dG9uO2h0bWxleHBvcnRidXR0b247Y29weWJ1dHRvbjtncm91cHRhYmxla2V5O2luc2VydGJ1dHRvbjtyZWZyZXNoYnV0dG9uDQpkZW1vX2Zvcm1CcmFuY2hlcy1kZXRhaWwueG1sPTg4MDs1MDU7LTExNTA7MzY5DQpkZW1vX2RldGFpbF9kaWFsb2dfc2l6ZV9wb3NpdGlvbl9mb3JtQ3VzdG9tZXIueG1sX0N1c3RvbWVyU2VydmljZS5jdXN0b21lcj03NDk7MzUwOy0xOTA1OzM5MQ0KZGVtb19hcHBfdG9vbGJhcl9sb2NhdGlvbj1Ob3J0aA0KZGVtb19hcHBfd2luZG93X3Bvc2l0aW9uPS0xNTgwOzExDQpkZW1vX2FwcF93aW5kb3dfc2l6ZT0xNTg0OzEwNDQNCmRlbW9fZm9ybUVtcGxveWVlcy1kZXRhaWwueG1sPTExMTY7NzM5OzYxMDsxOTUNCmRlbW9fZm9ybUFjY291bnRzLWRldGFpbC54bWw9OTE1OzUwMDstMTE1MDszNjkNCg==');


--
-- TOC entry 3131 (class 0 OID 208656)
-- Dependencies: 207
-- Data for Name: tuser_role; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tuser_role VALUES (0, 0, 'demo');
INSERT INTO public.tuser_role VALUES (14, 1, 'guiviro');
INSERT INTO public.tuser_role VALUES (15, 1, 'dagodi');
INSERT INTO public.tuser_role VALUES (12, 1, 'jaalva');


--
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 198
-- Name: a; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.a', 19, true);


--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 208
-- Name: b; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.b', 7, true);


--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 222
-- Name: bookingseq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bookingseq', 102, true);


--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 214
-- Name: brand; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.brand', 81, true);


--
-- TOC entry 3167 (class 0 OID 0)
-- Dependencies: 213
-- Name: bseq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bseq', 3, true);


--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 210
-- Name: c; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.c', 43, true);


--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 196
-- Name: car_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.car_seq', 18, true);


--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 218
-- Name: carseq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.carseq', 31, true);


--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 211
-- Name: colorseq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.colorseq', 34, true);


--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 231
-- Name: headquarterseq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.headquarterseq', 5, true);


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 216
-- Name: model; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.model', 1029, true);


--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 227
-- Name: notificationseq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notificationseq', 117, true);


--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 225
-- Name: ratingseq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ratingseq', 94, true);


--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 197
-- Name: trip_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trip_seq', 5, true);


--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 220
-- Name: tripseq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tripseq', 91, true);


--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 229
-- Name: triptrashseq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.triptrashseq', 20, true);


--
-- TOC entry 2973 (class 2606 OID 229321)
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id_booking);


--
-- TOC entry 2965 (class 2606 OID 229158)
-- Name: car_brand car_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.car_brand
    ADD CONSTRAINT car_brand_pkey PRIMARY KEY (id_car_brand);


--
-- TOC entry 2967 (class 2606 OID 229172)
-- Name: car_model car_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.car_model
    ADD CONSTRAINT car_model_pkey PRIMARY KEY (id_car_model);


--
-- TOC entry 2969 (class 2606 OID 229275)
-- Name: car car_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (id_car);


--
-- TOC entry 2963 (class 2606 OID 227820)
-- Name: color color_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT color_pkey PRIMARY KEY (id_color);


--
-- TOC entry 2981 (class 2606 OID 264530)
-- Name: headquarter headquarter_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.headquarter
    ADD CONSTRAINT headquarter_pkey PRIMARY KEY (id_headquarter);


--
-- TOC entry 2977 (class 2606 OID 263178)
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id_notification);


--
-- TOC entry 2975 (class 2606 OID 262363)
-- Name: rating rating_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (id_rating);


--
-- TOC entry 2950 (class 2606 OID 208638)
-- Name: tuser sys_pk_10092; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser
    ADD CONSTRAINT sys_pk_10092 PRIMARY KEY (user_);


--
-- TOC entry 2939 (class 2606 OID 208598)
-- Name: trole sys_pk_10096; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole
    ADD CONSTRAINT sys_pk_10096 PRIMARY KEY (id_rolename);


--
-- TOC entry 2958 (class 2606 OID 208661)
-- Name: tuser_role sys_pk_10100; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT sys_pk_10100 PRIMARY KEY (id_user_role);


--
-- TOC entry 2947 (class 2606 OID 208617)
-- Name: tserver_permission sys_pk_10108; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tserver_permission
    ADD CONSTRAINT sys_pk_10108 PRIMARY KEY (id_server_permission);


--
-- TOC entry 2936 (class 2606 OID 208588)
-- Name: trequest_statistics sys_pk_10112; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequest_statistics
    ADD CONSTRAINT sys_pk_10112 PRIMARY KEY (id_request_statistics);


--
-- TOC entry 2961 (class 2606 OID 208797)
-- Name: tsetting sys_pk_10116; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tsetting
    ADD CONSTRAINT sys_pk_10116 PRIMARY KEY (id_setting);


--
-- TOC entry 2953 (class 2606 OID 208648)
-- Name: tuser_preference sys_pk_10120; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_preference
    ADD CONSTRAINT sys_pk_10120 PRIMARY KEY (id_user_preference);


--
-- TOC entry 2930 (class 2606 OID 208512)
-- Name: ti18n sys_pk_10124; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n
    ADD CONSTRAINT sys_pk_10124 PRIMARY KEY (id_i18n);


--
-- TOC entry 2933 (class 2606 OID 208549)
-- Name: ti18n_value sys_pk_10128; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n_value
    ADD CONSTRAINT sys_pk_10128 PRIMARY KEY (id_i18n_value);


--
-- TOC entry 2944 (class 2606 OID 208605)
-- Name: trole_server_permission sys_pk_10134; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT sys_pk_10134 PRIMARY KEY (id_role_server_permission);


--
-- TOC entry 2971 (class 2606 OID 229303)
-- Name: trip trip_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_pkey PRIMARY KEY (id_trip);


--
-- TOC entry 2979 (class 2606 OID 263645)
-- Name: trip_historical trip_trash_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trip_historical
    ADD CONSTRAINT trip_trash_pkey PRIMARY KEY (id_trip_historical);


--
-- TOC entry 2954 (class 1259 OID 208662)
-- Name: sys_idx_10103; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sys_idx_10103 ON public.tuser_role USING btree (user_);


--
-- TOC entry 2955 (class 1259 OID 208663)
-- Name: sys_idx_10105; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sys_idx_10105 ON public.tuser_role USING btree (id_rolename);


--
-- TOC entry 2940 (class 1259 OID 208606)
-- Name: sys_idx_10137; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sys_idx_10137 ON public.trole_server_permission USING btree (id_rolename);


--
-- TOC entry 2941 (class 1259 OID 208607)
-- Name: sys_idx_10139; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sys_idx_10139 ON public.trole_server_permission USING btree (id_server_permission);


--
-- TOC entry 2948 (class 1259 OID 208639)
-- Name: sys_idx_sys_pk_10092_10093; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10092_10093 ON public.tuser USING btree (user_);


--
-- TOC entry 2937 (class 1259 OID 208599)
-- Name: sys_idx_sys_pk_10096_10097; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10096_10097 ON public.trole USING btree (id_rolename);


--
-- TOC entry 2956 (class 1259 OID 208664)
-- Name: sys_idx_sys_pk_10100_10101; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10100_10101 ON public.tuser_role USING btree (id_user_role);


--
-- TOC entry 2945 (class 1259 OID 208618)
-- Name: sys_idx_sys_pk_10108_10109; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10108_10109 ON public.tserver_permission USING btree (id_server_permission);


--
-- TOC entry 2934 (class 1259 OID 208589)
-- Name: sys_idx_sys_pk_10112_10113; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10112_10113 ON public.trequest_statistics USING btree (id_request_statistics);


--
-- TOC entry 2959 (class 1259 OID 208798)
-- Name: sys_idx_sys_pk_10116_10117; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10116_10117 ON public.tsetting USING btree (id_setting);


--
-- TOC entry 2951 (class 1259 OID 208649)
-- Name: sys_idx_sys_pk_10120_10121; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10120_10121 ON public.tuser_preference USING btree (id_user_preference);


--
-- TOC entry 2928 (class 1259 OID 208513)
-- Name: sys_idx_sys_pk_10124_10125; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10124_10125 ON public.ti18n USING btree (id_i18n);


--
-- TOC entry 2931 (class 1259 OID 208557)
-- Name: sys_idx_sys_pk_10128_10130; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10128_10130 ON public.ti18n_value USING btree (id_i18n_value);


--
-- TOC entry 2942 (class 1259 OID 208608)
-- Name: sys_idx_sys_pk_10134_10135; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10134_10135 ON public.trole_server_permission USING btree (id_role_server_permission);


--
-- TOC entry 2992 (class 2606 OID 263628)
-- Name: booking booking_id_trip_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_id_trip_fkey FOREIGN KEY (id_trip) REFERENCES public.trip(id_trip) ON DELETE CASCADE;


--
-- TOC entry 2991 (class 2606 OID 229327)
-- Name: booking booking_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.tuser(user_);


--
-- TOC entry 2987 (class 2606 OID 229286)
-- Name: car car_id_car_brand_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_id_car_brand_fkey FOREIGN KEY (id_car_brand) REFERENCES public.car_brand(id_car_brand);


--
-- TOC entry 2988 (class 2606 OID 229291)
-- Name: car car_id_car_model_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_id_car_model_fkey FOREIGN KEY (id_car_model) REFERENCES public.car_model(id_car_model);


--
-- TOC entry 2986 (class 2606 OID 229281)
-- Name: car car_id_color_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_id_color_fkey FOREIGN KEY (id_color) REFERENCES public.color(id_color);


--
-- TOC entry 2985 (class 2606 OID 229276)
-- Name: car car_id_tuser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_id_tuser_fkey FOREIGN KEY (id_user) REFERENCES public.tuser(user_);


--
-- TOC entry 2984 (class 2606 OID 229173)
-- Name: car_model car_model_id_car_brand_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.car_model
    ADD CONSTRAINT car_model_id_car_brand_fkey FOREIGN KEY (id_car_brand) REFERENCES public.car_brand(id_car_brand);


--
-- TOC entry 2982 (class 2606 OID 208666)
-- Name: tuser_role fk_trole; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT fk_trole FOREIGN KEY (id_rolename) REFERENCES public.trole(id_rolename);


--
-- TOC entry 2983 (class 2606 OID 208671)
-- Name: tuser_role fk_tuser; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT fk_tuser FOREIGN KEY (user_) REFERENCES public.tuser(user_);


--
-- TOC entry 2993 (class 2606 OID 262364)
-- Name: rating rating_id_booking_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_id_booking_fkey FOREIGN KEY (id_booking) REFERENCES public.booking(id_booking);


--
-- TOC entry 2995 (class 2606 OID 262374)
-- Name: rating rating_id_driver_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_id_driver_fkey FOREIGN KEY (id_driver) REFERENCES public.tuser(user_);


--
-- TOC entry 2994 (class 2606 OID 262369)
-- Name: rating rating_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.tuser(user_);


--
-- TOC entry 2990 (class 2606 OID 229309)
-- Name: trip trip_id_car_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_id_car_fkey FOREIGN KEY (id_car) REFERENCES public.car(id_car);


--
-- TOC entry 2989 (class 2606 OID 229304)
-- Name: trip trip_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.tuser(user_);


-- Completed on 2023-07-27 12:56:51

--
-- PostgreSQL database dump complete
--

