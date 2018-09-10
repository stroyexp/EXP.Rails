--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
    upload_crop boolean DEFAULT true,
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
    source character varying,
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
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: activities id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY areas ALTER COLUMN id SET DEFAULT nextval('areas_id_seq'::regclass);


--
-- Name: areas_throughs id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY areas_throughs ALTER COLUMN id SET DEFAULT nextval('areas_throughs_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: feedbacks id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY feedbacks ALTER COLUMN id SET DEFAULT nextval('feedbacks_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: permits id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY permits ALTER COLUMN id SET DEFAULT nextval('permits_id_seq'::regclass);


--
-- Name: publishes id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY publishes ALTER COLUMN id SET DEFAULT nextval('publishes_id_seq'::regclass);


--
-- Name: targets id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY targets ALTER COLUMN id SET DEFAULT nextval('targets_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: dev
--



--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 1, false);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO activities VALUES (2, true, true, 'Технический надзор', '', '<p>

    Технический надзор (технадзор) в строительстве — это комплекс мер, целью которых является сделать весь процесс

    проектных, сметных, инженерных и строительно-монтажных работ с начала проектирования и до окончания строительства

    максимально управляемым, прозрачным, и предсказуемым для заказчика. Очень часто можно встретить

    <strong>термин контроль смр</strong>(если расшифровать, то получится контроль над строительно-монтажными работами).

    Технадзор проводится на каждом этапе – с момента подготовки проекта до сдачи строительного объекта.

</p>

<p>

    Технический надзор в области проектирования, сметных, инженерных и строительно-монтажных работ осуществляется

    независимыми инженерами-экспертами в своей области. Заказчик получает от нашей лаборатории четкие рекомендации,

    оформленные в виде технических заключений, фото-отчетов и результатов проверок объектов строительства.

</p>

<p>

    Присутствие на строительной площадке нашего специалиста по технадзору гарантирует надлежащий

    <strong>контроль строительно-монтажных работ</strong> и высокое качество выполняемых операций. Договор на технадзор

    включает в себя проверку правильности составления строительной документации. Это позволит заказчику в случае

    возникновения конфликтных ситуаций аргументировать свои претензии по отношению к строителям.

</p>

<p>Технический надзор не признает мелочей. Оценке подвергается все стадии строительства.</p>

<p>

    Наши специалисты, выполняющие технадзор в строительстве, смогут сэкономить заказчику затраты времени и средств.

    Помогут избежать необоснованно завышенных сроков выполнения строительно-монтажных работ, проследят за качеством и

    объемом выполненных работ.

</p>

<p>

    Технический надзор (технадзор) за строительством осуществляется в интересах Заказчика строительства с целью

    обеспечения контроля качества строительных работ и имеет целью постоянное проведение оценки соответствия строящегося

    объекта требованиям к его безопасности, установленным техническими регламентами, а также нормативными документами и

    стандартами, являющимися доказательной базой соблюдения требований технических регламентов и подтверждением

    возможности безопасной эксплуатации объекта при последующей передачи его в эксплуатацию.

</p>

<p>

    Технический надзор позволяет отслеживать технологическую последовательность выполнения строительных работ, при

    осуществлении функций технического надзора на строительной площадке постоянно находятся инженеры технадзора по

    нескольким специальностям.

</p>

<p>

    Технический надзор осуществляется в соответствии с требованиями СНиП 12-01-2009 «Организация строительства» и

    предусматривает следующие виды технадзора:

</p>

<ul>

    <li>

        Проверка наличия у исполнителя работ документов о качестве (сертификатов в установленных случаях) на применяемые

        им материалы, изделия и оборудование, документированных результатов входного контроля смр и лабораторных

        испытаний, таким образом инженер технадзора осуществляет контроль качества строительных материалов.

    </li>

    <li>

        Контроль соблюдения исполнителем работ правил складирования и хранения применяемых материалов, изделий и

        оборудования; при выявлении нарушений этих правил представитель технадзора может запретить применение

        неправильно складированных и хранящихся материалов.

    </li>

    <li>

        При контроле соответствия выполняемой исполнителем работ последовательности и состава выполняемых

        технологических операций — технологической и нормативной документации, распространяющейся на данные

        технологические операции, технический надзор контролирует соблюдение технологических режимов, установленных

        технологическими картами и регламентами, соответствие показателей качества выполнения операций и их результатов

        требованиям проектной и технологической документации, а также распространяющейся на данные технологические

        операции нормативной документации.

    </li>

    <li>

        Технический надзор контролирует наличие и правильность ведения исполнителем работ исполнительной технической

        документации, в том числе оценку достоверности геодезических исполнительных схем выполненных конструкций с

        выборочным контролем точности положения конструктивных элементов.

    </li>

    <li>

        Контроль за устранением дефектов в проектной документации, выявленных в процессе строительства,

        документированный возврат дефектной документации проектировщику, контроль и документированная приемка

        исправленной документации, передача ее исполнителю работ.

    </li>

    <li>

        Контроль исполнения исполнителем работ предписаний органов государственного надзора и местного самоуправления.

    </li>

    <li>

        Извещение органов государственного надзора обо всех случаях аварийного состояния на объекте строительства.

    </li>

    <li>

        Контроль соответствия объемов и сроков выполнения работ условиям договора и календарному плану строительства.

    </li>

    <li>

        Оценку (совместно с исполнителем работ) соответствия выполненных работ, конструкций, участков инженерных сетей,

        подписание двухсторонних актов, подтверждающих соответствие; контроль за выполнением исполнителем работ

        требования о недопустимости выполнения последующих работ до подписания указанных актов.

    </li>

    <li>

        Заключительную оценку (совместно с исполнителем работ) соответствия законченного строительством объекта

        требованиям законодательства, проектной и нормативной документации.

    </li>

</ul>

', '', '', '', '', '', 1, '2016-07-07 06:42:54.74721', '2016-07-13 07:20:12.167093', NULL, 0);
INSERT INTO activities VALUES (3, true, true, 'Лабораторный контроль', '', '<p>

    Лабораторное сопровождение, выполняемое Научно-исследовательским центром «Строительная экспертиза», подразделяется

    на два этапа. Первый этап контроля – входной контроль строительных материалов и конструкций. Во время поставки

    материалов на строительную площадку нашими специалистами может контролироваться до 50 параметров одновременно.

    Прежде всего, это физико-механические свойства, химические и геометрические параметры, а также оценка состояния

    конструкций по визуальным признакам. Данный вид контроля позволяет минимизировать риски строительных компаний и

    инвесторов еще на ранней стадии, и отбраковать некондиционный материал и конструкции.

</p>

<p>

    Второй тип контроля, но не менее важный, чем первый – текущий. Различные виды и типы измерений, производимые в

    процессе возведения зданий и сооружений, являются, бесспорно, наиболее ответственными.

</p>

<p>

    Лабораторный контроль, проводимый в процессе строительства, зачастую выполняется совместно с дефектоскопией и

    комплексным обследованием возведенных конструкций, давая тем самым возможность полностью представить состояние

    возводимого здания, а также оценить изменения в его жесткости и устойчивости.

</p>

<p>Одним из преимуществ Научно-исследовательского центра «Строительная экспертиза», является собственная лабораторная

   база, оснащенная самым современным комплексом испытательного оборудования.</p>

<p>Структура лаборатории НИЦ «Строительная экспертиза» состоит из трех взаимодополняемых подразделений: </p>

<ul>

    <li>

        <a href="/activities/10"><strong>Лабораторная база</strong></a> &mdash;

        являющейся обязательным элементом любой лаборатории занимающейся испытанием строительных материалов и

        конструкций. Наши стенды позволяют проводить испытания образцов бетонных, каменных и армокаменных конструкций,

        бетонных балок и образцов ячеистого бетона на сжатие и изгиб, а также испытывать образцы арматурных изделий и

        муфтовых соединений на растяжение.

    </li>

    <li>

        <strong>Натурные исследования</strong> &mdash;

        большая часть лабораторных исследований проводимых нашим Научно-исследовательским центром, приходится на

        определение различных характеристик строительных конструкций и материалов в построечных условиях. Именно поэтому

        мы оснастили собственную лабораторию самым современным инструментом и оборудованием, позволяющим проводить

        любого типа испытания при возведении монолитных железобетонных зданий и сооружений промышленного и гражданского

        назначения, в том числе и уникальных, высотных и технически сложных объектов. Испытательное оборудование от

        лидеров по производству подобных приспособлений, дает нам неоспоримые преимущества при проведении натурных

        испытаний, такие как – точность измерений, скорость камеральной обработки результатов, время, необходимое для

        вывода данных.

    </li>

    <li>

        <a href="/activities/11"><strong>Мобильная испытательная лаборатория</strong></a> &mdash;

        уникальная разработка НИЦ «Строительная экспертиза» не имеющая аналогов по своей функциональности и насыщенности

        современным испытательным оборудованием, на Российском рынке. Мобильная лаборатория создана на базе

        грузопассажирского Peugeot Boxer и оснащена оборудованием, позволяющим вести входящий контроль качества

        строительных материалов, контролировать соблюдение технологических регламентов в процессе возведения зданий и

        сооружений, а также производить комплексное обследование объектов при завершении строительства и в процессе

        эксплуатации.

    </li>

</ul>

<p>

    Конечно же, наличие самого современного инструмента и оборудования не могло бы дать нам возможность вести

    научно-техническую деятельности без высококвалифицированного персонала. Все сотрудники Научно-технического центра

    «Строительная экспертиза» имеют не только профильное высшее образование, но и систематически проходят курсы

    переподготовки и обучения.

</p>

<p>

    Высочайший уровень подготовки наших специалистов, а также наличие комплексов необходимого оборудования, для

    проведения различных исследований свойств строительных конструкций и материалов, подтверждено допусками

    Саморегулирующей СРО НП «Объединение проектных организаций», лаборатория аттестована в Системе добровольной

    сертификации «МЕЖРЕГИОНСТАНДАРТ» требованиям ГОСТ, в структуре АО НИЦ «Строительная экспертиза» внедрена система

    менеджмента по стандартам ИСО серии 9000.

</p>

<p>Специалисты лаборатории выполняют:</p>

<ul>

    <li>Лабораторный контроль качества строительно-монтажных материалов в том числе сварочных работ.</li>

    <li>Лабораторный контроль качества строительных материалов.</li>

    <li>Физико-механические испытания строительных материалов разрушающим и неразрушающими методами.</li>

    <li>Определение плотности грунтов основания.</li>

    <li>Подбор составов бетонов с заданными свойствами.</li>

</ul>

<br>

<table border="1px"

       cellspacing="0"

       cellpadding="4px">

    <tbody>

    <tr>

        <th>№ п/п</th>

        <th>Наименование испытываемой продукции</th>

        <th>Наименование лабораторных испытаний</th>

    </tr>

    <tr>

        <th>1</th>

        <td><strong>Бетоны тяжелые и мелкозернистые</strong></td>

        <td>

            <ul>

                <li>Прочность на сжатие, изгиб в т.ч. неразрушающими методами</li>

                <li>Морозостойкость ускоренным методом по ГОСТ 10060.2</li>

                <li>Водонепроницаемость</li>

                <li>Водопоглощение</li>

                <li>Пористость</li>

                <li>Плотность</li>

                <li>Влажность</li>

            </ul>

        </td>

    </tr>

    <tr>

        <th>2</th>

        <td><strong>Бетонные смеси</strong></td>

        <td>

            <ul>

                <li>Удобоукладываемость</li>

                <li>Средняя плотность</li>

                <li>Объем вовлеченного воздуха</li>

                <li>Расслаиваемость</li>

                <li>Сохраняемость свойств во времени</li>

            </ul>

        </td>

    </tr>

    <tr>

        <th>3</th>

        <td><strong>Растворы</strong></td>

        <td>

            <ul>

                <li>Прочность на сжатие,изгиб</li>

                <li>Водоудерживающая способность</li>

                <li>Расслаиваемость</li>

                <li>Средняя плотность</li>

                <li>Влажность</li>

                <li>Подвижность</li>

                <li>Морозостойкость</li>

            </ul>

        </td>

    </tr>

    <tr>

        <th>4</th>

        <td><strong>Кирпич и камни <br>керамические</strong></td>

        <td>

            <ul>

                <li>Прочность</li>

                <li>Водопоглощение</li>

                <li>Внешний вид, масса</li>

            </ul>

        </td>

    </tr>

    <tr>

        <th>5</th>

        <td><strong>Щебень</strong></td>

        <td>

            <ul>

                <li>Зерновой состав</li>

                <li>Прочность</li>

                <li>Содержание зерен слабых пород</li>

                <li>Содержание пылевидных и глинистых частиц</li>

            </ul>

        </td>

    </tr>

    <tr>

        <th>6</th>

        <td><strong>Песок</strong></td>

        <td>

            <ul>

                <li>Зерновой состав</li>

                <li>Содержание глины в комках</li>

                <li>Содержание пылевидных и глинистых частиц</li>

                <li>Истинная плотность</li>

                <li>Насыпная плотность</li>

                <li>Влажность</li>

            </ul>

        </td>

    </tr>

    <tr>

        <th>7</th>

        <td><strong>Арматурные и закладные изделия сварные, соединения сварные</strong></td>

        <td>

            <ul>

                <li>Растяжение</li>

                <li>Временное сопротивление при разрыве,</li>

                <li>Удлинение и предел текучести, изгиб</li>

            </ul>

        </td>

    </tr>

    <tr>

        <th>8</th>

        <td><strong>Цементы</strong></td>

        <td>

            <ul>

                <li>Тонкость помола</li>

                <li>Нормальная густота, сроки</li>

                <li>схватывания и равномерность</li>

                <li>изменения объема</li>

                <li>Прочность</li>

            </ul>

        </td>

    </tr>

    <tr>

        <th>9</th>

        <td><strong>Бетоны легкие, ячеистые</strong></td>

        <td>

            <ul>

                <li>Прочность</li>

                <li>Плотность</li>

            </ul>

        </td>

    </tr>

    <tr>

        <th>10</th>

        <td>

            <strong>Теплоизоляционные материалы</strong>, в т.ч:

            <br> &mdash; пенополистирол;

            <br> &mdash; плиты минватные

        </td>

        <td>

            <ul>

                <li>Геометрическая форма</li>

                <li>Плотность, влажность, сорбционная влажность</li>

                <li>Водопоглощение,</li>

                <li>

                    прочность на сжатие при 10%-ной линейной деформации, предел прочности при сжатии, изгибе и

                    растяжении, сжимаемость и упругость, гибкость, линейная температурная усадка

                </li>

            </ul>

        </td>

    </tr>

    <tr>

        <th>11</th>

        <td>

            <strong>Отделочные материалы</strong> в т.ч.:

            <br> &mdash; линолеум;

            <br> &mdash; керамическая плитка

        </td>

        <td>

            <ul>

                <li>Геометрические параметры,</li>

                <li>Водопоглощение, предел прочности при изгибе,</li>

                <li>Термическая стойкость глазури</li>

                <li>Изменение линейных размеров,</li>

                <li>Влажность, плотность,</li>

                <li>Неровность по массе</li>

            </ul>

        </td>

    </tr>

    <tr>

        <th>12</th>

        <td><strong>Грунт</strong></td>

        <td>

            <ul>

                <li>Плотность</li>

                <li>Влажность, оптимальная влажность</li>

                <li>Степень уплотнения</li>

            </ul>

        </td>

    </tr>

    <tr>

        <th>13</th>

        <td><strong>Железобетонные конструкции</strong></td>

        <td>

            <ul>

                <li>Толщина защитного слоя</li>

                <li>Расположение арматуры</li>

                <li>Прочность</li>

            </ul>

        </td>

    </tr>

    <tr>

        <th>14</th>

        <td><strong>Материалы рулонные, кровельные и гидроизоляционные</strong></td>

        <td>

            <ul>

                <li>Геометрические параметры</li>

                <li>Водопоглощение</li>

                <li>Теплоустойчивость</li>

                <li>Изменение линейных размеров при нагревании</li>

            </ul>

        </td>

    </tr>

    </tbody>

</table>

<br>

<p>

    Сотрудники нашей лаборатории имеют большой опыт в испытании строительных материалов и конструкций, что приводит к

    высокой производительности и снижению стоимости и сроков оформления отчетной документации. Необходимо отметить, что

    мы работаем только по государственным расценкам и в четко оговоренные сроки. Выезд на стройплощадку и подписание

    договора возможен в день обращения.

</p>

', '', '', '', '', '', 2, '2016-07-07 06:42:54.755319', '2016-07-13 07:20:21.191766', NULL, 0);
INSERT INTO activities VALUES (4, true, true, 'Геодезия и мониторинг', '', '<p>

    Научно-исследовательский центр «Строительная Экспертиза» обладает мощной базой геодезического оборудования,

    позволяющего в кротчайшие сроки выполнять различные работы, связанные с геодезическими измерениями.

</p>

<p>

    Наш научный центр оснащен самым современным оборудованием лидеров-производителей геодезического оборудования, таких

    как Sokkia, Leica и Trimble.

</p>

<p>

    Большой комплект современного оборудования и профессиональный коллектив опытных геодезистов дает возможность решать

    сложные и нестандартные задачи при выполнении геодезического сопровождения строительства.

</p>

<p>

    Геодезические работы, выполняемые Научно-исследовательским центром «Строительная экспертиза», являются комплексным

    видом работ, начинающимися при создании опорной разбивочной сети на строительной площадке и мониторинга за

    прилегающей застройкой, вплоть до оформления исполнительной документации при окончании этапа или всего

    строительства.

</p>

<p>

    Деятельность НИЦ «Строительная экспертиза» всегда была неразрывно связанна с научной и практической деятельностью.

    Именно поэтому мы всегда стремились соответствовать требованиям и рекомендациям государственных стандартов и

    регламентов. Вот почему мы используем в своей работе только сертифицированное геодезическое оборудование и

    материалы. При этом, например, геодезические марки, изготавливаемые на собственной производственной базе, и не

    подлежащие обязательной сертификации, мы отдали на испытания в систему добровольной сертификации «МЕЖРЕГИОНСТАНДАРТ»

    которая после проведения серий лабораторных и натурных испытаний, их сертифицировала, выдав соответствующий

    аттестат.

</p>

<p>

    Наиболее интересной, с точки зрения инжиниринга, является инклинометрия, выполняемая при геодезическом мониторинге

    за состоянием «стены в грунте» или за стволами буровых скважин.

</p>

<p>

    Бесспорно, наиболее ответственным видом измерений является геодезический мониторинг за кренами и осадками зданий.

    Именно поэтому НИЦ «Строительная Экспертиза» имея на своей базе более 10 лазерных нивелиров Trimble и 5 тахеометров

    Sokkia, способна выполнять геодезический мониторинг при возведении промышленных и гражданских зданий любой

    сложности, а также высотных и большепролетных сооружений.

</p>

<p>

    Кроме того, возможность выполнять геодезическое сопровождение строительства при возведении высотных и

    большепролетных конструкций подвержена допусками СРО.

</p>

<p>Перечень работ, выполняемый Научно-исследовательским центром «Строительная Экспертиза»:</p>

<ul>

    <li>Геодезический мониторинг деформаций зданий и сооружений;</li>

    <li>Геотехнический мониторинг;</li>

    <li>Геодезические марки, репера, знаки;</li>

    <li>Инклинометрия;</li>

    <li>Мониторинг «стены в грунте»;</li>

    <li>Фасадная съемка;</li>

    <li>Инженерные изыскания;</li>

    <li>Микронивелирные измерения (наблюдения);</li>

    <li>Геодезическое оборудование;</li>

    <li>Лазерное сканирование;</li>

    <li>Геотехнический мониторинг гидросооружений;</li>

    <li>3D-моделирование зданий;</li>

    <li>Геотехнические и геодезические работы на промышленных предприятиях;</li>

    <li>Деформации железнодорожного полотна;</li>

    <li>Геотехнический мониторинг надземных и подземных коммуникаций;</li>

    <li>Геодезические работы при строительстве коттеджных домов;</li>

    <li>Оценка влияния нового строительства;</li>

    <li>Определение наклонов и кренов вышек связи и труб;</li>

    <li>Обследование с помощью геодезического и геотехнического мониторинга новостроек и старых сооружений;</li>

    <li>Наблюдения за смещением грунтового массива.</li>

</ul>

', '', '', '', '', '', 7, '2016-07-07 06:42:54.763594', '2016-07-13 07:20:33.045422', NULL, 0);
INSERT INTO activities VALUES (6, true, true, 'Энергоэффективность и воздухопроницаемость', '', '<p>

    Под энергетическим аудитом (с целью оформления отчета по энергоаудиту) в настоящее время понимается комплексное

    обследование организаций, предприятий и отдельных объектов по их инициативе или на основании закона. В него входит:

</p>

<ul>

    <li>

        составление карты использования объектом топливно-энергетических ресурсов в соответствии с ФЗ 261 и

        методическими рекомендациями;

    </li>

    <li>разработка организационных и технических мероприятий, направленных на снижение потерь энергии;</li>

    <li>определение потенциала энергосбережения;</li>

    <li>финансовая оценка энергосберегающих мероприятий.</li>

</ul>

<p>

    В Федеральном законе Российской Федерации от 23 ноября 2009 г. № 261-ФЗ «Об энергосбережении и о повышении

    энергетической эффективности и о внесении изменений в отдельные законодательные акты Российской Федерации»

    энергетическое обследование определяется как сбор и обработка информации об использовании энергетических ресурсов

    для получения достоверной информации об объеме используемых энергетических ресурсов, о показателях энергетической

    эффективности, а также выявления возможностей энергосбережения и повышения энергетической эффективности.

</p>

<p>

    Цель комплексного энергоаудита - определение возможной экономии потребляемой энергии, составление отчета и создание

    энергетического паспорта по организации, и также составление карты потребителей энергоресурсов. Конечным итогом

    работы должно стать создание эффективной системы энергетического менеджмента. То есть комплексный энергетический

    аудит должен стать базой для формирования энергополитики предприятия, строящего или эксплуатирующего объект

    энергоаудита. Опыт и практика показывают, что организации и предприятия активно применяют элементы

    энергоменеджмента, разрабатывая и внедряя программы по энергосбережению. В рамках муниципальных и федеральных

    программ ведется замена оборудования, при закупках выбор делается в пользу энрегоэффективного оборудования. Однако

    до сих пор еще не сформирован системный подход и анализ всей проводимой работы. Между тем, комплексный энергоаудит

    нужен всем объектам капитального строительства. Он рассматривает все энергопотребляющее оборудование, предлагает

    максимальную экономию и наиболее широкий выбор мер. Методический сбор данных существенно упрощает анализ и позволяет

    найти подходящие решения, легко реализуемые на практике. Комплексный энергоаудит, в отличие от поверхностного,

    включает в себя анализ всех энергетических затрат и энергопотребления оборудования в здании: систем ОВК (отопления,

    вентиляции и кондиционирования) и воздуховодов; ограждающих конструкций здания (стены, окна, крыша, фундамент,

    изоляция); освещения; нагрузки на электросети (бытовая техника и компьютеры). Также применяются другие меры,

    например, повышение эффективности процессов эксплуатации и технического обслуживания, повышение квалификации

    ответственных сотрудников. Среди задач комплексного энергоаудита - не только на повышении эффективности

    оборудования, но и на создании его оптимальной работы и соответствии требуемой нагрузке, то есть выбирать

    оборудование с мощностью, соответствующей задачам. Однако многие компании занимающиеся "энергоэффективностью", и не

    подозревают, что кроме использования тепловизора для оценки тепловых потерь через ограждающие стеновые конструкции,

    необходимо еще оценить потери через кровлю, вентиляцию, стоковые воды, электрическую сеть и т.д. Они не обследуют

    оборудование, работающее с большими нагрузками, например, системы по отоплению, вентиляции и кондиционированию

    воздуха (ОВК), мощные электродвигатели воздухораспределяющих установок и насосов (однако существенное повышение

    энергоэффективность позволяет отладка настройки неправильно работающих систем ОВК). Компьютеры и периферийное

    оборудование, оборудование мини-кухонь, освещение и светопрозрачные конструкции (окна) также не попадают в отчет

    таких компаний, а они, тем не менее, также обладают энергосберегающим потенциалом. Комплексный подход к энергоаудиту

    зародился более 10 лет назад при проведении проверки энергопотребления жилых зданий. Но энергоаудиторские компании,

    появились на российском рынке в середине 90-х годов. Без учебников и методик, энтузиасты – энергоаудиторы и

    подопытные предприятия начинали энергетические аудиты, основываясь на собственном опыте. Практика показывает, что

    только комплексное моделирование и анализ помогают выявить выявить все виды потерь энергии, в том числе и

    нестандартные. Так, в процессе расчетов пристальное внимание стоит уделить разнице между расчетными и фактическими

    значениями расхода энергии инженерными системами здания. То есть для эффективного и успешного результата

    энергоаудита необходима оценка энергозатрат здания, т.е. сравнение "вводных" мощностей (отопление, горячая вода,

    электричество) и фактического потребления (потери тепла через ограждающие конструкции и вытяжку вентиляции, а также

    температуру канализационных стоков; электрические потребители; потери тепла в трубах горячего водоснабжения).

</p>

<p>

    Помимо этого, нужно учесть взаимное влияние энергосберегающих мероприятий, поскольку их простое, непродуманное

    суммирование может не только не дать эффект экономии, но и наоборот – привести к увеличению расхода энергии.

</p>

<p>

    Сам объект энергоаудита – исследуемое здание - должно рассматриваться как уникальное, а не как одно из множества

    аналогичных объектов. Такой подход сможет выявить ошибки или недочеты в его эксплуатации и найти индивидуальные

    возможности экономии энергии именно для данного здания. В первую очередь этому будет способствовать сбор фактических

    данных, например, по работе системы ОВК: режим эксплуатации оборудования и расход энергии, изменение температуры, и

    т.д. Такой индивидуальный подход способен выявить даже крупные проблемы здания. К примеру, на западе есть даже

    понятие «sick building syndrome» - «синдром больного здания». Это комплексная проблема здания, которое не только не

    является энергоэффективным, но и способно распространять риск заражения людей простудными заболеваниями через

    систему ОВК. Экспертам, производящим комплексный энергоаудит, необходимо ознакомиться с особенностями здания.

    Например, центральные системы ОВК и их системы управления могут создать сложности даже для опытных инженеров. Так, к

    примеру, в высотных зданиях могут образовываться неконтролируемые воздушные потоки, возникающие из-за взаимодействия

    тяги, вытяжных вентиляторов и воздухораспределительных систем повышенного давления. И этот факт и показатели также

    нужно учитывать при комплексном виде обследования. Также при проведении исследования необходимо вводить поправку на

    особенности наружного климата. Проблемой может стать проведение энергоаудита в теплое время года из –за отсутствия

    температурного перепада внутри и снаружи температуры. Выходом может служить применение инновационной технологии -

    так «аэродверей» (blower door). Эта система создана для тепловой диагностики и точного измерения утечек в небольших

    зданиях или объектах с низкой воздухопроницаемостью. Аэродверь помогает выявить воздушные потоки, вместе с которыми

    из здания уходит до 20% тепла. Принцип работы аэродвери таков: в здании создается искусственный перепад давления

    (повышенного и разреженного), и датчики фиксируют источники движения воздушных потоков и, следовательно,

    теплопотерь. Аэродверь может протестировать как небольшой дом, так и полноценный складской комплекс, обеспечивая

    нагнетание огромного потока воздуха (до 42,000 куб.м/час). Поверхностный энергоаудит не брал бы в расчет особенности

    климата. Этот недочет усилил бы тот факт, что требования, предъявляемые ко всему процессу энергоаудита, недостаточно

    подробно сформулированы и жесткие границы между поверхностным и комплексным энергоадитом отсутствуют. Поэтому выбор

    данных и мероприятий зачастую находится лишь в зоне ответственности и профессионализма специалиста, который проводит

    энергоаудит. Отсутствие же подробной информации при выполнении энергоаудита приводит к нечетким рекомендациям и

    отчетам. Между тем необходимо проводить аналитическую обработку полученных данных, с оформлением конкретных

    рекомендаций по повышению энергоэффективности здания. То есть после проведения энергоаудита должен быть сформирован

    пакет рекомендаций – фактически, модель энергоэффективности здания – и карты использования объектом

    топливно-энергетических ресурсов. Эффективные и удачные методики проведения энергоаудита, примененные на практике,

    тот час подхватываются профессиональным сообществом. В США, к примеру, были приняты национальные стандарты по

    энергоаудиту. И именно комплексный подход получил признание и применение при проведении энергоаудита, а упрощенные

    методы сегодня считаются неэффективными.И это вполне объяснимо в современных условиях эксплуатации недвижимости,

    когда энергоаудит становится частью инвестиционного аудита. Простой отчёт по энергоаудиту сегодя уже не

    удовлетворяет потенциального инвестора. Ему нужно предоставить технико-экономическое обоснование каждого

    предлагаемого инвестпроекта, финансовый и организационный план его реализации, схемы мониторинга фактической

    экономии финансовых и энергетических ресурсов. То есть, технически, энергоаудит сегодня должен приводить к созданию

    энергетической модели, которая учитывает всё использование энергии, весь объем затрат и ускоряет окупаемость здания.

</p>

<p>

    Это особенно актуально при темпах подорожания энергоносителей. Минимальные программы энергосбережения с экономией

    энергозатрат на 5 - 7% сегодня не интересны собственникам предприятий. Необходимы инновационные и эффективные

    программы, адекватные вызовам нового времени. Сейчас наступает время сложных комбинированных решений по модернизации

    энергетических и технологических циклов, время проектов коренной реконструкции.

</p>

', '', 'энергоаудит', '', '', '', 9, '2016-07-07 06:42:54.782012', '2016-07-13 07:20:54.91828', NULL, 0);
INSERT INTO activities VALUES (7, true, true, 'Сертификация и аккредитация', '', '<p>

    <strong>Сертификация</strong>

    это процедура подтверждения соответствия, посредством которой независимая от изготовителя (продавца, исполнителя) и

    потребителя (покупателя) организация удостоверяет в письменной форме, что продукция соответствует установленным

    требованиям.

</p>

<p>

    <strong>Сертификат соответствия</strong> &mdash;

    официальный документ, удостоверяющий, что сертифицированная продукция (выполняемая работа, оказываемая услуга,

    проектная документация и т.п.) полностью соответствует требованиям, определенным нормами и правилами Российской

    Федерации.

</p>

<p>АО НИЦ «Строительная экспертиза» предлагает свои услуги в области сертификации (подтверждении соответствия):</p>

<ul>

    <li>материалов (песок, щебень, бетоны, растворы строительные и т.п.);</li>

    <li>изделий (кирпич, железобетонные изделия и т.п.);</li>

    <li>конструкций (балки, фермы и т.п.);</li>

    <li>строительного инструмента, оборудования и оснастки (формы для производства железобетонных изделий и т.п.);</li>

    <li>строительных площадок на различных этапах проведения строительно-монтажных, ремонтно-восстановительных и

        реконструкционных работ на объектах капитального строительства зданий, в т.ч. технически сложных и уникальных;

    </li>

    <li>строительных материалов и конструкций, не имеющих (утративших) паспорта качества;</li>

    <li>строительных изделий и конструкций, изготавливаемых на строительной площадке;</li>

    <li>технологических фундаментов и основания (под краны, дороги, бытовые городки).</li>

</ul>

<p><b>Сертификацию</b> целесообразно проводить в следующих случаях:</p>

<ul>

    <li>отсутствие (утрата) паспортов на материалы, продукцию и конструкции;</li>

    <li>

        отсутствие информации о технических характеристиках продукции и конструкций (состав, геометрия, прочность,

        экологическая безопасность и т.п.);

    </li>

    <li>изготовление строительных конструкций на строительной площадке;</li>

    <li>

        отсутствие паспорта на продукцию (уничтожение, утеря, кража, полное или частичное несоответствие фактическому

        объекту или маркировке на нем и т.п.);

    </li>

    <li>

        необходимость подтверждения соответствия несерийных и уникальных объектов, разработок и конструкций действующим

        нормам и правилам РФ.

    </li>

</ul>

<p>

    <b>Сертификат соответствия</b>

    является аналогом <b>Паспорта продукции</b>. Паспорт изделия может оформить только производитель продукции.

    Отсутствие паспорта на продукцию (уничтожение, утеря, кража, полное или частичное несоответствие фактическому

    объекту или маркировке на нем и т.п.) не позволяет продавцу или приобретателю применять данную продукцию по

    назначению. Единственная возможность использования данной продукции с утраченным паспортом &mdash; получение от

    независимой экспертной организации Экспертного (технического) заключения и Сертификата соответствия.

</p>

<p>

    АО НИЦ «Строительная экспертиза» аккредитовано в Системе добровольной сертификации «Национальный центр сертификации

    и стандартизации» (Система «НЦСС») в качестве:

</p>

<ul>

    <li>органа по сертификации:

        <ul>

            <li>продукции;</li>

            <li>работ (услуг);</li>

            <li>персонала.</li>

        </ul>

    </li>

    <li>органа по сертификации:

        <ul>

            <li>систем менеджмента качества;</li>

            <li>систем экологического менеджмента;</li>

            <li>систем менеджмента управления охраной и безопасностью труда;</li>

            <li>интегрированных систем менеджмента.</li>

        </ul>

    </li>

    <li>испытательной лаборатории, в область аккредитации которой входят:

        <ul>

            <li>строительные материалы, изделия и конструкции;</li>

            <li>металлические изделия и конструкции;</li>

            <li>нерудные строительные материалы;</li>

            <li>строительно-монтажные работы.</li>

        </ul>

    </li>

</ul>

<p>

    Компетентность испытательной лаборатории в составе АО НИЦ «Строительная экспертиза» подтверждена органом по

    аккредитации «Национальный центр сертификации и стандартизации» &mdash; аттестат аккредитации № RU.НЦСС.АЛ.001 от

    24.07.2014 г.

</p>

<p>

    АО НИЦ «Строительная экспертиза» проведены работы по сертификации продукции таких организаций как

    <em>ООО «Сен-Гобен Строительная Продукция Рус»</em>, <em>ООО «ИНТРЕЙ Полимерные Системы»</em>,

    <em>ООО «ФОРМАПЛАСТ»</em>, <em>ООО «ПолиХимГрупп»</em>, <em>ООО «НПО СтройПрогресс»</em> и других.

</p>

', '', 'сертификация, аккредитация', '', '', '', 10, '2016-07-07 06:42:54.794854', '2016-07-13 07:21:21.361239', NULL, 0);
INSERT INTO activities VALUES (8, true, true, 'Электропрогрев', '', '<p>

    В зимнее и холодное время года, когда средняя суточная температура воздуха меньше +5°С и минимальная суточная

    температура ниже 0°С (СНиП 3.03.01-87 пункт 2.53), для требуемого набора прочности железобетонных конструкций,

    необходимо использовать прогрев бетонируемых сооружений. Известны различные способы прогрева железобетонных

    конструкций, но на строительном рынке как самый эффективный, быстрый и экономичный зарекомендовал себя метод

    электропрогрева. Но, к сожалению, строительные компании не дальновидно мало уделяют внимания данному обстоятельству

    и часто полагаются на квалификацию бригадных электриков, которые не способны дать качественного экспертного

    сопровождения прогреваемых конструкций. Электролаборатория АО НИЦ «Строительная экспертиза» предлагает качественно

    пересмотреть и осуществить профессиональную организацию работ по внедрению и сопровождению электропрогрева

    железобетонных конструкций.

</p>

<p>В состав работ входят:</p>

<ul>

    <li>Разработка регламента прогрева бетона;</li>

    <li>Моделирование прогрева бетона в расчётной программе;</li>

    <li>Выбор схемы прогрева бетона по расчётным моделям;</li>

    <li>Установка и пуско-наладка трансформаторов прогрева и кабелей высокого напряжения;</li>

    <li>Шеф-монтаж при установке греющих проводов;</li>

    <li>Проведение круглосуточного мониторинга за процессом прогрева бетона;</li>

    <li>

        Мониторинг набора прочности бетона в специализированной программе по фактическим температурным данным в теле

        прогреваемого бетона;

    </li>

    <li>Рекомендации о времени отключения прогрева и снятия опалубки прогреваемых конструкций;</li>

    <li>

        Рекомендации по уходу за конструкциями после отключения прогрева, после снятия опалубки, учитывая режим и

        условия осуществляемого прогрева;

    </li>

    <li>Оформление температурных листков.</li>

</ul>

', '', '', '', '', '', 3, '2016-07-07 06:42:54.809146', '2016-07-13 07:21:30.970745', '3', 1);
INSERT INTO activities VALUES (9, true, true, 'Натурные испытания', '', '<p>

    Одно из преимуществ Научно-Исследовательского центра «Строительная экспертиза» - возможность проведения

    <strong>натурных испытаний</strong> строительных конструкций. Наиболее востребованными, естественно, является

    определение физико-механических характеристик возведенных конструкций, а также грунтов основания или обратной

    засыпки.

</p>

<p>

    Научно-Исследовательский центр «Строительная экспертиза» выполняет работы по моделированию эксплуатационных нагрузок

    на отдельные элементы здания (сваи, лестницы, перила, распорные анкера фасадных систем, так и на изготавливаемые на

    специализированом полигоне образцы конструкций аналогичные используемым в ходе возведения зданий и сооружений

    (балки, перемычки, ростверки, опоры мачт и другие). При этом использование специализированного оборудования и

    распределительных систем позволяют создавать нагрузки более 300 тонн.

</p>

', '', '', '', '', '', 4, '2016-07-07 06:42:54.818555', '2016-07-13 07:21:41.962991', '3', 1);
INSERT INTO activities VALUES (1, true, true, 'Обследование зданий и сооружений', '', '<p>

    Комплексное <strong>техническое обследование зданий и сооружений</strong> гражданского и промышленного назначения, в

    том числе технически сложных и уникальных, является одним из основных направлений деятельности Научно-технического

    центра «Строительная экспертиза».

</p>

<p>

    И к этому есть все предпосылки. Многолетний опыт работы, современное высокоточное оборудование и, конечно же,

    бригады высококлассных профессионалов - обследователей, конструкторов и расчетчиков.

</p>

<p>

    Каждая бригада состоит не только из обследователей проводящих оценку состояния строительных конструкций и инженерных

    сетей здания, но и специалистов по прочностям, дефектоскопистов, а также расчетчиков, в совершенстве владеющих не

    только плоскостными расчетами конструкций, но и современными расчетными комплексами, такими как SCAD, Лира, Мономах

    и другие.

</p>

<p>

    Одним из основных преимуществ наших Технических отчетов и Экспертных заключений, является полнота и корректность

    предложений в Рекомендациях по дальнейшей эксплуатации зданий, которые формируются на основе выводов по результатам

    проведенного обследования. Вы не встретите в наших отчетах фраз типа «Отремонтировать по отдельно разработанному

    проекту» или «Предусмотреть усиление до начала эксплуатации».

</p>

<p>

    Рекомендации, разрабатываемые нашими специалистами, максимально подробны и представляют собой проектные и

    технологические решения по устранению выявленных дефектов, а также предложения по использованию строительных

    материалов.

</p>

', '', 'обследование зданий, обследование сооружений', 'АО НИЦ «Строительная экспертиза» выполняет обследование зданий и обследование сооружений', '', '', 0, '2016-07-07 06:42:54.738009', '2016-07-13 07:19:59.763903', NULL, 0);
INSERT INTO activities VALUES (5, true, true, 'Судебная экспертиза', '', '<p>

    Научно-исследовательский центр «<strong>Строительная экспертиза</strong>» является членом

    <a href="//www.sudex.ru/" target="_blank"><strong>Палаты судебных экспертов НП «СУДЭКС»</strong></a>

    и обладает большим опытом в проведении различных экспертиз, в том числе судебных и досудебных.

</p>

<p>

    Наши сотрудники являются дипломированными судебно-техническими экспертами, имеют научные степени, высшее специальное

    образование и многолетний опыт работ в:

</p>

<ul>

    <li>

        анализе смет (проектно-сметной документации) на строительство и ремонт, а также составление строительных смет;

    </li>

    <li>

        строительном конструировании, анализе, контроле качества строительных работ и надежности конструкций, экспертизе

        технологии, организации производства работ, экономики строительства;

    </li>

    <li>сборе и обработке информации об использовании энергетических ресурсов для энергетического паспорта;</li>

    <li>

        проведении исследований строительных объектов и территорий, функционально связанных с ними, подготовке

        заключения по поставленным компетентными органами вопросам;

    </li>

    <li>

        оценке безопасности эксплуатации зданий, сооружений, попадающих под действие закона «о промышленной безопасности

        опасных производственных объектов» РД 22-01.97;

    </li>

    <li>экспертном заключении о готовности здания или сооружения к сдаче в эксплуатацию;</li>

    <li>инженерно-техническом обследовании зданий и сооружений различного назначения;</li>

    <li>

        технадзоре при строительстве крупных промышленных или административных объектов, при строительстве и ремонте

        частных коттеджей;

    </li>

    <li>проверке всех строительных работ;</li>

    <li>оценке и переоценке недвижимой собственности.</li>

</ul>

<p>

    Также мы предоставляем весь комплекс работ по лабораторному сопровождению на объектах строительства с проведением

    испытаний и контролем качества материалов, изделий и конструкций.

</p>

', '', 'судебная экспертиза', '', '', '', 8, '2016-07-07 06:42:54.772017', '2016-07-13 07:20:45.835648', NULL, 0);


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('activities_id_seq', 9, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO ar_internal_metadata VALUES ('environment', 'production', '2017-10-05 07:07:07.716246', '2017-10-05 07:07:07.716246');


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO areas VALUES (1, true, 'Обследование зданий и сооружений', 0, '2016-07-08 16:14:50.228997', '2016-07-08 16:14:50.228997');
INSERT INTO areas VALUES (2, true, 'Технический надзор', 1, '2016-07-08 16:14:50.236765', '2016-07-08 16:14:50.236765');
INSERT INTO areas VALUES (3, true, 'Лабораторный контроль', 2, '2016-07-08 16:14:50.244183', '2016-07-08 16:14:50.244183');
INSERT INTO areas VALUES (4, true, 'Геодезия и мониторинг', 3, '2016-07-08 16:14:50.251216', '2016-07-08 16:14:50.251216');
INSERT INTO areas VALUES (5, true, 'Судебная экспертиза', 4, '2016-07-08 16:14:50.258565', '2016-07-08 16:14:50.258565');
INSERT INTO areas VALUES (7, true, 'Сертификация и аккредитация', 6, '2016-07-08 16:14:50.280854', '2016-07-08 16:14:50.280854');
INSERT INTO areas VALUES (6, true, 'Энергоэффективность и воздухопроницаемость', 5, '2016-07-08 16:14:50.273128', '2016-07-09 23:03:23.402207');


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('areas_id_seq', 7, true);


--
-- Data for Name: areas_throughs; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO areas_throughs VALUES (1, 'Target', 1, 1);
INSERT INTO areas_throughs VALUES (2, 'Target', 2, 1);
INSERT INTO areas_throughs VALUES (3, 'Target', 3, 1);
INSERT INTO areas_throughs VALUES (4, 'Target', 3, 3);
INSERT INTO areas_throughs VALUES (5, 'Activity', 1, 1);
INSERT INTO areas_throughs VALUES (6, 'Activity', 2, 2);
INSERT INTO areas_throughs VALUES (7, 'Activity', 3, 3);
INSERT INTO areas_throughs VALUES (8, 'Activity', 4, 4);
INSERT INTO areas_throughs VALUES (9, 'Activity', 5, 5);
INSERT INTO areas_throughs VALUES (10, 'Activity', 6, 6);
INSERT INTO areas_throughs VALUES (12, 'Activity', 8, 3);
INSERT INTO areas_throughs VALUES (13, 'Activity', 9, 3);
INSERT INTO areas_throughs VALUES (14, 'Activity', 7, 7);


--
-- Name: areas_throughs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('areas_throughs_id_seq', 14, true);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: dev
--



--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('articles_id_seq', 1, false);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO customers VALUES (3, true, true, 'Группа Компаний «ПИК»', '<p>Является одним из ведущих российских публичных девелоперов масштабных жилых проектов в Москве, Московской области и других регионах России. Основанна в 1994 году.</p><p>Приоритетное направление деятельности Группы — строительство и реализация доступного жилья, преимущественно в сегменте панельного индустриального домостроения. Земельный банк компании по состоянию на 31 декабря 2014 г. составил 5,2 млн. м<sup>2</sup>. С начала деятельности Группа Компаний ПИК построила около 15 млн. м<sup>2</sup> жилой недвижимости (более 250.000 квартир). Компания включена в перечень системообразующих предприятий российской экономики.</p>', '', '+7 (495) 505-97-33', '123242, Россия, г. Москва, ул. Баррикадная, д. 19 стр.1', '55.760309 37.579869', '//pik-group.ru', 'pik_group.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, '2016-07-08 20:12:45.014797', '2016-07-11 01:52:52.682591');
INSERT INTO customers VALUES (2, true, true, 'Компания «MR Group»', '<p>Успешно работает на российском рынке с 2003 года и является одним из лидеров в девелопменте жилой и коммерческой недвижимости.</p><p>Является членом таких профессиональных организаций, как Гильдия управляющих и девелоперов, Национальное агентство малоэтажного и коттеджного строительства (НАМИКС), Ассоциация индустриальных парков России, Экспертный совет по развитию комфортного и доступного жилья при Минстрое России, Агентство стратегических инициатив (АСИ), учредителем которого является Правительство Российской Федерации, общероссийская общественная организация «Деловая Россия», входит в Клуб инвесторов Москвы.</p>', '', '+7 (495) 797-55-22', '125167, Россия, г. Москва, 4-я ул. 8 Марта, д. 6а БЦ «Аэропорт»', '55.803629 37.550215', '//mr-group.ru', 'mr_group.png', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2016-07-08 19:38:02.337537', '2016-07-11 01:53:46.833353');
INSERT INTO customers VALUES (1, true, true, 'Девелоперская компания «ДОНСТРОЙ»', '<p>Ведущая девелоперская компания Москвы в высших сегментах жилой недвижимости — Business, Premium и De Luxe, работающая на рынке недвижимости с 1994 года.</p><p>Портфель построенных и строящихся объектов включает более 6.000.000 м<sup>2</sup> площадей. Наиболее известные проекты компании — жилые комплексы «Алые Паруса», «Воробьевы Горы», «Триумф-Палас», «Дом на Мосфильмовской» и другие элитные новостройки.</p>', '', '+7 (495) 266-72-04', '119590, Россия, г. Москва, ул. Мосфильмовская, д. 70', '55.714712 37.504576', '//donstroy.com', 'donstroy.png', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2016-07-08 17:00:23.087595', '2016-07-11 01:55:10.814743');


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('customers_id_seq', 3, true);


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: dev
--



--
-- Name: feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('feedbacks_id_seq', 1, false);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO images VALUES (1, '', NULL, '', '00.jpg', true, 0, 'Activity', 1, '2016-07-08 16:18:48.625756', '2016-07-08 16:18:48.625756');
INSERT INTO images VALUES (2, '', NULL, '', '01.jpg', true, 1, 'Activity', 1, '2016-07-08 16:18:49.627079', '2016-07-08 16:18:49.627079');
INSERT INTO images VALUES (3, '', NULL, '', '02.jpg', true, 2, 'Activity', 1, '2016-07-08 16:18:50.638391', '2016-07-08 16:18:50.638391');
INSERT INTO images VALUES (4, '', NULL, '', '03.jpg', true, 3, 'Activity', 1, '2016-07-08 16:18:51.67624', '2016-07-08 16:18:51.67624');
INSERT INTO images VALUES (5, '', NULL, '', '04.jpg', true, 4, 'Activity', 1, '2016-07-08 16:18:52.664331', '2016-07-08 16:18:52.664331');
INSERT INTO images VALUES (6, '', NULL, '', '10.jpg', true, 5, 'Activity', 1, '2016-07-08 16:18:53.633063', '2016-07-08 16:18:53.633063');
INSERT INTO images VALUES (7, '', NULL, '', '11.jpg', true, 6, 'Activity', 1, '2016-07-08 16:18:54.436076', '2016-07-08 16:18:54.436076');
INSERT INTO images VALUES (8, '', NULL, '', '12.jpg', true, 7, 'Activity', 1, '2016-07-08 16:18:55.218123', '2016-07-08 16:18:55.218123');
INSERT INTO images VALUES (9, '', NULL, '', '13.jpg', true, 8, 'Activity', 1, '2016-07-08 16:18:55.934801', '2016-07-08 16:18:55.934801');
INSERT INTO images VALUES (10, '', NULL, '', '14.jpg', true, 9, 'Activity', 1, '2016-07-08 16:18:56.718313', '2016-07-08 16:18:56.718313');
INSERT INTO images VALUES (11, '', NULL, '', '15.jpg', true, 10, 'Activity', 1, '2016-07-08 16:18:57.505151', '2016-07-08 16:18:57.505151');
INSERT INTO images VALUES (12, '', NULL, '', 'svidetelstvo_nic_sudex.jpg', false, 0, 'Activity', 5, '2016-07-08 16:20:51.862988', '2016-07-08 16:20:51.862988');
INSERT INTO images VALUES (13, '', NULL, '', 'brateevo.jpg', true, 0, 'Activity', 6, '2016-07-08 16:21:14.275462', '2016-07-08 16:21:14.275462');
INSERT INTO images VALUES (14, '', NULL, '', '00.jpg', false, 0, 'Activity', 7, '2016-07-08 16:21:58.075849', '2016-07-08 16:21:58.075849');
INSERT INTO images VALUES (15, '', NULL, '', '01.jpg', false, 1, 'Activity', 7, '2016-07-08 16:22:01.009235', '2016-07-08 16:22:01.009235');
INSERT INTO images VALUES (16, '', NULL, '', '10.jpg', false, 2, 'Activity', 7, '2016-07-08 16:22:04.020266', '2016-07-08 16:22:04.020266');
INSERT INTO images VALUES (25, '', NULL, '', '00.jpg', true, 0, 'Target', 1, '2016-07-09 07:16:45.996307', '2016-07-09 07:16:45.996307');
INSERT INTO images VALUES (26, '', NULL, '', '01.jpg', true, 1, 'Target', 1, '2016-07-09 07:16:47.110194', '2016-07-09 07:16:47.110194');
INSERT INTO images VALUES (27, '', NULL, '', '02.jpg', true, 2, 'Target', 1, '2016-07-09 07:16:48.418343', '2016-07-09 07:16:48.418343');
INSERT INTO images VALUES (28, '', NULL, '', '03.jpg', true, 3, 'Target', 1, '2016-07-09 07:16:49.668696', '2016-07-09 07:16:49.668696');
INSERT INTO images VALUES (29, '', NULL, '', '04.jpg', true, 4, 'Target', 1, '2016-07-09 07:16:51.030378', '2016-07-09 07:16:51.030378');
INSERT INTO images VALUES (30, '', NULL, '', '05.jpg', true, 5, 'Target', 1, '2016-07-09 07:16:52.194524', '2016-07-09 07:16:52.194524');
INSERT INTO images VALUES (31, '', NULL, '', '06.jpg', true, 6, 'Target', 1, '2016-07-09 07:16:53.288844', '2016-07-09 07:16:53.288844');
INSERT INTO images VALUES (32, '', NULL, '', '00.jpg', true, 0, 'Target', 2, '2016-07-09 07:39:06.271114', '2016-07-09 07:39:06.271114');
INSERT INTO images VALUES (33, '', NULL, '', '01.jpg', true, 1, 'Target', 2, '2016-07-09 07:39:08.002598', '2016-07-09 07:39:08.002598');
INSERT INTO images VALUES (34, '', NULL, '', '02.jpg', true, 2, 'Target', 2, '2016-07-09 07:39:09.718735', '2016-07-09 07:39:09.718735');
INSERT INTO images VALUES (35, '', NULL, '', '03.jpg', true, 3, 'Target', 2, '2016-07-09 07:39:11.401239', '2016-07-09 07:39:11.401239');
INSERT INTO images VALUES (36, '', NULL, '', '04.jpg', true, 4, 'Target', 2, '2016-07-09 07:39:12.988299', '2016-07-09 07:39:12.988299');
INSERT INTO images VALUES (37, '', NULL, '', '05.jpg', true, 5, 'Target', 2, '2016-07-09 07:39:14.605033', '2016-07-09 07:39:14.605033');
INSERT INTO images VALUES (38, '', NULL, '', '06.jpg', true, 6, 'Target', 2, '2016-07-09 07:39:16.32476', '2016-07-09 07:39:16.32476');
INSERT INTO images VALUES (39, '', NULL, '', '00.jpg', true, 0, 'Target', 3, '2016-07-09 08:09:53.50768', '2016-07-09 08:09:53.50768');
INSERT INTO images VALUES (40, '', NULL, '', '01.jpg', true, 1, 'Target', 3, '2016-07-09 08:09:55.476563', '2016-07-09 08:09:55.476563');
INSERT INTO images VALUES (41, '', NULL, '', '02.jpg', true, 2, 'Target', 3, '2016-07-09 08:09:57.445773', '2016-07-09 08:09:57.445773');
INSERT INTO images VALUES (42, '', NULL, '', '03.jpg', true, 3, 'Target', 3, '2016-07-09 08:09:59.577854', '2016-07-09 08:09:59.577854');
INSERT INTO images VALUES (43, '', NULL, '', '04.jpg', true, 4, 'Target', 3, '2016-07-09 08:10:01.596431', '2016-07-09 08:10:01.596431');
INSERT INTO images VALUES (44, '', NULL, '', '05.jpg', true, 5, 'Target', 3, '2016-07-09 08:10:03.481646', '2016-07-09 08:10:03.481646');
INSERT INTO images VALUES (45, '', NULL, '', '06.jpg', true, 6, 'Target', 3, '2016-07-09 08:10:05.379972', '2016-07-09 08:10:05.379972');


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('images_id_seq', 45, true);


--
-- Data for Name: permits; Type: TABLE DATA; Schema: public; Owner: dev
--



--
-- Name: permits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('permits_id_seq', 1, false);


--
-- Data for Name: publishes; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO publishes VALUES (1, true, '2014-08-14', 'Комплексный строительный надзор: требования и необходимость', '', '1', NULL, '', '', '', '', '', '2016-07-16 09:18:25.80378', '2016-07-16 09:18:25.80378');
INSERT INTO publishes VALUES (2, true, '2014-08-14', 'Оценка развития и модернизации промышленных территорий на территориях российских мегаполисов', '', '2', NULL, '', '', '', '', '', '2016-07-16 12:10:42.698453', '2016-07-16 12:10:42.698453');


--
-- Name: publishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('publishes_id_seq', 2, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO schema_migrations VALUES ('20160401000000');
INSERT INTO schema_migrations VALUES ('20160401000001');
INSERT INTO schema_migrations VALUES ('20160401000100');
INSERT INTO schema_migrations VALUES ('20160401000200');
INSERT INTO schema_migrations VALUES ('20160401000300');
INSERT INTO schema_migrations VALUES ('20160401000301');
INSERT INTO schema_migrations VALUES ('20160401000400');
INSERT INTO schema_migrations VALUES ('20160401000500');
INSERT INTO schema_migrations VALUES ('20160401000600');
INSERT INTO schema_migrations VALUES ('20160401000601');
INSERT INTO schema_migrations VALUES ('20160401000700');
INSERT INTO schema_migrations VALUES ('20160401000800');
INSERT INTO schema_migrations VALUES ('20160401000900');
INSERT INTO schema_migrations VALUES ('20160401001000');


--
-- Data for Name: targets; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO targets VALUES (3, true, 2, NULL, NULL, 'Многофункциональный комплекс «Водный»', '<p>Лабораторный контроль качества бетонных работ строящегося многофункционального комплекса (1-ой очереди).</p>', '125212, Россия, г. Москва, Головинское шоссе, д. 5', '55.840210 37.491959', '//mfkvodny.ru', '', '', '', '', '', 2, 2, '2016-07-09 07:57:19.393945', '2016-07-11 04:56:32.124057');
INSERT INTO targets VALUES (2, true, 1, NULL, NULL, 'Жилой комплекс «Суббота»', '<ul>

    <li>Обследование существующих зданий Научно Исследовательского Тракторного института" (НАТИ), предназначенных под снос;</li>

    <li>Разработка и регистрация Регламента обращения с отходами;</li>

    <li>Разработка Проекта производства работ по сносу здания.</li>

</ul>', '125040, Россия, г. Москва, ул. Верхняя, д. 34', '55.779028 37.574552', '//donstroy.com/objects/subbota', '', '', '', '', '', 1, 1, '2016-07-09 07:36:29.208033', '2016-07-11 04:56:44.966057');
INSERT INTO targets VALUES (1, true, 0, NULL, NULL, 'Завод «Серп и Молот»', '<p>Обследование комплекса производственных зданий.</p>', '111033, Россия, г. Москва, ул. Золоторожский вал, вл. 11', '55.752571 37.701272', '//sim-st.com', '', '', '', '', '', 0, 1, '2016-07-09 06:34:09.307132', '2016-07-11 04:56:52.654545');


--
-- Name: targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('targets_id_seq', 3, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO users VALUES (2, 'manager@test.test', '$2a$11$jy1re6gKAN6XLj40A9iIT.UsyCYXc7PctH2WTleSKkGtg/xjVwYx6', NULL, 0, NULL, NULL, NULL, NULL, '2016-07-08 16:14:50.015432', '2016-07-08 16:14:50.015432', false, true, 'Менеджер', NULL, NULL);
INSERT INTO users VALUES (3, 'client@test.test', '$2a$11$9KgpZpuqoFLjjEx5K8fcleD.OJggkefRaDVf.9bi09oGGCSuBhmj6', NULL, 0, NULL, NULL, NULL, NULL, '2016-07-08 16:14:50.206213', '2016-07-08 16:14:50.206213', false, false, 'Клиент', NULL, NULL);
INSERT INTO users VALUES (1, 'admin@test.test', '$2a$11$1LFQjBE5V39JJz/wKWWj3OikvKM.rOsx6qrbFSSCmS/CMWgrrMp2u', '2017-10-05 14:52:24.957192', 10, '2017-10-07 00:56:33.736925', '2017-10-05 14:52:24.983584', '176.15.198.60', '213.87.161.70', '2016-07-08 16:14:49.822523', '2017-10-07 00:56:33.740525', true, true, 'Администратор', NULL, NULL);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: areas_throughs areas_throughs_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY areas_throughs
    ADD CONSTRAINT areas_throughs_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: permits permits_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY permits
    ADD CONSTRAINT permits_pkey PRIMARY KEY (id);


--
-- Name: publishes publishes_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY publishes
    ADD CONSTRAINT publishes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: targets targets_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY targets
    ADD CONSTRAINT targets_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
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
-- Name: areas_throughs fk_rails_68743d2681; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY areas_throughs
    ADD CONSTRAINT fk_rails_68743d2681 FOREIGN KEY (area_id) REFERENCES areas(id) ON DELETE CASCADE;


--
-- Name: feedbacks fk_rails_7b367dd0ea; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY feedbacks
    ADD CONSTRAINT fk_rails_7b367dd0ea FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL;


--
-- Name: customers fk_rails_9917eeaf5d; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT fk_rails_9917eeaf5d FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;


--
-- Name: targets fk_rails_ab6f606f28; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY targets
    ADD CONSTRAINT fk_rails_ab6f606f28 FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL;


--
-- Name: public; Type: ACL; Schema: -; Owner: dev
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
GRANT ALL ON SCHEMA public TO dev;


--
-- PostgreSQL database dump complete
--

