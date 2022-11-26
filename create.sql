--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4 (Debian 13.4-2)
-- Dumped by pg_dump version 13.4 (Debian 13.4-2)

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
-- Name: baker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baker (
    bname character varying NOT NULL,
    address character varying NOT NULL
);


ALTER TABLE public.baker OWNER TO postgres;

--
-- Name: belongs_to; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.belongs_to (
    gname character varying NOT NULL,
    gaddress character varying NOT NULL,
    tnumber integer NOT NULL,
    snumber integer NOT NULL,
    councilname character varying NOT NULL
);


ALTER TABLE public.belongs_to OWNER TO postgres;

--
-- Name: contracts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contracts (
    bname character varying NOT NULL,
    councilname character varying NOT NULL
);


ALTER TABLE public.contracts OWNER TO postgres;

--
-- Name: cookie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cookie (
    cookiename character varying NOT NULL
);


ALTER TABLE public.cookie OWNER TO postgres;

--
-- Name: council; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.council (
    councilname character varying NOT NULL
);


ALTER TABLE public.council OWNER TO postgres;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customername character varying NOT NULL,
    customeraddress character varying NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: date; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.date (
    date date NOT NULL
);


ALTER TABLE public.date OWNER TO postgres;

--
-- Name: girl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.girl (
    gname character varying NOT NULL,
    gaddress character varying NOT NULL,
    grank character varying NOT NULL,
    tnumber integer NOT NULL
);


ALTER TABLE public.girl OWNER TO postgres;

--
-- Name: individual_sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.individual_sales (
    iqty numeric NOT NULL,
    date date NOT NULL,
    customername character varying NOT NULL,
    customeraddress character varying NOT NULL,
    gname character varying NOT NULL,
    gaddress character varying NOT NULL
);


ALTER TABLE public.individual_sales OWNER TO postgres;

--
-- Name: leader; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leader (
    lname character varying NOT NULL,
    laddress character varying NOT NULL,
    tnumber integer NOT NULL
);


ALTER TABLE public.leader OWNER TO postgres;

--
-- Name: offers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offers (
    bname character varying NOT NULL,
    cookiename character varying NOT NULL
);


ALTER TABLE public.offers OWNER TO postgres;

--
-- Name: sells_for; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sells_for (
    price numeric NOT NULL,
    cookiename character varying NOT NULL,
    councilname character varying NOT NULL
);


ALTER TABLE public.sells_for OWNER TO postgres;

--
-- Name: service_unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_unit (
    snumber numeric NOT NULL,
    sname character varying NOT NULL,
    councilname character varying NOT NULL
);


ALTER TABLE public.service_unit OWNER TO postgres;

--
-- Name: shop_sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_sales (
    sqty numeric NOT NULL,
    cookiename character varying NOT NULL,
    date date NOT NULL,
    tnumber integer NOT NULL
);


ALTER TABLE public.shop_sales OWNER TO postgres;

--
-- Name: troop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.troop (
    tnumber numeric NOT NULL,
    snumber integer NOT NULL
);


ALTER TABLE public.troop OWNER TO postgres;

--
-- Data for Name: baker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.baker (bname, address) FROM stdin;
\.


--
-- Data for Name: belongs_to; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.belongs_to (gname, gaddress, tnumber, snumber, councilname) FROM stdin;
\.


--
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contracts (bname, councilname) FROM stdin;
\.


--
-- Data for Name: cookie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cookie (cookiename) FROM stdin;
\.


--
-- Data for Name: council; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.council (councilname) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customername, customeraddress) FROM stdin;
\.


--
-- Data for Name: date; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.date (date) FROM stdin;
\.


--
-- Data for Name: girl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.girl (gname, gaddress, grank, tnumber) FROM stdin;
\.


--
-- Data for Name: individual_sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.individual_sales (iqty, date, customername, customeraddress, gname, gaddress) FROM stdin;
\.


--
-- Data for Name: leader; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leader (lname, laddress, tnumber) FROM stdin;
\.


--
-- Data for Name: offers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offers (bname, cookiename) FROM stdin;
\.


--
-- Data for Name: sells_for; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sells_for (price, cookiename, councilname) FROM stdin;
\.


--
-- Data for Name: service_unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_unit (snumber, sname, councilname) FROM stdin;
\.


--
-- Data for Name: shop_sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_sales (sqty, cookiename, date, tnumber) FROM stdin;
\.


--
-- Data for Name: troop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.troop (tnumber, snumber) FROM stdin;
\.


--
-- Name: baker baker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baker
    ADD CONSTRAINT baker_pkey PRIMARY KEY (bname);


--
-- Name: cookie cookie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cookie
    ADD CONSTRAINT cookie_pkey PRIMARY KEY (cookiename);


--
-- Name: council council_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.council
    ADD CONSTRAINT council_pkey PRIMARY KEY (councilname);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customername, customeraddress);


--
-- Name: date date_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.date
    ADD CONSTRAINT date_pkey PRIMARY KEY (date);


--
-- Name: girl girl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.girl
    ADD CONSTRAINT girl_pkey PRIMARY KEY (gname, gaddress);


--
-- Name: leader leader_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leader
    ADD CONSTRAINT leader_pkey PRIMARY KEY (lname, laddress);


--
-- Name: service_unit service_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_unit
    ADD CONSTRAINT service_unit_pkey PRIMARY KEY (snumber);


--
-- Name: troop troop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.troop
    ADD CONSTRAINT troop_pkey PRIMARY KEY (tnumber);


--
-- Name: belongs_to belongs_to_councilname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.belongs_to
    ADD CONSTRAINT belongs_to_councilname_fkey FOREIGN KEY (councilname) REFERENCES public.council(councilname) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: belongs_to belongs_to_gname_gaddress_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.belongs_to
    ADD CONSTRAINT belongs_to_gname_gaddress_fkey FOREIGN KEY (gname, gaddress) REFERENCES public.girl(gname, gaddress) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: belongs_to belongs_to_snumber_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.belongs_to
    ADD CONSTRAINT belongs_to_snumber_fkey FOREIGN KEY (snumber) REFERENCES public.service_unit(snumber) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: belongs_to belongs_to_tnumber_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.belongs_to
    ADD CONSTRAINT belongs_to_tnumber_fkey FOREIGN KEY (tnumber) REFERENCES public.troop(tnumber) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contracts contracts_bname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_bname_fkey FOREIGN KEY (bname) REFERENCES public.baker(bname) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contracts contracts_councilname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_councilname_fkey FOREIGN KEY (councilname) REFERENCES public.council(councilname) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: girl girl_tnumber_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.girl
    ADD CONSTRAINT girl_tnumber_fkey FOREIGN KEY (tnumber) REFERENCES public.troop(tnumber) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: individual_sales individual_sales_customername_customeraddress_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_sales
    ADD CONSTRAINT individual_sales_customername_customeraddress_fkey FOREIGN KEY (customername, customeraddress) REFERENCES public.customer(customername, customeraddress) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: individual_sales individual_sales_date_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_sales
    ADD CONSTRAINT individual_sales_date_fkey FOREIGN KEY (date) REFERENCES public.date(date) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: individual_sales individual_sales_gname_gaddress_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_sales
    ADD CONSTRAINT individual_sales_gname_gaddress_fkey FOREIGN KEY (gname, gaddress) REFERENCES public.girl(gname, gaddress) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: leader leader_tnumber_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leader
    ADD CONSTRAINT leader_tnumber_fkey FOREIGN KEY (tnumber) REFERENCES public.troop(tnumber) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offers offers_bname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_bname_fkey FOREIGN KEY (bname) REFERENCES public.baker(bname) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offers offers_cookiename_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_cookiename_fkey FOREIGN KEY (cookiename) REFERENCES public.cookie(cookiename) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sells_for sells_for_cookiename_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sells_for
    ADD CONSTRAINT sells_for_cookiename_fkey FOREIGN KEY (cookiename) REFERENCES public.cookie(cookiename) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sells_for sells_for_councilname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sells_for
    ADD CONSTRAINT sells_for_councilname_fkey FOREIGN KEY (councilname) REFERENCES public.council(councilname) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: service_unit service_unit_councilname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_unit
    ADD CONSTRAINT service_unit_councilname_fkey FOREIGN KEY (councilname) REFERENCES public.council(councilname) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_sales shop_sales_cookiename_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_sales
    ADD CONSTRAINT shop_sales_cookiename_fkey FOREIGN KEY (cookiename) REFERENCES public.cookie(cookiename) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_sales shop_sales_date_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_sales
    ADD CONSTRAINT shop_sales_date_fkey FOREIGN KEY (date) REFERENCES public.date(date) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_sales shop_sales_tnumber_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_sales
    ADD CONSTRAINT shop_sales_tnumber_fkey FOREIGN KEY (tnumber) REFERENCES public.troop(tnumber) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: troop troop_snumber_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.troop
    ADD CONSTRAINT troop_snumber_fkey FOREIGN KEY (snumber) REFERENCES public.service_unit(snumber) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

