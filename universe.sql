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
    name character varying(255) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    galaxy_type character varying(50),
    distance_from_earth numeric(10,2) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    has_atmosphere boolean,
    distance_from_planet numeric(10,2) NOT NULL,
    planet_id integer,
    age_in_millions_of_years integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_inhabited boolean NOT NULL,
    distance_from_star numeric(10,2) NOT NULL,
    star_id integer,
    planet_type character varying(50)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mass integer NOT NULL,
    is_spherical boolean,
    galaxy_id integer,
    age_in_millions_of_years integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_property; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_property (
    star_property_id integer NOT NULL,
    star_id integer,
    name character varying(255) NOT NULL,
    temperature integer NOT NULL,
    luminosity integer,
    has_magnetic_field boolean
);


ALTER TABLE public.star_property OWNER TO freecodecamp;

--
-- Name: star_property_star_property_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_property_star_property_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_property_star_property_id_seq OWNER TO freecodecamp;

--
-- Name: star_property_star_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_property_star_property_id_seq OWNED BY public.star_property.star_property_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_property star_property_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_property ALTER COLUMN star_property_id SET DEFAULT nextval('public.star_property_star_property_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', true, 'Spiral', 30000.45);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest to Milky Way', false, 'Spiral', 250000.89);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in Local Group', false, 'Irregular', 300000.67);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Known for its bright nucleus and large central bulge', false, 'Spiral', 28000.12);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Interacting with smaller galaxy NGC 5195', false, 'Spiral', 31000.76);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Visible face-on spiral galaxy', false, 'Spiral', 35000.23);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', false, 0.38, 1, 4500);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 9.38, 2, 4);
INSERT INTO public.moon VALUES (3, 'Europa', false, 671.00, 3, 100);
INSERT INTO public.moon VALUES (4, 'Titan', true, 1221.00, 4, 4500);
INSERT INTO public.moon VALUES (5, 'Callisto', false, 1883.00, 5, 4000);
INSERT INTO public.moon VALUES (6, 'Io', true, 421.00, 3, 100);
INSERT INTO public.moon VALUES (7, 'Ganymede', false, 1070.00, 5, 4000);
INSERT INTO public.moon VALUES (8, 'Enceladus', true, 238.00, 4, 100);
INSERT INTO public.moon VALUES (9, 'Triton', true, 355.00, 6, 4500);
INSERT INTO public.moon VALUES (10, 'Charon', false, 19571.00, 8, 4500);
INSERT INTO public.moon VALUES (11, 'Dione', false, 377.00, 7, 100);
INSERT INTO public.moon VALUES (12, 'Oberon', false, 583.00, 9, 4000);
INSERT INTO public.moon VALUES (13, 'Ariel', false, 191.00, 9, 4000);
INSERT INTO public.moon VALUES (14, 'Rhea', false, 527.00, 7, 100);
INSERT INTO public.moon VALUES (15, 'Tethys', false, 294.00, 7, 100);
INSERT INTO public.moon VALUES (16, 'Iapetus', false, 3561.00, 7, 100);
INSERT INTO public.moon VALUES (17, 'Miranda', false, 130.00, 8, 4000);
INSERT INTO public.moon VALUES (18, 'Proteus', false, 117.00, 7, 100);
INSERT INTO public.moon VALUES (19, 'Umbriel', false, 266.00, 9, 4000);
INSERT INTO public.moon VALUES (20, 'Nereid', false, 5513.00, 10, 4000);
INSERT INTO public.moon VALUES (21, 'Triton 2', false, 355.00, 6, 4500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 93.00, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Mars', false, 142.00, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Jupiter', false, 484.00, 1, 'Gas Giant');
INSERT INTO public.planet VALUES (4, 'Saturn', false, 886.00, 1, 'Gas Giant');
INSERT INTO public.planet VALUES (5, 'Venus', false, 67.00, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (6, 'Neptune', false, 4500.00, 1, 'Ice Giant');
INSERT INTO public.planet VALUES (7, 'Mercury', false, 36.00, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (8, 'Uranus', false, 1784.00, 1, 'Ice Giant');
INSERT INTO public.planet VALUES (9, 'Kepler-186f', true, 490.00, 4, 'Terrestrial');
INSERT INTO public.planet VALUES (10, 'Gliese 581g', true, 20.00, 5, 'Terrestrial');
INSERT INTO public.planet VALUES (11, 'HD 209458 b', false, 150.00, 3, 'Gas Giant');
INSERT INTO public.planet VALUES (12, 'TrES-2b', false, 1700.00, 2, 'Hot Jupiter');
INSERT INTO public.planet VALUES (13, 'WASP-121b', false, 900.00, 2, 'Hot Jupiter');
INSERT INTO public.planet VALUES (14, 'PSR B1620-26 b', false, 12000.00, 1, 'Gas Giant');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1989000, true, 1, 4600);
INSERT INTO public.star VALUES (2, 'Sirius', 2, true, 1, 200);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 20, false, 1, 800);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, true, 2, 6000);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 1, true, 2, 6000);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 0, false, 2, 6000);
INSERT INTO public.star VALUES (7, 'Antares', 15, false, 1, 1200);
INSERT INTO public.star VALUES (8, 'Vega', 2, true, 1, 500);
INSERT INTO public.star VALUES (9, 'Arcturus', 2, false, 1, 1000);
INSERT INTO public.star VALUES (10, 'Pollux', 2, true, 1, 900);
INSERT INTO public.star VALUES (11, 'Aldebaran', 2, false, 1, 625);
INSERT INTO public.star VALUES (12, 'Rigel', 21, false, 1, 8);


--
-- Data for Name: star_property; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_property VALUES (1, 1, 'Sun', 5778, 1, true);
INSERT INTO public.star_property VALUES (2, 2, 'Sirius', 9940, 25, true);
INSERT INTO public.star_property VALUES (3, 3, 'Betelgeuse', 3590, 65000, false);
INSERT INTO public.star_property VALUES (4, 4, 'Alpha Centauri A', 5790, 1, false);
INSERT INTO public.star_property VALUES (5, 5, 'Alpha Centauri B', 15770, 33000, true);
INSERT INTO public.star_property VALUES (6, 6, 'Proxima Centauri', 5530, 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_property_star_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_property_star_property_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_property star_property_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_property
    ADD CONSTRAINT star_property_name_key UNIQUE (name);


--
-- Name: star_property star_property_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_property
    ADD CONSTRAINT star_property_pkey PRIMARY KEY (star_property_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star_property star_property_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_property
    ADD CONSTRAINT star_property_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

