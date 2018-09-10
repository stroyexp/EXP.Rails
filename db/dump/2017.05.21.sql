--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    namespace character varying,
    body text,
    resource_type character varying,
    resource_id integer,
    author_type character varying,
    author_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE active_admin_comments OWNER TO dev;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_admin_comments_id_seq OWNER TO dev;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: activities; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE activities (
    id integer NOT NULL,
    published boolean DEFAULT false,
    navigated boolean DEFAULT false,
    header character varying NOT NULL,
    label character varying,
    content text NOT NULL,
    title character varying,
    keywords character varying,
    description character varying,
    canonical character varying,
    robots character varying,
    index integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ancestry character varying,
    ancestry_depth integer DEFAULT 0
);


ALTER TABLE activities OWNER TO dev;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activities_id_seq OWNER TO dev;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO dev;

--
-- Name: areas; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE areas (
    id integer NOT NULL,
    active boolean DEFAULT false,
    name character varying NOT NULL,
    index integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE areas OWNER TO dev;

--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE areas_id_seq OWNER TO dev;

--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE areas_id_seq OWNED BY areas.id;


--
-- Name: areas_throughs; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE areas_throughs (
    id integer NOT NULL,
    resource_type character varying,
    resource_id integer,
    area_id integer
);


ALTER TABLE areas_throughs OWNER TO dev;

--
-- Name: areas_throughs_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE areas_throughs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE areas_throughs_id_seq OWNER TO dev;

--
-- Name: areas_throughs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE areas_throughs_id_seq OWNED BY areas_throughs.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE articles (
    id integer NOT NULL,
    published boolean DEFAULT false,
    published_at date,
    header character varying NOT NULL,
    annotation text,
    content text NOT NULL,
    upload character varying,
    title character varying,
    keywords character varying,
    description character varying,
    canonical character varying,
    robots character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE articles OWNER TO dev;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE articles_id_seq OWNER TO dev;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE customers (
    id integer NOT NULL,
    active boolean DEFAULT false,
    published boolean DEFAULT false,
    name character varying NOT NULL,
    content text,
    email character varying,
    phone character varying,
    address character varying,
    geo character varying,
    website character varying,
    upload character varying,
    title character varying,
    keywords character varying,
    description character varying,
    canonical character varying,
    robots character varying,
    index integer DEFAULT 0,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE customers OWNER TO dev;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_id_seq OWNER TO dev;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE feedbacks (
    id integer NOT NULL,
    published boolean DEFAULT false,
    published_at date,
    header character varying NOT NULL,
    content text,
    upload character varying,
    title character varying,
    keywords character varying,
    description character varying,
    canonical character varying,
    robots character varying,
    source character varying,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE feedbacks OWNER TO dev;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE feedbacks_id_seq OWNER TO dev;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE feedbacks_id_seq OWNED BY feedbacks.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE images (
    id integer NOT NULL,
    title character varying,
    description character varying,
    alt character varying,
    upload character varying NOT NULL,
    upload_crop boolean DEFAULT false,
    index integer DEFAULT 0,
    resource_type character varying,
    resource_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE images OWNER TO dev;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE images_id_seq OWNER TO dev;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- Name: permits; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE permits (
    id integer NOT NULL,
    published boolean DEFAULT false,
    name character varying NOT NULL,
    number character varying NOT NULL,
    provider character varying NOT NULL,
    issue_at date NOT NULL,
    onset_at date,
    ends_at date,
    title character varying,
    keywords character varying,
    description character varying,
    canonical character varying,
    robots character varying,
    index integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE permits OWNER TO dev;

--
-- Name: permits_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE permits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permits_id_seq OWNER TO dev;

--
-- Name: permits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE permits_id_seq OWNED BY permits.id;


--
-- Name: publishes; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE publishes (
    id integer NOT NULL,
    published boolean DEFAULT false,
    published_at date,
    header character varying NOT NULL,
    content text,
    partial character varying,
    title character varying,
    keywords character varying,
    description character varying,
    canonical character varying,
    robots character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE publishes OWNER TO dev;

--
-- Name: publishes_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE publishes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE publishes_id_seq OWNER TO dev;

--
-- Name: publishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE publishes_id_seq OWNED BY publishes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO dev;

--
-- Name: targets; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE targets (
    id integer NOT NULL,
    published boolean DEFAULT false,
    important integer DEFAULT 0,
    start_at date,
    finish_at date,
    name character varying NOT NULL,
    content text,
    address character varying,
    geo character varying,
    website character varying,
    title character varying,
    keywords character varying,
    description character varying,
    canonical character varying,
    robots character varying,
    index integer DEFAULT 0,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE targets OWNER TO dev;

--
-- Name: targets_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE targets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE targets_id_seq OWNER TO dev;

--
-- Name: targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE targets_id_seq OWNED BY targets.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_admin boolean DEFAULT false,
    in_staff boolean DEFAULT false,
    name character varying,
    phone character varying,
    address character varying
);


ALTER TABLE users OWNER TO dev;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO dev;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY areas ALTER COLUMN id SET DEFAULT nextval('areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY areas_throughs ALTER COLUMN id SET DEFAULT nextval('areas_throughs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY feedbacks ALTER COLUMN id SET DEFAULT nextval('feedbacks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY permits ALTER COLUMN id SET DEFAULT nextval('permits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY publishes ALTER COLUMN id SET DEFAULT nextval('publishes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY targets ALTER COLUMN id SET DEFAULT nextval('targets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY active_admin_comments (id, namespace, body, resource_type, resource_id, author_type, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 1, false);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY activities (id, published, navigated, header, label, content, title, keywords, description, canonical, robots, index, created_at, updated_at, ancestry, ancestry_depth) FROM stdin;
10	t	f	Ферроскан Hilti PS - 200 S		<h3>Преимущества:</h3>\r\n\n<ul>\r\n\n    <li>\r\n\n        Большая глубина детекции, четкое изображение результатов сканирования: место расположения, диаметр и глубина\r\n\n        залегания арматуры;\r\n\n    </li>\r\n\n    <li>Позволяет быстро проводить сканирование на больших участках;</li>\r\n\n    <li>Возможность хранения данных в сканере или мониторе, программное обеспечение для подготовки отчетов;</li>\r\n\n    <li>\r\n\n        Эргономичная надежная беспроводная связь между сканером и персональным монитором для условий строительной\r\n\n        площадки;\r\n\n    </li>\r\n\n    <li>Голосовая запись для внесения пометок в монитор;</li>\r\n\n    <li>Высокая степень защиты от воды и грязи.</li>\r\n\n</ul>\r\n\n<h3>Применение:</h3>\r\n\n<ul>\r\n\n    <li>Проверка и анализ арматуры;</li>\r\n\n    <li>\r\n\n        Проверка глубины залегания арматуры и толщины защитного слоя для больших площадей при реконструкции бетонных\r\n\n        конструкций;\r\n\n    </li>\r\n\n    <li>Контроль железобетонных конструкций;</li>\r\n\n    <li>Алмазное бурение без попадания на арматуру;</li>\r\n\n    <li>Алмазное резание без попадания на продольную арматуру.</li>\r\n\n</ul>\r\n\n<h3>Технические характеристики:</h3>\r\n\n<ul>\r\n\n    <li>Максимальная глубина обнаружения чёрных металлов 180 мм (при диаметре арматуры 36 мм);</li>\r\n\n    <li>Точность локализации (относительно центра арматуры) 3 мм;</li>\r\n\n    <li>Максимальная толщина определения защитного слоя бетона 160 мм (при диаметре арматуры 36 мм);</li>\r\n\n    <li>Возможность определения диаметра арматуры на глубине до: 60 мм;</li>\r\n\n    <li>Диапазон диаметров арматуры 6 - 36 мм;</li>\r\n\n    <li>Максимальная скорость сканирования 0.5 м/с;</li>\r\n\n    <li>Обнаруживает Чёрные металлы;</li>\r\n\n    <li>Размеры сканера 260x132x132 мм;</li>\r\n\n    <li>Размеры монитора 264x57x152 мм;</li>\r\n\n    <li>Точность определения глубины (арматура) ±1 мм, в зависимости от глубины залегания и режима скан.</li>\r\n\n</ul>\r\n\n		ферроскан, hilti ps - 200 s				5	2016-07-07 06:42:54.84329	2016-07-07 10:36:07.515793	3	1
11	t	f	Мобильная испытательная лаборатория		<p>Мобильная испытательная лаборатория:</p>\r\n\n		испытательная лаборатория				6	2016-07-07 06:42:54.827987	2016-07-07 10:37:01.839921	3	1
2	t	t	Технический надзор		<p>\r\n\n    Технический надзор (технадзор) в строительстве — это комплекс мер, целью которых является сделать весь процесс\r\n\n    проектных, сметных, инженерных и строительно-монтажных работ с начала проектирования и до окончания строительства\r\n\n    максимально управляемым, прозрачным, и предсказуемым для заказчика. Очень часто можно встретить\r\n\n    <strong>термин контроль смр</strong>(если расшифровать, то получится контроль над строительно-монтажными работами).\r\n\n    Технадзор проводится на каждом этапе – с момента подготовки проекта до сдачи строительного объекта.\r\n\n</p>\r\n\n<p>\r\n\n    Технический надзор в области проектирования, сметных, инженерных и строительно-монтажных работ осуществляется\r\n\n    независимыми инженерами-экспертами в своей области. Заказчик получает от нашей лаборатории четкие рекомендации,\r\n\n    оформленные в виде технических заключений, фото-отчетов и результатов проверок объектов строительства.\r\n\n</p>\r\n\n<p>\r\n\n    Присутствие на строительной площадке нашего специалиста по технадзору гарантирует надлежащий\r\n\n    <strong>контроль строительно-монтажных работ</strong> и высокое качество выполняемых операций. Договор на технадзор\r\n\n    включает в себя проверку правильности составления строительной документации. Это позволит заказчику в случае\r\n\n    возникновения конфликтных ситуаций аргументировать свои претензии по отношению к строителям.\r\n\n</p>\r\n\n<p>Технический надзор не признает мелочей. Оценке подвергается все стадии строительства.</p>\r\n\n<p>\r\n\n    Наши специалисты, выполняющие технадзор в строительстве, смогут сэкономить заказчику затраты времени и средств.\r\n\n    Помогут избежать необоснованно завышенных сроков выполнения строительно-монтажных работ, проследят за качеством и\r\n\n    объемом выполненных работ.\r\n\n</p>\r\n\n<p>\r\n\n    Технический надзор (технадзор) за строительством осуществляется в интересах Заказчика строительства с целью\r\n\n    обеспечения контроля качества строительных работ и имеет целью постоянное проведение оценки соответствия строящегося\r\n\n    объекта требованиям к его безопасности, установленным техническими регламентами, а также нормативными документами и\r\n\n    стандартами, являющимися доказательной базой соблюдения требований технических регламентов и подтверждением\r\n\n    возможности безопасной эксплуатации объекта при последующей передачи его в эксплуатацию.\r\n\n</p>\r\n\n<p>\r\n\n    Технический надзор позволяет отслеживать технологическую последовательность выполнения строительных работ, при\r\n\n    осуществлении функций технического надзора на строительной площадке постоянно находятся инженеры технадзора по\r\n\n    нескольким специальностям.\r\n\n</p>\r\n\n<p>\r\n\n    Технический надзор осуществляется в соответствии с требованиями СНиП 12-01-2009 «Организация строительства» и\r\n\n    предусматривает следующие виды технадзора:\r\n\n</p>\r\n\n<ul>\r\n\n    <li>\r\n\n        Проверка наличия у исполнителя работ документов о качестве (сертификатов в установленных случаях) на применяемые\r\n\n        им материалы, изделия и оборудование, документированных результатов входного контроля смр и лабораторных\r\n\n        испытаний, таким образом инженер технадзора осуществляет контроль качества строительных материалов.\r\n\n    </li>\r\n\n    <li>\r\n\n        Контроль соблюдения исполнителем работ правил складирования и хранения применяемых материалов, изделий и\r\n\n        оборудования; при выявлении нарушений этих правил представитель технадзора может запретить применение\r\n\n        неправильно складированных и хранящихся материалов.\r\n\n    </li>\r\n\n    <li>\r\n\n        При контроле соответствия выполняемой исполнителем работ последовательности и состава выполняемых\r\n\n        технологических операций — технологической и нормативной документации, распространяющейся на данные\r\n\n        технологические операции, технический надзор контролирует соблюдение технологических режимов, установленных\r\n\n        технологическими картами и регламентами, соответствие показателей качества выполнения операций и их результатов\r\n\n        требованиям проектной и технологической документации, а также распространяющейся на данные технологические\r\n\n        операции нормативной документации.\r\n\n    </li>\r\n\n    <li>\r\n\n        Технический надзор контролирует наличие и правильность ведения исполнителем работ исполнительной технической\r\n\n        документации, в том числе оценку достоверности геодезических исполнительных схем выполненных конструкций с\r\n\n        выборочным контролем точности положения конструктивных элементов.\r\n\n    </li>\r\n\n    <li>\r\n\n        Контроль за устранением дефектов в проектной документации, выявленных в процессе строительства,\r\n\n        документированный возврат дефектной документации проектировщику, контроль и документированная приемка\r\n\n        исправленной документации, передача ее исполнителю работ.\r\n\n    </li>\r\n\n    <li>\r\n\n        Контроль исполнения исполнителем работ предписаний органов государственного надзора и местного самоуправления.\r\n\n    </li>\r\n\n    <li>\r\n\n        Извещение органов государственного надзора обо всех случаях аварийного состояния на объекте строительства.\r\n\n    </li>\r\n\n    <li>\r\n\n        Контроль соответствия объемов и сроков выполнения работ условиям договора и календарному плану строительства.\r\n\n    </li>\r\n\n    <li>\r\n\n        Оценку (совместно с исполнителем работ) соответствия выполненных работ, конструкций, участков инженерных сетей,\r\n\n        подписание двухсторонних актов, подтверждающих соответствие; контроль за выполнением исполнителем работ\r\n\n        требования о недопустимости выполнения последующих работ до подписания указанных актов.\r\n\n    </li>\r\n\n    <li>\r\n\n        Заключительную оценку (совместно с исполнителем работ) соответствия законченного строительством объекта\r\n\n        требованиям законодательства, проектной и нормативной документации.\r\n\n    </li>\r\n\n</ul>\r\n\n						1	2016-07-07 06:42:54.74721	2016-07-13 07:20:12.167093	\N	0
3	t	t	Лабораторный контроль		<p>\r\n\n    Лабораторное сопровождение, выполняемое Научно-исследовательским центром «Строительная экспертиза», подразделяется\r\n\n    на два этапа. Первый этап контроля – входной контроль строительных материалов и конструкций. Во время поставки\r\n\n    материалов на строительную площадку нашими специалистами может контролироваться до 50 параметров одновременно.\r\n\n    Прежде всего, это физико-механические свойства, химические и геометрические параметры, а также оценка состояния\r\n\n    конструкций по визуальным признакам. Данный вид контроля позволяет минимизировать риски строительных компаний и\r\n\n    инвесторов еще на ранней стадии, и отбраковать некондиционный материал и конструкции.\r\n\n</p>\r\n\n<p>\r\n\n    Второй тип контроля, но не менее важный, чем первый – текущий. Различные виды и типы измерений, производимые в\r\n\n    процессе возведения зданий и сооружений, являются, бесспорно, наиболее ответственными.\r\n\n</p>\r\n\n<p>\r\n\n    Лабораторный контроль, проводимый в процессе строительства, зачастую выполняется совместно с дефектоскопией и\r\n\n    комплексным обследованием возведенных конструкций, давая тем самым возможность полностью представить состояние\r\n\n    возводимого здания, а также оценить изменения в его жесткости и устойчивости.\r\n\n</p>\r\n\n<p>Одним из преимуществ Научно-исследовательского центра «Строительная экспертиза», является собственная лабораторная\r\n\n   база, оснащенная самым современным комплексом испытательного оборудования.</p>\r\n\n<p>Структура лаборатории НИЦ «Строительная экспертиза» состоит из трех взаимодополняемых подразделений: </p>\r\n\n<ul>\r\n\n    <li>\r\n\n        <a href="/activities/10"><strong>Лабораторная база</strong></a> &mdash;\r\n\n        являющейся обязательным элементом любой лаборатории занимающейся испытанием строительных материалов и\r\n\n        конструкций. Наши стенды позволяют проводить испытания образцов бетонных, каменных и армокаменных конструкций,\r\n\n        бетонных балок и образцов ячеистого бетона на сжатие и изгиб, а также испытывать образцы арматурных изделий и\r\n\n        муфтовых соединений на растяжение.\r\n\n    </li>\r\n\n    <li>\r\n\n        <strong>Натурные исследования</strong> &mdash;\r\n\n        большая часть лабораторных исследований проводимых нашим Научно-исследовательским центром, приходится на\r\n\n        определение различных характеристик строительных конструкций и материалов в построечных условиях. Именно поэтому\r\n\n        мы оснастили собственную лабораторию самым современным инструментом и оборудованием, позволяющим проводить\r\n\n        любого типа испытания при возведении монолитных железобетонных зданий и сооружений промышленного и гражданского\r\n\n        назначения, в том числе и уникальных, высотных и технически сложных объектов. Испытательное оборудование от\r\n\n        лидеров по производству подобных приспособлений, дает нам неоспоримые преимущества при проведении натурных\r\n\n        испытаний, такие как – точность измерений, скорость камеральной обработки результатов, время, необходимое для\r\n\n        вывода данных.\r\n\n    </li>\r\n\n    <li>\r\n\n        <a href="/activities/11"><strong>Мобильная испытательная лаборатория</strong></a> &mdash;\r\n\n        уникальная разработка НИЦ «Строительная экспертиза» не имеющая аналогов по своей функциональности и насыщенности\r\n\n        современным испытательным оборудованием, на Российском рынке. Мобильная лаборатория создана на базе\r\n\n        грузопассажирского Peugeot Boxer и оснащена оборудованием, позволяющим вести входящий контроль качества\r\n\n        строительных материалов, контролировать соблюдение технологических регламентов в процессе возведения зданий и\r\n\n        сооружений, а также производить комплексное обследование объектов при завершении строительства и в процессе\r\n\n        эксплуатации.\r\n\n    </li>\r\n\n</ul>\r\n\n<p>\r\n\n    Конечно же, наличие самого современного инструмента и оборудования не могло бы дать нам возможность вести\r\n\n    научно-техническую деятельности без высококвалифицированного персонала. Все сотрудники Научно-технического центра\r\n\n    «Строительная экспертиза» имеют не только профильное высшее образование, но и систематически проходят курсы\r\n\n    переподготовки и обучения.\r\n\n</p>\r\n\n<p>\r\n\n    Высочайший уровень подготовки наших специалистов, а также наличие комплексов необходимого оборудования, для\r\n\n    проведения различных исследований свойств строительных конструкций и материалов, подтверждено допусками\r\n\n    Саморегулирующей СРО НП «Объединение проектных организаций», лаборатория аттестована в Системе добровольной\r\n\n    сертификации «МЕЖРЕГИОНСТАНДАРТ» требованиям ГОСТ, в структуре АО НИЦ «Строительная экспертиза» внедрена система\r\n\n    менеджмента по стандартам ИСО серии 9000.\r\n\n</p>\r\n\n<p>Специалисты лаборатории выполняют:</p>\r\n\n<ul>\r\n\n    <li>Лабораторный контроль качества строительно-монтажных материалов в том числе сварочных работ.</li>\r\n\n    <li>Лабораторный контроль качества строительных материалов.</li>\r\n\n    <li>Физико-механические испытания строительных материалов разрушающим и неразрушающими методами.</li>\r\n\n    <li>Определение плотности грунтов основания.</li>\r\n\n    <li>Подбор составов бетонов с заданными свойствами.</li>\r\n\n</ul>\r\n\n<br>\r\n\n<table border="1px"\r\n\n       cellspacing="0"\r\n\n       cellpadding="4px">\r\n\n    <tbody>\r\n\n    <tr>\r\n\n        <th>№ п/п</th>\r\n\n        <th>Наименование испытываемой продукции</th>\r\n\n        <th>Наименование лабораторных испытаний</th>\r\n\n    </tr>\r\n\n    <tr>\r\n\n        <th>1</th>\r\n\n        <td><strong>Бетоны тяжелые и мелкозернистые</strong></td>\r\n\n        <td>\r\n\n            <ul>\r\n\n                <li>Прочность на сжатие, изгиб в т.ч. неразрушающими методами</li>\r\n\n                <li>Морозостойкость ускоренным методом по ГОСТ 10060.2</li>\r\n\n                <li>Водонепроницаемость</li>\r\n\n                <li>Водопоглощение</li>\r\n\n                <li>Пористость</li>\r\n\n                <li>Плотность</li>\r\n\n                <li>Влажность</li>\r\n\n            </ul>\r\n\n        </td>\r\n\n    </tr>\r\n\n    <tr>\r\n\n        <th>2</th>\r\n\n        <td><strong>Бетонные смеси</strong></td>\r\n\n        <td>\r\n\n            <ul>\r\n\n                <li>Удобоукладываемость</li>\r\n\n                <li>Средняя плотность</li>\r\n\n                <li>Объем вовлеченного воздуха</li>\r\n\n                <li>Расслаиваемость</li>\r\n\n                <li>Сохраняемость свойств во времени</li>\r\n\n            </ul>\r\n\n        </td>\r\n\n    </tr>\r\n\n    <tr>\r\n\n        <th>3</th>\r\n\n        <td><strong>Растворы</strong></td>\r\n\n        <td>\r\n\n            <ul>\r\n\n                <li>Прочность на сжатие,изгиб</li>\r\n\n                <li>Водоудерживающая способность</li>\r\n\n                <li>Расслаиваемость</li>\r\n\n                <li>Средняя плотность</li>\r\n\n                <li>Влажность</li>\r\n\n                <li>Подвижность</li>\r\n\n                <li>Морозостойкость</li>\r\n\n            </ul>\r\n\n        </td>\r\n\n    </tr>\r\n\n    <tr>\r\n\n        <th>4</th>\r\n\n        <td><strong>Кирпич и камни <br>керамические</strong></td>\r\n\n        <td>\r\n\n            <ul>\r\n\n                <li>Прочность</li>\r\n\n                <li>Водопоглощение</li>\r\n\n                <li>Внешний вид, масса</li>\r\n\n            </ul>\r\n\n        </td>\r\n\n    </tr>\r\n\n    <tr>\r\n\n        <th>5</th>\r\n\n        <td><strong>Щебень</strong></td>\r\n\n        <td>\r\n\n            <ul>\r\n\n                <li>Зерновой состав</li>\r\n\n                <li>Прочность</li>\r\n\n                <li>Содержание зерен слабых пород</li>\r\n\n                <li>Содержание пылевидных и глинистых частиц</li>\r\n\n            </ul>\r\n\n        </td>\r\n\n    </tr>\r\n\n    <tr>\r\n\n        <th>6</th>\r\n\n        <td><strong>Песок</strong></td>\r\n\n        <td>\r\n\n            <ul>\r\n\n                <li>Зерновой состав</li>\r\n\n                <li>Содержание глины в комках</li>\r\n\n                <li>Содержание пылевидных и глинистых частиц</li>\r\n\n                <li>Истинная плотность</li>\r\n\n                <li>Насыпная плотность</li>\r\n\n                <li>Влажность</li>\r\n\n            </ul>\r\n\n        </td>\r\n\n    </tr>\r\n\n    <tr>\r\n\n        <th>7</th>\r\n\n        <td><strong>Арматурные и закладные изделия сварные, соединения сварные</strong></td>\r\n\n        <td>\r\n\n            <ul>\r\n\n                <li>Растяжение</li>\r\n\n                <li>Временное сопротивление при разрыве,</li>\r\n\n                <li>Удлинение и предел текучести, изгиб</li>\r\n\n            </ul>\r\n\n        </td>\r\n\n    </tr>\r\n\n    <tr>\r\n\n        <th>8</th>\r\n\n        <td><strong>Цементы</strong></td>\r\n\n        <td>\r\n\n            <ul>\r\n\n                <li>Тонкость помола</li>\r\n\n                <li>Нормальная густота, сроки</li>\r\n\n                <li>схватывания и равномерность</li>\r\n\n                <li>изменения объема</li>\r\n\n                <li>Прочность</li>\r\n\n            </ul>\r\n\n        </td>\r\n\n    </tr>\r\n\n    <tr>\r\n\n        <th>9</th>\r\n\n        <td><strong>Бетоны легкие, ячеистые</strong></td>\r\n\n        <td>\r\n\n            <ul>\r\n\n                <li>Прочность</li>\r\n\n                <li>Плотность</li>\r\n\n            </ul>\r\n\n        </td>\r\n\n    </tr>\r\n\n    <tr>\r\n\n        <th>10</th>\r\n\n        <td>\r\n\n            <strong>Теплоизоляционные материалы</strong>, в т.ч:\r\n\n            <br> &mdash; пенополистирол;\r\n\n            <br> &mdash; плиты минватные\r\n\n        </td>\r\n\n        <td>\r\n\n            <ul>\r\n\n                <li>Геометрическая форма</li>\r\n\n                <li>Плотность, влажность, сорбционная влажность</li>\r\n\n                <li>Водопоглощение,</li>\r\n\n                <li>\r\n\n                    прочность на сжатие при 10%-ной линейной деформации, предел прочности при сжатии, изгибе и\r\n\n                    растяжении, сжимаемость и упругость, гибкость, линейная температурная усадка\r\n\n                </li>\r\n\n            </ul>\r\n\n        </td>\r\n\n    </tr>\r\n\n    <tr>\r\n\n        <th>11</th>\r\n\n        <td>\r\n\n            <strong>Отделочные материалы</strong> в т.ч.:\r\n\n            <br> &mdash; линолеум;\r\n\n            <br> &mdash; керамическая плитка\r\n\n        </td>\r\n\n        <td>\r\n\n            <ul>\r\n\n                <li>Геометрические параметры,</li>\r\n\n                <li>Водопоглощение, предел прочности при изгибе,</li>\r\n\n                <li>Термическая стойкость глазури</li>\r\n\n                <li>Изменение линейных размеров,</li>\r\n\n                <li>Влажность, плотность,</li>\r\n\n                <li>Неровность по массе</li>\r\n\n            </ul>\r\n\n        </td>\r\n\n    </tr>\r\n\n    <tr>\r\n\n        <th>12</th>\r\n\n        <td><strong>Грунт</strong></td>\r\n\n        <td>\r\n\n            <ul>\r\n\n                <li>Плотность</li>\r\n\n                <li>Влажность, оптимальная влажность</li>\r\n\n                <li>Степень уплотнения</li>\r\n\n            </ul>\r\n\n        </td>\r\n\n    </tr>\r\n\n    <tr>\r\n\n        <th>13</th>\r\n\n        <td><strong>Железобетонные конструкции</strong></td>\r\n\n        <td>\r\n\n            <ul>\r\n\n                <li>Толщина защитного слоя</li>\r\n\n                <li>Расположение арматуры</li>\r\n\n                <li>Прочность</li>\r\n\n            </ul>\r\n\n        </td>\r\n\n    </tr>\r\n\n    <tr>\r\n\n        <th>14</th>\r\n\n        <td><strong>Материалы рулонные, кровельные и гидроизоляционные</strong></td>\r\n\n        <td>\r\n\n            <ul>\r\n\n                <li>Геометрические параметры</li>\r\n\n                <li>Водопоглощение</li>\r\n\n                <li>Теплоустойчивость</li>\r\n\n                <li>Изменение линейных размеров при нагревании</li>\r\n\n            </ul>\r\n\n        </td>\r\n\n    </tr>\r\n\n    </tbody>\r\n\n</table>\r\n\n<br>\r\n\n<p>\r\n\n    Сотрудники нашей лаборатории имеют большой опыт в испытании строительных материалов и конструкций, что приводит к\r\n\n    высокой производительности и снижению стоимости и сроков оформления отчетной документации. Необходимо отметить, что\r\n\n    мы работаем только по государственным расценкам и в четко оговоренные сроки. Выезд на стройплощадку и подписание\r\n\n    договора возможен в день обращения.\r\n\n</p>\r\n\n						2	2016-07-07 06:42:54.755319	2016-07-13 07:20:21.191766	\N	0
4	t	t	Геодезия и мониторинг		<p>\r\n\n    Научно-исследовательский центр «Строительная Экспертиза» обладает мощной базой геодезического оборудования,\r\n\n    позволяющего в кротчайшие сроки выполнять различные работы, связанные с геодезическими измерениями.\r\n\n</p>\r\n\n<p>\r\n\n    Наш научный центр оснащен самым современным оборудованием лидеров-производителей геодезического оборудования, таких\r\n\n    как Sokkia, Leica и Trimble.\r\n\n</p>\r\n\n<p>\r\n\n    Большой комплект современного оборудования и профессиональный коллектив опытных геодезистов дает возможность решать\r\n\n    сложные и нестандартные задачи при выполнении геодезического сопровождения строительства.\r\n\n</p>\r\n\n<p>\r\n\n    Геодезические работы, выполняемые Научно-исследовательским центром «Строительная экспертиза», являются комплексным\r\n\n    видом работ, начинающимися при создании опорной разбивочной сети на строительной площадке и мониторинга за\r\n\n    прилегающей застройкой, вплоть до оформления исполнительной документации при окончании этапа или всего\r\n\n    строительства.\r\n\n</p>\r\n\n<p>\r\n\n    Деятельность НИЦ «Строительная экспертиза» всегда была неразрывно связанна с научной и практической деятельностью.\r\n\n    Именно поэтому мы всегда стремились соответствовать требованиям и рекомендациям государственных стандартов и\r\n\n    регламентов. Вот почему мы используем в своей работе только сертифицированное геодезическое оборудование и\r\n\n    материалы. При этом, например, геодезические марки, изготавливаемые на собственной производственной базе, и не\r\n\n    подлежащие обязательной сертификации, мы отдали на испытания в систему добровольной сертификации «МЕЖРЕГИОНСТАНДАРТ»\r\n\n    которая после проведения серий лабораторных и натурных испытаний, их сертифицировала, выдав соответствующий\r\n\n    аттестат.\r\n\n</p>\r\n\n<p>\r\n\n    Наиболее интересной, с точки зрения инжиниринга, является инклинометрия, выполняемая при геодезическом мониторинге\r\n\n    за состоянием «стены в грунте» или за стволами буровых скважин.\r\n\n</p>\r\n\n<p>\r\n\n    Бесспорно, наиболее ответственным видом измерений является геодезический мониторинг за кренами и осадками зданий.\r\n\n    Именно поэтому НИЦ «Строительная Экспертиза» имея на своей базе более 10 лазерных нивелиров Trimble и 5 тахеометров\r\n\n    Sokkia, способна выполнять геодезический мониторинг при возведении промышленных и гражданских зданий любой\r\n\n    сложности, а также высотных и большепролетных сооружений.\r\n\n</p>\r\n\n<p>\r\n\n    Кроме того, возможность выполнять геодезическое сопровождение строительства при возведении высотных и\r\n\n    большепролетных конструкций подвержена допусками СРО.\r\n\n</p>\r\n\n<p>Перечень работ, выполняемый Научно-исследовательским центром «Строительная Экспертиза»:</p>\r\n\n<ul>\r\n\n    <li>Геодезический мониторинг деформаций зданий и сооружений;</li>\r\n\n    <li>Геотехнический мониторинг;</li>\r\n\n    <li>Геодезические марки, репера, знаки;</li>\r\n\n    <li>Инклинометрия;</li>\r\n\n    <li>Мониторинг «стены в грунте»;</li>\r\n\n    <li>Фасадная съемка;</li>\r\n\n    <li>Инженерные изыскания;</li>\r\n\n    <li>Микронивелирные измерения (наблюдения);</li>\r\n\n    <li>Геодезическое оборудование;</li>\r\n\n    <li>Лазерное сканирование;</li>\r\n\n    <li>Геотехнический мониторинг гидросооружений;</li>\r\n\n    <li>3D-моделирование зданий;</li>\r\n\n    <li>Геотехнические и геодезические работы на промышленных предприятиях;</li>\r\n\n    <li>Деформации железнодорожного полотна;</li>\r\n\n    <li>Геотехнический мониторинг надземных и подземных коммуникаций;</li>\r\n\n    <li>Геодезические работы при строительстве коттеджных домов;</li>\r\n\n    <li>Оценка влияния нового строительства;</li>\r\n\n    <li>Определение наклонов и кренов вышек связи и труб;</li>\r\n\n    <li>Обследование с помощью геодезического и геотехнического мониторинга новостроек и старых сооружений;</li>\r\n\n    <li>Наблюдения за смещением грунтового массива.</li>\r\n\n</ul>\r\n\n						7	2016-07-07 06:42:54.763594	2016-07-13 07:20:33.045422	\N	0
6	t	t	Энергоэффективность и воздухопроницаемость		<p>\r\n\n    Под энергетическим аудитом (с целью оформления отчета по энергоаудиту) в настоящее время понимается комплексное\r\n\n    обследование организаций, предприятий и отдельных объектов по их инициативе или на основании закона. В него входит:\r\n\n</p>\r\n\n<ul>\r\n\n    <li>\r\n\n        составление карты использования объектом топливно-энергетических ресурсов в соответствии с ФЗ 261 и\r\n\n        методическими рекомендациями;\r\n\n    </li>\r\n\n    <li>разработка организационных и технических мероприятий, направленных на снижение потерь энергии;</li>\r\n\n    <li>определение потенциала энергосбережения;</li>\r\n\n    <li>финансовая оценка энергосберегающих мероприятий.</li>\r\n\n</ul>\r\n\n<p>\r\n\n    В Федеральном законе Российской Федерации от 23 ноября 2009 г. № 261-ФЗ «Об энергосбережении и о повышении\r\n\n    энергетической эффективности и о внесении изменений в отдельные законодательные акты Российской Федерации»\r\n\n    энергетическое обследование определяется как сбор и обработка информации об использовании энергетических ресурсов\r\n\n    для получения достоверной информации об объеме используемых энергетических ресурсов, о показателях энергетической\r\n\n    эффективности, а также выявления возможностей энергосбережения и повышения энергетической эффективности.\r\n\n</p>\r\n\n<p>\r\n\n    Цель комплексного энергоаудита - определение возможной экономии потребляемой энергии, составление отчета и создание\r\n\n    энергетического паспорта по организации, и также составление карты потребителей энергоресурсов. Конечным итогом\r\n\n    работы должно стать создание эффективной системы энергетического менеджмента. То есть комплексный энергетический\r\n\n    аудит должен стать базой для формирования энергополитики предприятия, строящего или эксплуатирующего объект\r\n\n    энергоаудита. Опыт и практика показывают, что организации и предприятия активно применяют элементы\r\n\n    энергоменеджмента, разрабатывая и внедряя программы по энергосбережению. В рамках муниципальных и федеральных\r\n\n    программ ведется замена оборудования, при закупках выбор делается в пользу энрегоэффективного оборудования. Однако\r\n\n    до сих пор еще не сформирован системный подход и анализ всей проводимой работы. Между тем, комплексный энергоаудит\r\n\n    нужен всем объектам капитального строительства. Он рассматривает все энергопотребляющее оборудование, предлагает\r\n\n    максимальную экономию и наиболее широкий выбор мер. Методический сбор данных существенно упрощает анализ и позволяет\r\n\n    найти подходящие решения, легко реализуемые на практике. Комплексный энергоаудит, в отличие от поверхностного,\r\n\n    включает в себя анализ всех энергетических затрат и энергопотребления оборудования в здании: систем ОВК (отопления,\r\n\n    вентиляции и кондиционирования) и воздуховодов; ограждающих конструкций здания (стены, окна, крыша, фундамент,\r\n\n    изоляция); освещения; нагрузки на электросети (бытовая техника и компьютеры). Также применяются другие меры,\r\n\n    например, повышение эффективности процессов эксплуатации и технического обслуживания, повышение квалификации\r\n\n    ответственных сотрудников. Среди задач комплексного энергоаудита - не только на повышении эффективности\r\n\n    оборудования, но и на создании его оптимальной работы и соответствии требуемой нагрузке, то есть выбирать\r\n\n    оборудование с мощностью, соответствующей задачам. Однако многие компании занимающиеся "энергоэффективностью", и не\r\n\n    подозревают, что кроме использования тепловизора для оценки тепловых потерь через ограждающие стеновые конструкции,\r\n\n    необходимо еще оценить потери через кровлю, вентиляцию, стоковые воды, электрическую сеть и т.д. Они не обследуют\r\n\n    оборудование, работающее с большими нагрузками, например, системы по отоплению, вентиляции и кондиционированию\r\n\n    воздуха (ОВК), мощные электродвигатели воздухораспределяющих установок и насосов (однако существенное повышение\r\n\n    энергоэффективность позволяет отладка настройки неправильно работающих систем ОВК). Компьютеры и периферийное\r\n\n    оборудование, оборудование мини-кухонь, освещение и светопрозрачные конструкции (окна) также не попадают в отчет\r\n\n    таких компаний, а они, тем не менее, также обладают энергосберегающим потенциалом. Комплексный подход к энергоаудиту\r\n\n    зародился более 10 лет назад при проведении проверки энергопотребления жилых зданий. Но энергоаудиторские компании,\r\n\n    появились на российском рынке в середине 90-х годов. Без учебников и методик, энтузиасты – энергоаудиторы и\r\n\n    подопытные предприятия начинали энергетические аудиты, основываясь на собственном опыте. Практика показывает, что\r\n\n    только комплексное моделирование и анализ помогают выявить выявить все виды потерь энергии, в том числе и\r\n\n    нестандартные. Так, в процессе расчетов пристальное внимание стоит уделить разнице между расчетными и фактическими\r\n\n    значениями расхода энергии инженерными системами здания. То есть для эффективного и успешного результата\r\n\n    энергоаудита необходима оценка энергозатрат здания, т.е. сравнение "вводных" мощностей (отопление, горячая вода,\r\n\n    электричество) и фактического потребления (потери тепла через ограждающие конструкции и вытяжку вентиляции, а также\r\n\n    температуру канализационных стоков; электрические потребители; потери тепла в трубах горячего водоснабжения).\r\n\n</p>\r\n\n<p>\r\n\n    Помимо этого, нужно учесть взаимное влияние энергосберегающих мероприятий, поскольку их простое, непродуманное\r\n\n    суммирование может не только не дать эффект экономии, но и наоборот – привести к увеличению расхода энергии.\r\n\n</p>\r\n\n<p>\r\n\n    Сам объект энергоаудита – исследуемое здание - должно рассматриваться как уникальное, а не как одно из множества\r\n\n    аналогичных объектов. Такой подход сможет выявить ошибки или недочеты в его эксплуатации и найти индивидуальные\r\n\n    возможности экономии энергии именно для данного здания. В первую очередь этому будет способствовать сбор фактических\r\n\n    данных, например, по работе системы ОВК: режим эксплуатации оборудования и расход энергии, изменение температуры, и\r\n\n    т.д. Такой индивидуальный подход способен выявить даже крупные проблемы здания. К примеру, на западе есть даже\r\n\n    понятие «sick building syndrome» - «синдром больного здания». Это комплексная проблема здания, которое не только не\r\n\n    является энергоэффективным, но и способно распространять риск заражения людей простудными заболеваниями через\r\n\n    систему ОВК. Экспертам, производящим комплексный энергоаудит, необходимо ознакомиться с особенностями здания.\r\n\n    Например, центральные системы ОВК и их системы управления могут создать сложности даже для опытных инженеров. Так, к\r\n\n    примеру, в высотных зданиях могут образовываться неконтролируемые воздушные потоки, возникающие из-за взаимодействия\r\n\n    тяги, вытяжных вентиляторов и воздухораспределительных систем повышенного давления. И этот факт и показатели также\r\n\n    нужно учитывать при комплексном виде обследования. Также при проведении исследования необходимо вводить поправку на\r\n\n    особенности наружного климата. Проблемой может стать проведение энергоаудита в теплое время года из –за отсутствия\r\n\n    температурного перепада внутри и снаружи температуры. Выходом может служить применение инновационной технологии -\r\n\n    так «аэродверей» (blower door). Эта система создана для тепловой диагностики и точного измерения утечек в небольших\r\n\n    зданиях или объектах с низкой воздухопроницаемостью. Аэродверь помогает выявить воздушные потоки, вместе с которыми\r\n\n    из здания уходит до 20% тепла. Принцип работы аэродвери таков: в здании создается искусственный перепад давления\r\n\n    (повышенного и разреженного), и датчики фиксируют источники движения воздушных потоков и, следовательно,\r\n\n    теплопотерь. Аэродверь может протестировать как небольшой дом, так и полноценный складской комплекс, обеспечивая\r\n\n    нагнетание огромного потока воздуха (до 42,000 куб.м/час). Поверхностный энергоаудит не брал бы в расчет особенности\r\n\n    климата. Этот недочет усилил бы тот факт, что требования, предъявляемые ко всему процессу энергоаудита, недостаточно\r\n\n    подробно сформулированы и жесткие границы между поверхностным и комплексным энергоадитом отсутствуют. Поэтому выбор\r\n\n    данных и мероприятий зачастую находится лишь в зоне ответственности и профессионализма специалиста, который проводит\r\n\n    энергоаудит. Отсутствие же подробной информации при выполнении энергоаудита приводит к нечетким рекомендациям и\r\n\n    отчетам. Между тем необходимо проводить аналитическую обработку полученных данных, с оформлением конкретных\r\n\n    рекомендаций по повышению энергоэффективности здания. То есть после проведения энергоаудита должен быть сформирован\r\n\n    пакет рекомендаций – фактически, модель энергоэффективности здания – и карты использования объектом\r\n\n    топливно-энергетических ресурсов. Эффективные и удачные методики проведения энергоаудита, примененные на практике,\r\n\n    тот час подхватываются профессиональным сообществом. В США, к примеру, были приняты национальные стандарты по\r\n\n    энергоаудиту. И именно комплексный подход получил признание и применение при проведении энергоаудита, а упрощенные\r\n\n    методы сегодня считаются неэффективными.И это вполне объяснимо в современных условиях эксплуатации недвижимости,\r\n\n    когда энергоаудит становится частью инвестиционного аудита. Простой отчёт по энергоаудиту сегодя уже не\r\n\n    удовлетворяет потенциального инвестора. Ему нужно предоставить технико-экономическое обоснование каждого\r\n\n    предлагаемого инвестпроекта, финансовый и организационный план его реализации, схемы мониторинга фактической\r\n\n    экономии финансовых и энергетических ресурсов. То есть, технически, энергоаудит сегодня должен приводить к созданию\r\n\n    энергетической модели, которая учитывает всё использование энергии, весь объем затрат и ускоряет окупаемость здания.\r\n\n</p>\r\n\n<p>\r\n\n    Это особенно актуально при темпах подорожания энергоносителей. Минимальные программы энергосбережения с экономией\r\n\n    энергозатрат на 5 - 7% сегодня не интересны собственникам предприятий. Необходимы инновационные и эффективные\r\n\n    программы, адекватные вызовам нового времени. Сейчас наступает время сложных комбинированных решений по модернизации\r\n\n    энергетических и технологических циклов, время проектов коренной реконструкции.\r\n\n</p>\r\n\n		энергоаудит				9	2016-07-07 06:42:54.782012	2016-07-13 07:20:54.91828	\N	0
7	t	t	Сертификация и аккредитация		<p>\r\n\n    <strong>Сертификация</strong>\r\n\n    это процедура подтверждения соответствия, посредством которой независимая от изготовителя (продавца, исполнителя) и\r\n\n    потребителя (покупателя) организация удостоверяет в письменной форме, что продукция соответствует установленным\r\n\n    требованиям.\r\n\n</p>\r\n\n<p>\r\n\n    <strong>Сертификат соответствия</strong> &mdash;\r\n\n    официальный документ, удостоверяющий, что сертифицированная продукция (выполняемая работа, оказываемая услуга,\r\n\n    проектная документация и т.п.) полностью соответствует требованиям, определенным нормами и правилами Российской\r\n\n    Федерации.\r\n\n</p>\r\n\n<p>АО НИЦ «Строительная экспертиза» предлагает свои услуги в области сертификации (подтверждении соответствия):</p>\r\n\n<ul>\r\n\n    <li>материалов (песок, щебень, бетоны, растворы строительные и т.п.);</li>\r\n\n    <li>изделий (кирпич, железобетонные изделия и т.п.);</li>\r\n\n    <li>конструкций (балки, фермы и т.п.);</li>\r\n\n    <li>строительного инструмента, оборудования и оснастки (формы для производства железобетонных изделий и т.п.);</li>\r\n\n    <li>строительных площадок на различных этапах проведения строительно-монтажных, ремонтно-восстановительных и\r\n\n        реконструкционных работ на объектах капитального строительства зданий, в т.ч. технически сложных и уникальных;\r\n\n    </li>\r\n\n    <li>строительных материалов и конструкций, не имеющих (утративших) паспорта качества;</li>\r\n\n    <li>строительных изделий и конструкций, изготавливаемых на строительной площадке;</li>\r\n\n    <li>технологических фундаментов и основания (под краны, дороги, бытовые городки).</li>\r\n\n</ul>\r\n\n<p><b>Сертификацию</b> целесообразно проводить в следующих случаях:</p>\r\n\n<ul>\r\n\n    <li>отсутствие (утрата) паспортов на материалы, продукцию и конструкции;</li>\r\n\n    <li>\r\n\n        отсутствие информации о технических характеристиках продукции и конструкций (состав, геометрия, прочность,\r\n\n        экологическая безопасность и т.п.);\r\n\n    </li>\r\n\n    <li>изготовление строительных конструкций на строительной площадке;</li>\r\n\n    <li>\r\n\n        отсутствие паспорта на продукцию (уничтожение, утеря, кража, полное или частичное несоответствие фактическому\r\n\n        объекту или маркировке на нем и т.п.);\r\n\n    </li>\r\n\n    <li>\r\n\n        необходимость подтверждения соответствия несерийных и уникальных объектов, разработок и конструкций действующим\r\n\n        нормам и правилам РФ.\r\n\n    </li>\r\n\n</ul>\r\n\n<p>\r\n\n    <b>Сертификат соответствия</b>\r\n\n    является аналогом <b>Паспорта продукции</b>. Паспорт изделия может оформить только производитель продукции.\r\n\n    Отсутствие паспорта на продукцию (уничтожение, утеря, кража, полное или частичное несоответствие фактическому\r\n\n    объекту или маркировке на нем и т.п.) не позволяет продавцу или приобретателю применять данную продукцию по\r\n\n    назначению. Единственная возможность использования данной продукции с утраченным паспортом &mdash; получение от\r\n\n    независимой экспертной организации Экспертного (технического) заключения и Сертификата соответствия.\r\n\n</p>\r\n\n<p>\r\n\n    АО НИЦ «Строительная экспертиза» аккредитовано в Системе добровольной сертификации «Национальный центр сертификации\r\n\n    и стандартизации» (Система «НЦСС») в качестве:\r\n\n</p>\r\n\n<ul>\r\n\n    <li>органа по сертификации:\r\n\n        <ul>\r\n\n            <li>продукции;</li>\r\n\n            <li>работ (услуг);</li>\r\n\n            <li>персонала.</li>\r\n\n        </ul>\r\n\n    </li>\r\n\n    <li>органа по сертификации:\r\n\n        <ul>\r\n\n            <li>систем менеджмента качества;</li>\r\n\n            <li>систем экологического менеджмента;</li>\r\n\n            <li>систем менеджмента управления охраной и безопасностью труда;</li>\r\n\n            <li>интегрированных систем менеджмента.</li>\r\n\n        </ul>\r\n\n    </li>\r\n\n    <li>испытательной лаборатории, в область аккредитации которой входят:\r\n\n        <ul>\r\n\n            <li>строительные материалы, изделия и конструкции;</li>\r\n\n            <li>металлические изделия и конструкции;</li>\r\n\n            <li>нерудные строительные материалы;</li>\r\n\n            <li>строительно-монтажные работы.</li>\r\n\n        </ul>\r\n\n    </li>\r\n\n</ul>\r\n\n<p>\r\n\n    Компетентность испытательной лаборатории в составе АО НИЦ «Строительная экспертиза» подтверждена органом по\r\n\n    аккредитации «Национальный центр сертификации и стандартизации» &mdash; аттестат аккредитации № RU.НЦСС.АЛ.001 от\r\n\n    24.07.2014 г.\r\n\n</p>\r\n\n<p>\r\n\n    АО НИЦ «Строительная экспертиза» проведены работы по сертификации продукции таких организаций как\r\n\n    <em>ООО «Сен-Гобен Строительная Продукция Рус»</em>, <em>ООО «ИНТРЕЙ Полимерные Системы»</em>,\r\n\n    <em>ООО «ФОРМАПЛАСТ»</em>, <em>ООО «ПолиХимГрупп»</em>, <em>ООО «НПО СтройПрогресс»</em> и других.\r\n\n</p>\r\n\n		сертификация, аккредитация				10	2016-07-07 06:42:54.794854	2016-07-13 07:21:21.361239	\N	0
8	t	t	Электропрогрев		<p>\r\n\n    В зимнее и холодное время года, когда средняя суточная температура воздуха меньше +5°С и минимальная суточная\r\n\n    температура ниже 0°С (СНиП 3.03.01-87 пункт 2.53), для требуемого набора прочности железобетонных конструкций,\r\n\n    необходимо использовать прогрев бетонируемых сооружений. Известны различные способы прогрева железобетонных\r\n\n    конструкций, но на строительном рынке как самый эффективный, быстрый и экономичный зарекомендовал себя метод\r\n\n    электропрогрева. Но, к сожалению, строительные компании не дальновидно мало уделяют внимания данному обстоятельству\r\n\n    и часто полагаются на квалификацию бригадных электриков, которые не способны дать качественного экспертного\r\n\n    сопровождения прогреваемых конструкций. Электролаборатория АО НИЦ «Строительная экспертиза» предлагает качественно\r\n\n    пересмотреть и осуществить профессиональную организацию работ по внедрению и сопровождению электропрогрева\r\n\n    железобетонных конструкций.\r\n\n</p>\r\n\n<p>В состав работ входят:</p>\r\n\n<ul>\r\n\n    <li>Разработка регламента прогрева бетона;</li>\r\n\n    <li>Моделирование прогрева бетона в расчётной программе;</li>\r\n\n    <li>Выбор схемы прогрева бетона по расчётным моделям;</li>\r\n\n    <li>Установка и пуско-наладка трансформаторов прогрева и кабелей высокого напряжения;</li>\r\n\n    <li>Шеф-монтаж при установке греющих проводов;</li>\r\n\n    <li>Проведение круглосуточного мониторинга за процессом прогрева бетона;</li>\r\n\n    <li>\r\n\n        Мониторинг набора прочности бетона в специализированной программе по фактическим температурным данным в теле\r\n\n        прогреваемого бетона;\r\n\n    </li>\r\n\n    <li>Рекомендации о времени отключения прогрева и снятия опалубки прогреваемых конструкций;</li>\r\n\n    <li>\r\n\n        Рекомендации по уходу за конструкциями после отключения прогрева, после снятия опалубки, учитывая режим и\r\n\n        условия осуществляемого прогрева;\r\n\n    </li>\r\n\n    <li>Оформление температурных листков.</li>\r\n\n</ul>\r\n\n						3	2016-07-07 06:42:54.809146	2016-07-13 07:21:30.970745	3	1
9	t	t	Натурные испытания		<p>\r\n\n    Одно из преимуществ Научно-Исследовательского центра «Строительная экспертиза» - возможность проведения\r\n\n    <strong>натурных испытаний</strong> строительных конструкций. Наиболее востребованными, естественно, является\r\n\n    определение физико-механических характеристик возведенных конструкций, а также грунтов основания или обратной\r\n\n    засыпки.\r\n\n</p>\r\n\n<p>\r\n\n    Научно-Исследовательский центр «Строительная экспертиза» выполняет работы по моделированию эксплуатационных нагрузок\r\n\n    на отдельные элементы здания (сваи, лестницы, перила, распорные анкера фасадных систем, так и на изготавливаемые на\r\n\n    специализированом полигоне образцы конструкций аналогичные используемым в ходе возведения зданий и сооружений\r\n\n    (балки, перемычки, ростверки, опоры мачт и другие). При этом использование специализированного оборудования и\r\n\n    распределительных систем позволяют создавать нагрузки более 300 тонн.\r\n\n</p>\r\n\n						4	2016-07-07 06:42:54.818555	2016-07-13 07:21:41.962991	3	1
1	t	t	Обследование зданий и сооружений		<p>\r\n\n    Комплексное <strong>техническое обследование зданий и сооружений</strong> гражданского и промышленного назначения, в\r\n\n    том числе технически сложных и уникальных, является одним из основных направлений деятельности Научно-технического\r\n\n    центра «Строительная экспертиза».\r\n\n</p>\r\n\n<p>\r\n\n    И к этому есть все предпосылки. Многолетний опыт работы, современное высокоточное оборудование и, конечно же,\r\n\n    бригады высококлассных профессионалов - обследователей, конструкторов и расчетчиков.\r\n\n</p>\r\n\n<p>\r\n\n    Каждая бригада состоит не только из обследователей проводящих оценку состояния строительных конструкций и инженерных\r\n\n    сетей здания, но и специалистов по прочностям, дефектоскопистов, а также расчетчиков, в совершенстве владеющих не\r\n\n    только плоскостными расчетами конструкций, но и современными расчетными комплексами, такими как SCAD, Лира, Мономах\r\n\n    и другие.\r\n\n</p>\r\n\n<p>\r\n\n    Одним из основных преимуществ наших Технических отчетов и Экспертных заключений, является полнота и корректность\r\n\n    предложений в Рекомендациях по дальнейшей эксплуатации зданий, которые формируются на основе выводов по результатам\r\n\n    проведенного обследования. Вы не встретите в наших отчетах фраз типа «Отремонтировать по отдельно разработанному\r\n\n    проекту» или «Предусмотреть усиление до начала эксплуатации».\r\n\n</p>\r\n\n<p>\r\n\n    Рекомендации, разрабатываемые нашими специалистами, максимально подробны и представляют собой проектные и\r\n\n    технологические решения по устранению выявленных дефектов, а также предложения по использованию строительных\r\n\n    материалов.\r\n\n</p>\r\n\n		обследование зданий, обследование сооружений	АО НИЦ «Строительная экспертиза» выполняет обследование зданий и обследование сооружений			0	2016-07-07 06:42:54.738009	2016-07-13 07:19:59.763903	\N	0
5	t	t	Судебная экспертиза		<p>\r\n\n    Научно-исследовательский центр «<strong>Строительная экспертиза</strong>» является членом\r\n\n    <a href="//www.sudex.ru/" target="_blank"><strong>Палаты судебных экспертов НП «СУДЭКС»</strong></a>\r\n\n    и обладает большим опытом в проведении различных экспертиз, в том числе судебных и досудебных.\r\n\n</p>\r\n\n<p>\r\n\n    Наши сотрудники являются дипломированными судебно-техническими экспертами, имеют научные степени, высшее специальное\r\n\n    образование и многолетний опыт работ в:\r\n\n</p>\r\n\n<ul>\r\n\n    <li>\r\n\n        анализе смет (проектно-сметной документации) на строительство и ремонт, а также составление строительных смет;\r\n\n    </li>\r\n\n    <li>\r\n\n        строительном конструировании, анализе, контроле качества строительных работ и надежности конструкций, экспертизе\r\n\n        технологии, организации производства работ, экономики строительства;\r\n\n    </li>\r\n\n    <li>сборе и обработке информации об использовании энергетических ресурсов для энергетического паспорта;</li>\r\n\n    <li>\r\n\n        проведении исследований строительных объектов и территорий, функционально связанных с ними, подготовке\r\n\n        заключения по поставленным компетентными органами вопросам;\r\n\n    </li>\r\n\n    <li>\r\n\n        оценке безопасности эксплуатации зданий, сооружений, попадающих под действие закона «о промышленной безопасности\r\n\n        опасных производственных объектов» РД 22-01.97;\r\n\n    </li>\r\n\n    <li>экспертном заключении о готовности здания или сооружения к сдаче в эксплуатацию;</li>\r\n\n    <li>инженерно-техническом обследовании зданий и сооружений различного назначения;</li>\r\n\n    <li>\r\n\n        технадзоре при строительстве крупных промышленных или административных объектов, при строительстве и ремонте\r\n\n        частных коттеджей;\r\n\n    </li>\r\n\n    <li>проверке всех строительных работ;</li>\r\n\n    <li>оценке и переоценке недвижимой собственности.</li>\r\n\n</ul>\r\n\n<p>\r\n\n    Также мы предоставляем весь комплекс работ по лабораторному сопровождению на объектах строительства с проведением\r\n\n    испытаний и контролем качества материалов, изделий и конструкций.\r\n\n</p>\r\n\n		судебная экспертиза				8	2016-07-07 06:42:54.772017	2016-07-13 07:20:45.835648	\N	0
\.


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('activities_id_seq', 11, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2016-07-14 17:02:40.718439	2016-07-14 17:02:40.718439
\.


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY areas (id, active, name, index, created_at, updated_at) FROM stdin;
1	t	Обследование зданий и сооружений	0	2016-07-08 16:14:50.228997	2016-07-08 16:14:50.228997
2	t	Технический надзор	1	2016-07-08 16:14:50.236765	2016-07-08 16:14:50.236765
3	t	Лабораторный контроль	2	2016-07-08 16:14:50.244183	2016-07-08 16:14:50.244183
4	t	Геодезия и мониторинг	3	2016-07-08 16:14:50.251216	2016-07-08 16:14:50.251216
5	t	Судебная экспертиза	4	2016-07-08 16:14:50.258565	2016-07-08 16:14:50.258565
7	t	Сертификация и аккредитация	6	2016-07-08 16:14:50.280854	2016-07-08 16:14:50.280854
6	t	Энергоэффективность и воздухопроницаемость	5	2016-07-08 16:14:50.273128	2016-07-09 23:03:23.402207
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('areas_id_seq', 7, true);


--
-- Data for Name: areas_throughs; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY areas_throughs (id, resource_type, resource_id, area_id) FROM stdin;
1	Target	1	1
2	Target	2	1
3	Target	3	1
4	Target	3	3
5	Activity	1	1
6	Activity	2	2
7	Activity	3	3
8	Activity	4	4
9	Activity	5	5
10	Activity	6	6
12	Activity	8	3
13	Activity	9	3
14	Activity	7	7
\.


--
-- Name: areas_throughs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('areas_throughs_id_seq', 14, true);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY articles (id, published, published_at, header, annotation, content, upload, title, keywords, description, canonical, robots, created_at, updated_at) FROM stdin;
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('articles_id_seq', 1, false);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY customers (id, active, published, name, content, email, phone, address, geo, website, upload, title, keywords, description, canonical, robots, index, user_id, created_at, updated_at) FROM stdin;
3	t	t	Группа Компаний «ПИК»	<p>Является одним из ведущих российских публичных девелоперов масштабных жилых проектов в Москве, Московской области и других регионах России. Основанна в 1994 году.</p><p>Приоритетное направление деятельности Группы — строительство и реализация доступного жилья, преимущественно в сегменте панельного индустриального домостроения. Земельный банк компании по состоянию на 31 декабря 2014 г. составил 5,2 млн. м<sup>2</sup>. С начала деятельности Группа Компаний ПИК построила около 15 млн. м<sup>2</sup> жилой недвижимости (более 250.000 квартир). Компания включена в перечень системообразующих предприятий российской экономики.</p>		+7 (495) 505-97-33	123242, Россия, г. Москва, ул. Баррикадная, д. 19 стр.1	55.760309 37.579869	//pik-group.ru	pik_group.jpg	\N	\N	\N	\N	\N	2	\N	2016-07-08 20:12:45.014797	2016-07-11 01:52:52.682591
2	t	t	Компания «MR Group»	<p>Успешно работает на российском рынке с 2003 года и является одним из лидеров в девелопменте жилой и коммерческой недвижимости.</p><p>Является членом таких профессиональных организаций, как Гильдия управляющих и девелоперов, Национальное агентство малоэтажного и коттеджного строительства (НАМИКС), Ассоциация индустриальных парков России, Экспертный совет по развитию комфортного и доступного жилья при Минстрое России, Агентство стратегических инициатив (АСИ), учредителем которого является Правительство Российской Федерации, общероссийская общественная организация «Деловая Россия», входит в Клуб инвесторов Москвы.</p>		+7 (495) 797-55-22	125167, Россия, г. Москва, 4-я ул. 8 Марта, д. 6а БЦ «Аэропорт»	55.803629 37.550215	//mr-group.ru	mr_group.png	\N	\N	\N	\N	\N	1	\N	2016-07-08 19:38:02.337537	2016-07-11 01:53:46.833353
1	t	t	Девелоперская компания «ДОНСТРОЙ»	<p>Ведущая девелоперская компания Москвы в высших сегментах жилой недвижимости — Business, Premium и De Luxe, работающая на рынке недвижимости с 1994 года.</p><p>Портфель построенных и строящихся объектов включает более 6.000.000 м<sup>2</sup> площадей. Наиболее известные проекты компании — жилые комплексы «Алые Паруса», «Воробьевы Горы», «Триумф-Палас», «Дом на Мосфильмовской» и другие элитные новостройки.</p>		+7 (495) 266-72-04	119590, Россия, г. Москва, ул. Мосфильмовская, д. 70	55.714712 37.504576	//donstroy.com	donstroy.png	\N	\N	\N	\N	\N	0	\N	2016-07-08 17:00:23.087595	2016-07-11 01:55:10.814743
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('customers_id_seq', 3, true);


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY feedbacks (id, published, published_at, header, content, upload, title, keywords, description, canonical, robots, source, customer_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('feedbacks_id_seq', 1, false);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY images (id, title, description, alt, upload, upload_crop, index, resource_type, resource_id, created_at, updated_at) FROM stdin;
1		\N		00.jpg	t	0	Activity	1	2016-07-08 16:18:48.625756	2016-07-08 16:18:48.625756
2		\N		01.jpg	t	1	Activity	1	2016-07-08 16:18:49.627079	2016-07-08 16:18:49.627079
3		\N		02.jpg	t	2	Activity	1	2016-07-08 16:18:50.638391	2016-07-08 16:18:50.638391
4		\N		03.jpg	t	3	Activity	1	2016-07-08 16:18:51.67624	2016-07-08 16:18:51.67624
5		\N		04.jpg	t	4	Activity	1	2016-07-08 16:18:52.664331	2016-07-08 16:18:52.664331
6		\N		10.jpg	t	5	Activity	1	2016-07-08 16:18:53.633063	2016-07-08 16:18:53.633063
7		\N		11.jpg	t	6	Activity	1	2016-07-08 16:18:54.436076	2016-07-08 16:18:54.436076
8		\N		12.jpg	t	7	Activity	1	2016-07-08 16:18:55.218123	2016-07-08 16:18:55.218123
9		\N		13.jpg	t	8	Activity	1	2016-07-08 16:18:55.934801	2016-07-08 16:18:55.934801
10		\N		14.jpg	t	9	Activity	1	2016-07-08 16:18:56.718313	2016-07-08 16:18:56.718313
11		\N		15.jpg	t	10	Activity	1	2016-07-08 16:18:57.505151	2016-07-08 16:18:57.505151
12		\N		svidetelstvo_nic_sudex.jpg	f	0	Activity	5	2016-07-08 16:20:51.862988	2016-07-08 16:20:51.862988
13		\N		brateevo.jpg	t	0	Activity	6	2016-07-08 16:21:14.275462	2016-07-08 16:21:14.275462
14		\N		00.jpg	f	0	Activity	7	2016-07-08 16:21:58.075849	2016-07-08 16:21:58.075849
15		\N		01.jpg	f	1	Activity	7	2016-07-08 16:22:01.009235	2016-07-08 16:22:01.009235
16		\N		10.jpg	f	2	Activity	7	2016-07-08 16:22:04.020266	2016-07-08 16:22:04.020266
17		\N		00.jpg	t	0	Activity	10	2016-07-08 16:26:21.966343	2016-07-08 16:26:21.966343
18		\N		01.jpg	t	1	Activity	10	2016-07-08 16:26:23.137499	2016-07-08 16:26:23.137499
19		\N		02.jpg	t	2	Activity	10	2016-07-08 16:26:24.327092	2016-07-08 16:26:24.327092
20		\N		03.jpg	t	3	Activity	10	2016-07-08 16:26:25.533578	2016-07-08 16:26:25.533578
21		\N		04.jpg	t	4	Activity	10	2016-07-08 16:26:26.76182	2016-07-08 16:26:26.76182
22		\N		05.jpg	t	5	Activity	10	2016-07-08 16:26:27.990421	2016-07-08 16:26:27.990421
23		\N		00.jpg	t	0	Activity	11	2016-07-08 16:29:58.014176	2016-07-08 16:29:58.014176
24		\N		01.jpg	t	1	Activity	11	2016-07-08 16:29:59.169033	2016-07-08 16:29:59.169033
25		\N		00.jpg	t	0	Target	1	2016-07-09 07:16:45.996307	2016-07-09 07:16:45.996307
26		\N		01.jpg	t	1	Target	1	2016-07-09 07:16:47.110194	2016-07-09 07:16:47.110194
27		\N		02.jpg	t	2	Target	1	2016-07-09 07:16:48.418343	2016-07-09 07:16:48.418343
28		\N		03.jpg	t	3	Target	1	2016-07-09 07:16:49.668696	2016-07-09 07:16:49.668696
29		\N		04.jpg	t	4	Target	1	2016-07-09 07:16:51.030378	2016-07-09 07:16:51.030378
30		\N		05.jpg	t	5	Target	1	2016-07-09 07:16:52.194524	2016-07-09 07:16:52.194524
31		\N		06.jpg	t	6	Target	1	2016-07-09 07:16:53.288844	2016-07-09 07:16:53.288844
32		\N		00.jpg	t	0	Target	2	2016-07-09 07:39:06.271114	2016-07-09 07:39:06.271114
33		\N		01.jpg	t	1	Target	2	2016-07-09 07:39:08.002598	2016-07-09 07:39:08.002598
34		\N		02.jpg	t	2	Target	2	2016-07-09 07:39:09.718735	2016-07-09 07:39:09.718735
35		\N		03.jpg	t	3	Target	2	2016-07-09 07:39:11.401239	2016-07-09 07:39:11.401239
36		\N		04.jpg	t	4	Target	2	2016-07-09 07:39:12.988299	2016-07-09 07:39:12.988299
37		\N		05.jpg	t	5	Target	2	2016-07-09 07:39:14.605033	2016-07-09 07:39:14.605033
38		\N		06.jpg	t	6	Target	2	2016-07-09 07:39:16.32476	2016-07-09 07:39:16.32476
39		\N		00.jpg	t	0	Target	3	2016-07-09 08:09:53.50768	2016-07-09 08:09:53.50768
40		\N		01.jpg	t	1	Target	3	2016-07-09 08:09:55.476563	2016-07-09 08:09:55.476563
41		\N		02.jpg	t	2	Target	3	2016-07-09 08:09:57.445773	2016-07-09 08:09:57.445773
42		\N		03.jpg	t	3	Target	3	2016-07-09 08:09:59.577854	2016-07-09 08:09:59.577854
43		\N		04.jpg	t	4	Target	3	2016-07-09 08:10:01.596431	2016-07-09 08:10:01.596431
44		\N		05.jpg	t	5	Target	3	2016-07-09 08:10:03.481646	2016-07-09 08:10:03.481646
45		\N		06.jpg	t	6	Target	3	2016-07-09 08:10:05.379972	2016-07-09 08:10:05.379972
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('images_id_seq', 45, true);


--
-- Data for Name: permits; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY permits (id, published, name, number, provider, issue_at, onset_at, ends_at, title, keywords, description, canonical, robots, index, created_at, updated_at) FROM stdin;
\.


--
-- Name: permits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('permits_id_seq', 1, false);


--
-- Data for Name: publishes; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY publishes (id, published, published_at, header, content, partial, title, keywords, description, canonical, robots, created_at, updated_at) FROM stdin;
1	t	2014-08-14	Комплексный строительный надзор: требования и необходимость		1						2016-07-16 09:18:25.80378	2016-07-16 09:18:25.80378
2	t	2014-08-14	Оценка развития и модернизации промышленных территорий на территориях российских мегаполисов		2						2016-07-16 12:10:42.698453	2016-07-16 12:10:42.698453
\.


--
-- Name: publishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('publishes_id_seq', 2, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY schema_migrations (version) FROM stdin;
20160401000000
20160401000001
20160401000100
20160401000200
20160401000300
20160401000301
20160401000400
20160401000500
20160401000600
20160401000601
20160401000700
20160401000800
20160401000900
20160401001000
\.


--
-- Data for Name: targets; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY targets (id, published, important, start_at, finish_at, name, content, address, geo, website, title, keywords, description, canonical, robots, index, customer_id, created_at, updated_at) FROM stdin;
3	t	2	\N	\N	Многофункциональный комплекс «Водный»	<p>Лабораторный контроль качества бетонных работ строящегося многофункционального комплекса (1-ой очереди).</p>	125212, Россия, г. Москва, Головинское шоссе, д. 5	55.840210 37.491959	//mfkvodny.ru						2	2	2016-07-09 07:57:19.393945	2016-07-11 04:56:32.124057
2	t	1	\N	\N	Жилой комплекс «Суббота»	<ul>\r\n\n    <li>Обследование существующих зданий Научно Исследовательского Тракторного института" (НАТИ), предназначенных под снос;</li>\r\n\n    <li>Разработка и регистрация Регламента обращения с отходами;</li>\r\n\n    <li>Разработка Проекта производства работ по сносу здания.</li>\r\n\n</ul>	125040, Россия, г. Москва, ул. Верхняя, д. 34	55.779028 37.574552	//donstroy.com/objects/subbota						1	1	2016-07-09 07:36:29.208033	2016-07-11 04:56:44.966057
1	t	0	\N	\N	Завод «Серп и Молот»	<p>Обследование комплекса производственных зданий.</p>	111033, Россия, г. Москва, ул. Золоторожский вал, вл. 11	55.752571 37.701272	//sim-st.com						0	1	2016-07-09 06:34:09.307132	2016-07-11 04:56:52.654545
\.


--
-- Name: targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('targets_id_seq', 3, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY users (id, email, encrypted_password, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, is_admin, in_staff, name, phone, address) FROM stdin;
2	manager@test.test	$2a$11$jy1re6gKAN6XLj40A9iIT.UsyCYXc7PctH2WTleSKkGtg/xjVwYx6	\N	0	\N	\N	\N	\N	2016-07-08 16:14:50.015432	2016-07-08 16:14:50.015432	f	t	Менеджер	\N	\N
3	client@test.test	$2a$11$9KgpZpuqoFLjjEx5K8fcleD.OJggkefRaDVf.9bi09oGGCSuBhmj6	\N	0	\N	\N	\N	\N	2016-07-08 16:14:50.206213	2016-07-08 16:14:50.206213	f	f	Клиент	\N	\N
1	admin@test.test	$2a$11$1LFQjBE5V39JJz/wKWWj3OikvKM.rOsx6qrbFSSCmS/CMWgrrMp2u	2016-07-13 12:47:45.586605	7	2016-10-14 18:35:16.979652	2016-08-05 13:44:57.987236	176.15.198.60	37.147.111.24	2016-07-08 16:14:49.822523	2016-10-14 18:35:16.982437	t	t	Администратор	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: areas_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: areas_throughs_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY areas_throughs
    ADD CONSTRAINT areas_throughs_pkey PRIMARY KEY (id);


--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: permits_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY permits
    ADD CONSTRAINT permits_pkey PRIMARY KEY (id);


--
-- Name: publishes_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY publishes
    ADD CONSTRAINT publishes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: targets_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY targets
    ADD CONSTRAINT targets_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_activities_on_ancestry; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_activities_on_ancestry ON activities USING btree (ancestry);


--
-- Name: index_activities_on_header; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_activities_on_header ON activities USING btree (header);


--
-- Name: index_activities_on_index; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_activities_on_index ON activities USING btree (index);


--
-- Name: index_activities_on_navigated; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_activities_on_navigated ON activities USING btree (navigated);


--
-- Name: index_activities_on_published; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_activities_on_published ON activities USING btree (published);


--
-- Name: index_areas_on_active; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_areas_on_active ON areas USING btree (active);


--
-- Name: index_areas_on_index; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_areas_on_index ON areas USING btree (index);


--
-- Name: index_areas_on_name; Type: INDEX; Schema: public; Owner: dev
--

CREATE UNIQUE INDEX index_areas_on_name ON areas USING btree (name);


--
-- Name: index_areas_throughs_for_uniqueness; Type: INDEX; Schema: public; Owner: dev
--

CREATE UNIQUE INDEX index_areas_throughs_for_uniqueness ON areas_throughs USING btree (resource_type, resource_id, area_id);


--
-- Name: index_areas_throughs_on_area_id; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_areas_throughs_on_area_id ON areas_throughs USING btree (area_id);


--
-- Name: index_areas_throughs_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_areas_throughs_on_resource_type_and_resource_id ON areas_throughs USING btree (resource_type, resource_id);


--
-- Name: index_articles_on_header; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_articles_on_header ON articles USING btree (header);


--
-- Name: index_articles_on_published; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_articles_on_published ON articles USING btree (published);


--
-- Name: index_articles_on_published_at; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_articles_on_published_at ON articles USING btree (published_at);


--
-- Name: index_articles_on_published_at_and_header; Type: INDEX; Schema: public; Owner: dev
--

CREATE UNIQUE INDEX index_articles_on_published_at_and_header ON articles USING btree (published_at, header);


--
-- Name: index_customers_on_active; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_customers_on_active ON customers USING btree (active);


--
-- Name: index_customers_on_index; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_customers_on_index ON customers USING btree (index);


--
-- Name: index_customers_on_name; Type: INDEX; Schema: public; Owner: dev
--

CREATE UNIQUE INDEX index_customers_on_name ON customers USING btree (name);


--
-- Name: index_customers_on_published; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_customers_on_published ON customers USING btree (published);


--
-- Name: index_customers_on_user_id; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_customers_on_user_id ON customers USING btree (user_id);


--
-- Name: index_feedbacks_on_customer_id; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_feedbacks_on_customer_id ON feedbacks USING btree (customer_id);


--
-- Name: index_feedbacks_on_header; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_feedbacks_on_header ON feedbacks USING btree (header);


--
-- Name: index_feedbacks_on_published; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_feedbacks_on_published ON feedbacks USING btree (published);


--
-- Name: index_feedbacks_on_published_at; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_feedbacks_on_published_at ON feedbacks USING btree (published_at);


--
-- Name: index_images_on_index; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_images_on_index ON images USING btree (index);


--
-- Name: index_images_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_images_on_resource_type_and_resource_id ON images USING btree (resource_type, resource_id);


--
-- Name: index_permits_on_index; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_permits_on_index ON permits USING btree (index);


--
-- Name: index_permits_on_issue_at; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_permits_on_issue_at ON permits USING btree (issue_at);


--
-- Name: index_permits_on_name; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_permits_on_name ON permits USING btree (name);


--
-- Name: index_permits_on_number; Type: INDEX; Schema: public; Owner: dev
--

CREATE UNIQUE INDEX index_permits_on_number ON permits USING btree (number);


--
-- Name: index_permits_on_provider; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_permits_on_provider ON permits USING btree (provider);


--
-- Name: index_permits_on_published; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_permits_on_published ON permits USING btree (published);


--
-- Name: index_publishes_on_header; Type: INDEX; Schema: public; Owner: dev
--

CREATE UNIQUE INDEX index_publishes_on_header ON publishes USING btree (header);


--
-- Name: index_publishes_on_published; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_publishes_on_published ON publishes USING btree (published);


--
-- Name: index_publishes_on_published_at; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_publishes_on_published_at ON publishes USING btree (published_at);


--
-- Name: index_targets_on_customer_id; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_targets_on_customer_id ON targets USING btree (customer_id);


--
-- Name: index_targets_on_important; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_targets_on_important ON targets USING btree (important);


--
-- Name: index_targets_on_index; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_targets_on_index ON targets USING btree (index);


--
-- Name: index_targets_on_name; Type: INDEX; Schema: public; Owner: dev
--

CREATE UNIQUE INDEX index_targets_on_name ON targets USING btree (name);


--
-- Name: index_targets_on_published; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_targets_on_published ON targets USING btree (published);


--
-- Name: index_targets_on_start_at; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_targets_on_start_at ON targets USING btree (start_at);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: dev
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_is_admin_and_in_staff; Type: INDEX; Schema: public; Owner: dev
--

CREATE INDEX index_users_on_is_admin_and_in_staff ON users USING btree (is_admin, in_staff);


--
-- Name: fk_rails_68743d2681; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY areas_throughs
    ADD CONSTRAINT fk_rails_68743d2681 FOREIGN KEY (area_id) REFERENCES areas(id) ON DELETE CASCADE;


--
-- Name: fk_rails_7b367dd0ea; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY feedbacks
    ADD CONSTRAINT fk_rails_7b367dd0ea FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL;


--
-- Name: fk_rails_9917eeaf5d; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT fk_rails_9917eeaf5d FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;


--
-- Name: fk_rails_ab6f606f28; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY targets
    ADD CONSTRAINT fk_rails_ab6f606f28 FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

