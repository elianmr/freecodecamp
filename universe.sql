--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    distance_from_earth numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: table_first; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.table_first (
    table_first_id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.table_first OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', '', NULL);
INSERT INTO public.galaxy VALUES (2, 'Antennae', '', NULL);
INSERT INTO public.galaxy VALUES (3, 'Backward', '', NULL);
INSERT INTO public.galaxy VALUES (4, 'Barnard', '', NULL);
INSERT INTO public.galaxy VALUES (5, 'Bear Paw', '', NULL);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', '', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon_1', 1);
INSERT INTO public.moon VALUES (2, 'moon_2', 1);
INSERT INTO public.moon VALUES (3, 'moon_3', 1);
INSERT INTO public.moon VALUES (4, 'moon_4', 1);
INSERT INTO public.moon VALUES (5, 'moon_5', 1);
INSERT INTO public.moon VALUES (6, 'moon_6', 1);
INSERT INTO public.moon VALUES (7, 'moon_7', 1);
INSERT INTO public.moon VALUES (8, 'moon_8', 1);
INSERT INTO public.moon VALUES (9, 'moon_9', 1);
INSERT INTO public.moon VALUES (10, 'moon_10', 1);
INSERT INTO public.moon VALUES (11, 'moon_11', 2);
INSERT INTO public.moon VALUES (12, 'moon_12', 2);
INSERT INTO public.moon VALUES (13, 'moon_13', 2);
INSERT INTO public.moon VALUES (14, 'moon_14', 2);
INSERT INTO public.moon VALUES (15, 'moon_15', 2);
INSERT INTO public.moon VALUES (16, 'moon_16', 2);
INSERT INTO public.moon VALUES (17, 'moon_17', 2);
INSERT INTO public.moon VALUES (18, 'moon_18', 2);
INSERT INTO public.moon VALUES (19, 'moon_19', 2);
INSERT INTO public.moon VALUES (20, 'moon_20', 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet_1', 1, NULL);
INSERT INTO public.planet VALUES (2, 'planet_2', 1, NULL);
INSERT INTO public.planet VALUES (3, 'planet_3', 1, NULL);
INSERT INTO public.planet VALUES (4, 'planet_4', 1, NULL);
INSERT INTO public.planet VALUES (5, 'planet_5', 1, NULL);
INSERT INTO public.planet VALUES (6, 'planet_6', 1, NULL);
INSERT INTO public.planet VALUES (7, 'planet_7', 2, NULL);
INSERT INTO public.planet VALUES (8, 'planet_8', 2, NULL);
INSERT INTO public.planet VALUES (9, 'planet_9', 2, NULL);
INSERT INTO public.planet VALUES (10, 'planet_10', 2, NULL);
INSERT INTO public.planet VALUES (11, 'planet_11', 2, NULL);
INSERT INTO public.planet VALUES (12, 'planet_12', 2, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star_1', 1);
INSERT INTO public.star VALUES (2, 'star_2', 2);
INSERT INTO public.star VALUES (3, 'star_3', 3);
INSERT INTO public.star VALUES (4, 'star_4', 4);
INSERT INTO public.star VALUES (5, 'star_5', 5);
INSERT INTO public.star VALUES (6, 'star_6', 6);


--
-- Data for Name: table_first; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: table_first table_first_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.table_first
    ADD CONSTRAINT table_first_pkey PRIMARY KEY (table_first_id);


--
-- Name: star fk_galaxy_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_star FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

