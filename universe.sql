--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(40) NOT NULL,
    description character varying(60),
    age_in_millions_of_years integer,
    galaxytype_id integer NOT NULL
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
-- Name: galaxytype; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxytype (
    galaxytype_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(40)
);


ALTER TABLE public.galaxytype OWNER TO freecodecamp;

--
-- Name: galaxytype_galaxytype_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxytype_galaxytype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxytype_galaxytype_id_seq OWNER TO freecodecamp;

--
-- Name: galaxytype_galaxytype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxytype_galaxytype_id_seq OWNED BY public.galaxytype.galaxytype_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    is_spherical boolean NOT NULL,
    description character varying(150),
    planet_id integer
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
    name character varying(40) NOT NULL,
    has_life boolean NOT NULL,
    description character varying(150),
    star_id integer,
    planettypes_id integer NOT NULL
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
-- Name: planettypes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planettypes (
    planettypes_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(40)
);


ALTER TABLE public.planettypes OWNER TO freecodecamp;

--
-- Name: planettypes_planettypes_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planettypes_planettypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planettypes_planettypes_id_seq OWNER TO freecodecamp;

--
-- Name: planettypes_planettypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planettypes_planettypes_id_seq OWNED BY public.planettypes.planettypes_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(60),
    fact_about_it text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(17,2),
    galaxy_id integer
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
-- Name: galaxytype galaxytype_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxytype ALTER COLUMN galaxytype_id SET DEFAULT nextval('public.galaxytype_galaxytype_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planettypes planettypes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planettypes ALTER COLUMN planettypes_id SET DEFAULT nextval('public.planettypes_planettypes_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing our Solar System', 13000, 2);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest large galaxy to the Milky Way', 2500, 2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small spiral galaxy located in the Local Group', 4500, 2);
INSERT INTO public.galaxy VALUES (4, 'Hoag''s Object', 'A rare ring galaxy located 600 million light-years away', 3300, 1);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', 'A ring galaxy located 500 million light-years away', 2000, 1);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A supergiant elliptical galaxy in the constellation Virgo', 13000, 3);
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way', 1380, 4);
INSERT INTO public.galaxy VALUES (8, 'Small Magellanic Cloud', 'A satellite galaxy of the Milky Way', 1970, 5);


--
-- Data for Name: galaxytype; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxytype VALUES (1, 'Elliptical galaxies', NULL);
INSERT INTO public.galaxytype VALUES (2, 'Spiral galaxies', NULL);
INSERT INTO public.galaxytype VALUES (3, 'Barred spiral galaxies', NULL);
INSERT INTO public.galaxytype VALUES (4, 'Irregular galaxies', NULL);
INSERT INTO public.galaxytype VALUES (5, 'Lenticular galaxies', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, 'Earth''s moon', 1);
INSERT INTO public.moon VALUES (2, 'Charon', true, 'Pluto''s moon', 4);
INSERT INTO public.moon VALUES (3, 'Mond', true, 'Deutsch for Moon', 2);
INSERT INTO public.moon VALUES (4, 'Triton', true, 'The seventh-largest moon in the Solar System and the only one known to have a surface made mainly of nitrogen ice.', 3);
INSERT INTO public.moon VALUES (5, 'Proteus', true, 'Proteus is the largest irregularly shaped moon of Neptune.', 3);
INSERT INTO public.moon VALUES (6, 'Titan', true, 'Saturn''s moon', 6);
INSERT INTO public.moon VALUES (7, 'Enceladus', true, 'Saturn''s moon', 6);
INSERT INTO public.moon VALUES (8, 'Mimas', true, 'Saturn''s moon', 6);
INSERT INTO public.moon VALUES (9, 'Rhea', true, 'Saturn''s moon', 6);
INSERT INTO public.moon VALUES (10, 'Dione', true, 'Saturn''s moon', 6);
INSERT INTO public.moon VALUES (11, 'Tethys', true, 'Saturn''s moon', 6);
INSERT INTO public.moon VALUES (12, 'Ganymede', true, 'Jupiter''s moon', 2);
INSERT INTO public.moon VALUES (13, 'Europa', true, 'Jupiter''s moon', 2);
INSERT INTO public.moon VALUES (14, 'Io', true, 'Jupiter''s moon', 2);
INSERT INTO public.moon VALUES (15, 'Thebe', true, 'Jupiter''s moon', 2);
INSERT INTO public.moon VALUES (16, 'Amalthea', true, 'Jupiter''s moon', 2);
INSERT INTO public.moon VALUES (17, 'Adrastea', true, 'Jupiter''s moon', 2);
INSERT INTO public.moon VALUES (18, 'Callisto', true, 'Jupiter''s moon', 2);
INSERT INTO public.moon VALUES (19, 'Ananke', true, 'Jupiter''s moon', 2);
INSERT INTO public.moon VALUES (20, 'Metis', true, 'Jupiter''s moon', 2);
INSERT INTO public.moon VALUES (21, 'Himalia', true, 'Jupiter''s moon', 2);
INSERT INTO public.moon VALUES (22, 'Pasiphae', true, 'Jupiter''s moon', 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'The third planet from the Sun and the only astronomical object known to harbor and support life.', 1, 1);
INSERT INTO public.planet VALUES (2, 'Jupiter', false, 'The largest planet in our solar system.', 2, 2);
INSERT INTO public.planet VALUES (3, 'Neptune', false, 'The farthest planet from the Sun and the fourth-largest planet by diameter.', 3, 3);
INSERT INTO public.planet VALUES (4, 'Pluto', false, 'A dwarf planet in our solar system.', 4, 4);
INSERT INTO public.planet VALUES (5, 'Proxima Centauri b', true, 'An exoplanet orbiting the closest star to our solar system, Proxima Centauri.', 5, 5);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'A gas giant with beautiful rings', 1, 2);
INSERT INTO public.planet VALUES (7, 'Mars', false, 'The fourth planet from the Sun and the second-smallest planet in our solar system.', 1, 2);
INSERT INTO public.planet VALUES (8, 'Venus', false, 'The second planet from the Sun and the hottest planet in our solar system.', 1, 2);
INSERT INTO public.planet VALUES (9, 'Uranus', false, 'The seventh planet from the Sun and the third-largest planet in our solar system.', 3, 3);
INSERT INTO public.planet VALUES (10, 'Haumea', false, 'A dwarf planet located beyond Neptune.', 4, 4);
INSERT INTO public.planet VALUES (11, 'Kepler-438b', true, 'An exoplanet orbiting within the habitable zone of the star Kepler-438, located approximately 640 light-years from Earth.', 5, 5);
INSERT INTO public.planet VALUES (12, 'Mercury', false, 'The smallest planet in our solar system and the closest planet to the Sun.', 1, 2);


--
-- Data for Name: planettypes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planettypes VALUES (1, 'Terrestrial planets', NULL);
INSERT INTO public.planettypes VALUES (2, 'Gas giants', NULL);
INSERT INTO public.planettypes VALUES (3, 'Ice giants', NULL);
INSERT INTO public.planettypes VALUES (4, 'Dwarf planets', NULL);
INSERT INTO public.planettypes VALUES (5, 'Exoplanets', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Brightest star in the night sky', 'Sirius is a binary star system', 250, 8.60, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red supergiant in the constellation Orion', 'Betelgeuse will eventually explode as a supernova', 8, 642.50, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Closest star to the Sun', 'Proxima Centauri has an Earth-sized planet in its habitable zone', 5, 4.20, 2);
INSERT INTO public.star VALUES (4, 'Polaris', 'North Star in the constellation Ursa Minor', 'Polaris is actually a triple star system', 70, 433.80, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'Closest star system to the Sun', 'Alpha Centauri A is slightly larger and brighter than the Sun', 7, 4.40, 2);
INSERT INTO public.star VALUES (6, 'Sun', 'The closest star to Earth', 'It is a main-sequence star', 4600, 8.30, 1);
INSERT INTO public.star VALUES (7, 'Vega', 'Famous for being one of the brightest stars in the sky', 'Vega is the fifth brightest star in the sky and is located in the constellation Lyra', 455, 25.04, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxytype_galaxytype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxytype_galaxytype_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planettypes_planettypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planettypes_planettypes_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxytype galaxytype_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxytype
    ADD CONSTRAINT galaxytype_name_key UNIQUE (name);


--
-- Name: galaxy pk_galaxy_galaxyid; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT pk_galaxy_galaxyid PRIMARY KEY (galaxy_id);


--
-- Name: galaxytype pk_galaxytype_galaxytypeid; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxytype
    ADD CONSTRAINT pk_galaxytype_galaxytypeid PRIMARY KEY (galaxytype_id);


--
-- Name: moon pk_moon_moonid; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT pk_moon_moonid PRIMARY KEY (moon_id);


--
-- Name: planet pk_planet_planetid; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT pk_planet_planetid PRIMARY KEY (planet_id);


--
-- Name: planettypes pk_planettypes_planettypesid; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planettypes
    ADD CONSTRAINT pk_planettypes_planettypesid PRIMARY KEY (planettypes_id);


--
-- Name: star pk_star_starid; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT pk_star_starid PRIMARY KEY (star_id);


--
-- Name: planettypes planettypes_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planettypes
    ADD CONSTRAINT planettypes_name_key UNIQUE (name);


--
-- Name: galaxy un_gakaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT un_gakaxy_name UNIQUE (name);


--
-- Name: moon un_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT un_moon_name UNIQUE (name);


--
-- Name: planet un_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT un_planet_name UNIQUE (name);


--
-- Name: star un_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT un_star_name UNIQUE (name);


--
-- Name: galaxy fk_galaxytype_galaxytypeid; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxytype_galaxytypeid FOREIGN KEY (galaxytype_id) REFERENCES public.galaxytype(galaxytype_id);


--
-- Name: moon fk_moon_planetid; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planetid FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_starid; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_starid FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet fk_planettypes_planettypesid; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planettypes_planettypesid FOREIGN KEY (planettypes_id) REFERENCES public.planettypes(planettypes_id);


--
-- Name: star fk_star_galaxyid; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxyid FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

