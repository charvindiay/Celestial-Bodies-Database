--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(60) NOT NULL,
    galaxy_type_id integer NOT NULL,
    age_in_millions_of_years numeric(10,2) NOT NULL,
    has_supermassive_black_hole boolean NOT NULL,
    description text
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    orbital_period_days numeric(10,3) NOT NULL,
    is_spherical boolean NOT NULL,
    discovery_year integer
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
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    age_in_millions_of_years numeric(10,2) NOT NULL,
    has_life boolean NOT NULL,
    diameter_km integer NOT NULL,
    description text
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
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_class character varying(2) NOT NULL,
    mass_solar numeric(9,3) NOT NULL,
    is_variable boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 13600.00, true, 'Home galaxy of the Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 10000.00, true, 'The nearest large spiral galaxy.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1, 12000.00, true, 'A smaller spiral in the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 2, 13000.00, true, 'A giant elliptical galaxy in Virgo.');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 3, 13000.00, true, 'A satellite galaxy of the Milky Way.');
INSERT INTO public.galaxy VALUES (6, 'Sculptor Dwarf', 3, 12000.00, false, 'A faint dwarf galaxy near the Milky Way.');


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'A rotating disk with prominent arms.');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'A rounded galaxy with an older stellar population.');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'A galaxy without a settled symmetrical shape.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 3475, 27.322, true, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 0.319, false, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1.263, false, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1.769, true, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 3.551, true, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 7.155, true, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 16.689, true, 1610);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, 0.498, false, 1892);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 170, 250.566, false, 1904);
INSERT INTO public.moon VALUES (10, 'Elara', 5, 86, 259.643, false, 1905);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 396, 0.942, true, 1789);
INSERT INTO public.moon VALUES (12, 'Enceladus', 6, 504, 1.370, true, 1789);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 1062, 1.888, true, 1684);
INSERT INTO public.moon VALUES (14, 'Dione', 6, 1123, 2.737, true, 1684);
INSERT INTO public.moon VALUES (15, 'Rhea', 6, 1527, 4.518, true, 1672);
INSERT INTO public.moon VALUES (16, 'Titan', 6, 5150, 15.945, true, 1655);
INSERT INTO public.moon VALUES (17, 'Hyperion', 6, 270, 21.277, false, 1848);
INSERT INTO public.moon VALUES (18, 'Iapetus', 6, 1469, 79.321, true, 1671);
INSERT INTO public.moon VALUES (19, 'Miranda', 7, 472, 1.413, true, 1948);
INSERT INTO public.moon VALUES (20, 'Ariel', 7, 1158, 2.520, true, 1851);
INSERT INTO public.moon VALUES (21, 'Umbriel', 7, 1169, 4.144, true, 1851);
INSERT INTO public.moon VALUES (22, 'Titania', 7, 1578, 8.706, true, 1787);
INSERT INTO public.moon VALUES (23, 'Oberon', 7, 1523, 13.463, true, 1787);
INSERT INTO public.moon VALUES (24, 'Triton', 8, 2707, 5.877, true, 1846);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 4500.00, false, 4879, 'Small rocky planet closest to the Sun.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 4500.00, false, 12104, 'Dense atmosphere and intense surface heat.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 4540.00, true, 12742, 'An ocean-rich world with known life.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 4500.00, false, 6779, 'A cold desert world with ancient river valleys.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas giant', 4500.00, false, 139820, 'The largest planet in the Solar System.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant', 4500.00, false, 116460, 'A gas giant surrounded by brilliant rings.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant', 4500.00, false, 50724, 'An ice giant that rotates on its side.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice giant', 4500.00, false, 49244, 'A distant world with supersonic winds.');
INSERT INTO public.planet VALUES (9, 'Sirius b', 2, 'White dwarf', 242.00, false, 12000, 'A compact stellar remnant orbiting Sirius.');
INSERT INTO public.planet VALUES (10, 'Proxima b', 3, 'Terrestrial', 4.80, false, 12000, 'A temperate-zone exoplanet candidate.');
INSERT INTO public.planet VALUES (11, 'Vega Prime', 4, 'Terrestrial', 455.00, false, 14000, 'A fictional rocky world orbiting Vega.');
INSERT INTO public.planet VALUES (12, 'Mirach Minor', 7, 'Ice giant', 6000.00, false, 58000, 'A fictional ice giant in Andromeda.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G', 1.000, false);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A', 2.063, false);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'M', 0.122, true);
INSERT INTO public.star VALUES (4, 'Vega', 1, 'A', 2.135, false);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 'M', 16.500, true);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 'B', 21.000, false);
INSERT INTO public.star VALUES (7, 'Mirach', 2, 'M', 1.700, true);
INSERT INTO public.star VALUES (8, 'Triangulum Star A', 3, 'F', 1.300, false);
INSERT INTO public.star VALUES (9, 'M87 Core Star', 4, 'O', 30.000, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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
-- PostgreSQL database dump complete
--

