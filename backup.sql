PGDMP                         x            travel "   10.13 (Ubuntu 10.13-1.pgdg18.04+1)     11.8 (Ubuntu 11.8-1.pgdg18.04+1) s               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    66952    travel    DATABASE     x   CREATE DATABASE travel WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE travel;
             postgres    false            �            1255    66953    convertnonunicode(text)    FUNCTION     
  CREATE FUNCTION public.convertnonunicode(x text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
 cdau text; kdau text; r text;
BEGIN
 cdau = 'áàảãạâấầẩẫậăắằẳẵặđéèẻẽẹêếềểễệíìỉĩịóòỏõọôốồổỗộơớờởỡợúùủũụưứừửữựýỳỷỹỵÁÀẢÃẠÂẤẦẨẪẬĂẮẰẲẴẶĐÉÈẺẼẸÊẾỀỂỄỆÍÌỈĨỊÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢÚÙỦŨỤƯỨỪỬỮỰÝỲỶỸỴ';
 kdau = 'aaaaaaaaaaaaaaaaadeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyAAAAAAAAAAAAAAAAADEEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYY';
 r = x;
 FOR i IN 0..length(cdau)
 LOOP
 r = replace(r, substr(cdau,i,1), substr(kdau,i,1));
 END LOOP;
 RETURN r;
END;
$$;
 0   DROP FUNCTION public.convertnonunicode(x text);
       public       postgres    false            �            1259    66954    areas    TABLE     �   CREATE TABLE public.areas (
    id integer NOT NULL,
    name character varying(250),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.areas;
       public         postgres    false            �            1259    66957    areas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.areas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.areas_id_seq;
       public       postgres    false    196                       0    0    areas_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;
            public       postgres    false    197            �            1259    66959    comments    TABLE     �   CREATE TABLE public.comments (
    id integer NOT NULL,
    user_name character varying(100),
    content text,
    tour_info_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    status integer
);
    DROP TABLE public.comments;
       public         postgres    false            �            1259    66965    comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public       postgres    false    198                       0    0    comments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;
            public       postgres    false    199            �            1259    66967 	   feedbacks    TABLE     #  CREATE TABLE public.feedbacks (
    id integer NOT NULL,
    user_name character varying(100),
    email character varying(255),
    title character varying(255),
    content text,
    status integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.feedbacks;
       public         postgres    false            �            1259    66973    feedbacks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.feedbacks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.feedbacks_id_seq;
       public       postgres    false    200            	           0    0    feedbacks_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.feedbacks_id_seq OWNED BY public.feedbacks.id;
            public       postgres    false    201            �            1259    66975    goose_db_version    TABLE     �   CREATE TABLE public.goose_db_version (
    id integer NOT NULL,
    version_id bigint NOT NULL,
    is_applied boolean NOT NULL,
    tstamp timestamp without time zone DEFAULT now()
);
 $   DROP TABLE public.goose_db_version;
       public         postgres    false            �            1259    66979    goose_db_version_id_seq    SEQUENCE     �   CREATE SEQUENCE public.goose_db_version_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.goose_db_version_id_seq;
       public       postgres    false    202            
           0    0    goose_db_version_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.goose_db_version_id_seq OWNED BY public.goose_db_version.id;
            public       postgres    false    203            �            1259    72684    home_provinces    TABLE     �   CREATE TABLE public.home_provinces (
    province_id integer NOT NULL,
    name character varying(50),
    url text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 "   DROP TABLE public.home_provinces;
       public         postgres    false            �            1259    72682    home_provinces_province_id_seq    SEQUENCE     �   CREATE SEQUENCE public.home_provinces_province_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.home_provinces_province_id_seq;
       public       postgres    false    221                       0    0    home_provinces_province_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.home_provinces_province_id_seq OWNED BY public.home_provinces.province_id;
            public       postgres    false    220            �            1259    66981    images    TABLE     �   CREATE TABLE public.images (
    id integer NOT NULL,
    url text,
    tour_info_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    description text
);
    DROP TABLE public.images;
       public         postgres    false            �            1259    66987    images_id_seq    SEQUENCE     �   CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.images_id_seq;
       public       postgres    false    204                       0    0    images_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;
            public       postgres    false    205            �            1259    66989    orders    TABLE     �  CREATE TABLE public.orders (
    id integer NOT NULL,
    tour_id integer NOT NULL,
    user_name character varying(255) NOT NULL,
    phone character varying(15) NOT NULL,
    address character varying(255) NOT NULL,
    user_id integer,
    passenger integer,
    description text,
    status integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.orders;
       public         postgres    false            �            1259    66995    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public       postgres    false    206                       0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
            public       postgres    false    207            �            1259    66997 	   provinces    TABLE     �   CREATE TABLE public.provinces (
    id integer NOT NULL,
    name character varying(50),
    area_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.provinces;
       public         postgres    false            �            1259    67000    provinces_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provinces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.provinces_id_seq;
       public       postgres    false    208                       0    0    provinces_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.provinces_id_seq OWNED BY public.provinces.id;
            public       postgres    false    209            �            1259    67002    roles    TABLE     �   CREATE TABLE public.roles (
    id integer NOT NULL,
    role character varying(50) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.roles;
       public         postgres    false            �            1259    67005    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public       postgres    false    210                       0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
            public       postgres    false    211            �            1259    67007 
   tour_infos    TABLE       CREATE TABLE public.tour_infos (
    id integer NOT NULL,
    title text NOT NULL,
    detail text,
    price numeric NOT NULL,
    status integer,
    tour_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.tour_infos;
       public         postgres    false            �            1259    67013    tour_infos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tour_infos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tour_infos_id_seq;
       public       postgres    false    212                       0    0    tour_infos_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.tour_infos_id_seq OWNED BY public.tour_infos.id;
            public       postgres    false    213            �            1259    67015    tours    TABLE     �   CREATE TABLE public.tours (
    id integer NOT NULL,
    name text NOT NULL,
    image text,
    province_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.tours;
       public         postgres    false            �            1259    67021    tours_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tours_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tours_id_seq;
       public       postgres    false    214                       0    0    tours_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tours_id_seq OWNED BY public.tours.id;
            public       postgres    false    215            �            1259    67023 
   user_roles    TABLE     �   CREATE TABLE public.user_roles (
    user_id integer NOT NULL,
    role_id character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.user_roles;
       public         postgres    false            �            1259    67026    user_roles_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_roles_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.user_roles_user_id_seq;
       public       postgres    false    216                       0    0    user_roles_user_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.user_roles_user_id_seq OWNED BY public.user_roles.user_id;
            public       postgres    false    217            �            1259    67028    users    TABLE     R  CREATE TABLE public.users (
    id integer NOT NULL,
    user_name character varying(255) NOT NULL,
    password text,
    name character varying(255) NOT NULL,
    email character varying(255),
    phone character varying(15),
    status integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.users;
       public         postgres    false            �            1259    67034    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    218                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       postgres    false    219            3           2604    67036    areas id    DEFAULT     d   ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);
 7   ALTER TABLE public.areas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            4           2604    67037    comments id    DEFAULT     j   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            5           2604    67038    feedbacks id    DEFAULT     l   ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedbacks_id_seq'::regclass);
 ;   ALTER TABLE public.feedbacks ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200            7           2604    67039    goose_db_version id    DEFAULT     z   ALTER TABLE ONLY public.goose_db_version ALTER COLUMN id SET DEFAULT nextval('public.goose_db_version_id_seq'::regclass);
 B   ALTER TABLE public.goose_db_version ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202            @           2604    72687    home_provinces province_id    DEFAULT     �   ALTER TABLE ONLY public.home_provinces ALTER COLUMN province_id SET DEFAULT nextval('public.home_provinces_province_id_seq'::regclass);
 I   ALTER TABLE public.home_provinces ALTER COLUMN province_id DROP DEFAULT;
       public       postgres    false    220    221    221            8           2604    67040 	   images id    DEFAULT     f   ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);
 8   ALTER TABLE public.images ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204            9           2604    67041 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206            :           2604    67042    provinces id    DEFAULT     l   ALTER TABLE ONLY public.provinces ALTER COLUMN id SET DEFAULT nextval('public.provinces_id_seq'::regclass);
 ;   ALTER TABLE public.provinces ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            ;           2604    67043    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210            <           2604    67044    tour_infos id    DEFAULT     n   ALTER TABLE ONLY public.tour_infos ALTER COLUMN id SET DEFAULT nextval('public.tour_infos_id_seq'::regclass);
 <   ALTER TABLE public.tour_infos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212            =           2604    67045    tours id    DEFAULT     d   ALTER TABLE ONLY public.tours ALTER COLUMN id SET DEFAULT nextval('public.tours_id_seq'::regclass);
 7   ALTER TABLE public.tours ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214            >           2604    67046    user_roles user_id    DEFAULT     x   ALTER TABLE ONLY public.user_roles ALTER COLUMN user_id SET DEFAULT nextval('public.user_roles_user_id_seq'::regclass);
 A   ALTER TABLE public.user_roles ALTER COLUMN user_id DROP DEFAULT;
       public       postgres    false    217    216            ?           2604    67047    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    218            �          0    66954    areas 
   TABLE DATA               A   COPY public.areas (id, name, created_at, updated_at) FROM stdin;
    public       postgres    false    196   .~       �          0    66959    comments 
   TABLE DATA               h   COPY public.comments (id, user_name, content, tour_info_id, created_at, updated_at, status) FROM stdin;
    public       postgres    false    198   �~       �          0    66967 	   feedbacks 
   TABLE DATA               i   COPY public.feedbacks (id, user_name, email, title, content, status, created_at, updated_at) FROM stdin;
    public       postgres    false    200   �~       �          0    66975    goose_db_version 
   TABLE DATA               N   COPY public.goose_db_version (id, version_id, is_applied, tstamp) FROM stdin;
    public       postgres    false    202   �~                  0    72684    home_provinces 
   TABLE DATA               X   COPY public.home_provinces (province_id, name, url, created_at, updated_at) FROM stdin;
    public       postgres    false    221   �       �          0    66981    images 
   TABLE DATA               \   COPY public.images (id, url, tour_info_id, created_at, updated_at, description) FROM stdin;
    public       postgres    false    204   �       �          0    66989    orders 
   TABLE DATA               �   COPY public.orders (id, tour_id, user_name, phone, address, user_id, passenger, description, status, created_at, updated_at) FROM stdin;
    public       postgres    false    206   ͓       �          0    66997 	   provinces 
   TABLE DATA               N   COPY public.provinces (id, name, area_id, created_at, updated_at) FROM stdin;
    public       postgres    false    208   &�       �          0    67002    roles 
   TABLE DATA               A   COPY public.roles (id, role, created_at, updated_at) FROM stdin;
    public       postgres    false    210   ��       �          0    67007 
   tour_infos 
   TABLE DATA               g   COPY public.tour_infos (id, title, detail, price, status, tour_id, created_at, updated_at) FROM stdin;
    public       postgres    false    212   K�       �          0    67015    tours 
   TABLE DATA               U   COPY public.tours (id, name, image, province_id, created_at, updated_at) FROM stdin;
    public       postgres    false    214   ��       �          0    67023 
   user_roles 
   TABLE DATA               N   COPY public.user_roles (user_id, role_id, created_at, updated_at) FROM stdin;
    public       postgres    false    216   1�       �          0    67028    users 
   TABLE DATA               l   COPY public.users (id, user_name, password, name, email, phone, status, created_at, updated_at) FROM stdin;
    public       postgres    false    218   ��                  0    0    areas_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.areas_id_seq', 3, true);
            public       postgres    false    197                       0    0    comments_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comments_id_seq', 1, false);
            public       postgres    false    199                       0    0    feedbacks_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.feedbacks_id_seq', 1, false);
            public       postgres    false    201                       0    0    goose_db_version_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.goose_db_version_id_seq', 13, true);
            public       postgres    false    203                       0    0    home_provinces_province_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.home_provinces_province_id_seq', 1, false);
            public       postgres    false    220                       0    0    images_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.images_id_seq', 1, false);
            public       postgres    false    205                       0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 8, true);
            public       postgres    false    207                       0    0    provinces_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.provinces_id_seq', 1, false);
            public       postgres    false    209                       0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 2, true);
            public       postgres    false    211                       0    0    tour_infos_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.tour_infos_id_seq', 35, true);
            public       postgres    false    213                       0    0    tours_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tours_id_seq', 1, false);
            public       postgres    false    215                       0    0    user_roles_user_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.user_roles_user_id_seq', 1, false);
            public       postgres    false    217                        0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 7, true);
            public       postgres    false    219            B           2606    67049    areas areas_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.areas DROP CONSTRAINT areas_pkey;
       public         postgres    false    196            F           2606    67051    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public         postgres    false    198            J           2606    67053    feedbacks feedbacks_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.feedbacks DROP CONSTRAINT feedbacks_pkey;
       public         postgres    false    200            L           2606    67055 &   goose_db_version goose_db_version_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.goose_db_version
    ADD CONSTRAINT goose_db_version_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.goose_db_version DROP CONSTRAINT goose_db_version_pkey;
       public         postgres    false    202            m           2606    72692 "   home_provinces home_provinces_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.home_provinces
    ADD CONSTRAINT home_provinces_pkey PRIMARY KEY (province_id);
 L   ALTER TABLE ONLY public.home_provinces DROP CONSTRAINT home_provinces_pkey;
       public         postgres    false    221            O           2606    67057    images images_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public         postgres    false    204            S           2606    67059    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public         postgres    false    206            Y           2606    67061    provinces provinces_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.provinces DROP CONSTRAINT provinces_pkey;
       public         postgres    false    208            \           2606    67063    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         postgres    false    210            _           2606    67065    tour_infos tour_infos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tour_infos
    ADD CONSTRAINT tour_infos_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.tour_infos DROP CONSTRAINT tour_infos_pkey;
       public         postgres    false    212            c           2606    67067    tours tours_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tours
    ADD CONSTRAINT tours_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tours DROP CONSTRAINT tours_pkey;
       public         postgres    false    214            g           2606    67069    user_roles user_roles_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public         postgres    false    216            j           2606    67071    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    218            C           1259    67072    ares_id_idx    INDEX     ;   CREATE INDEX ares_id_idx ON public.areas USING btree (id);
    DROP INDEX public.ares_id_idx;
       public         postgres    false    196            D           1259    67073    comments_id_idx    INDEX     B   CREATE INDEX comments_id_idx ON public.comments USING btree (id);
 #   DROP INDEX public.comments_id_idx;
       public         postgres    false    198            G           1259    67074    comments_tour_info_id    INDEX     R   CREATE INDEX comments_tour_info_id ON public.comments USING btree (tour_info_id);
 )   DROP INDEX public.comments_tour_info_id;
       public         postgres    false    198            H           1259    67075    feedbacks_id_idx    INDEX     D   CREATE INDEX feedbacks_id_idx ON public.feedbacks USING btree (id);
 $   DROP INDEX public.feedbacks_id_idx;
       public         postgres    false    200            k           1259    72693    home_provinces_id_idx    INDEX     W   CREATE INDEX home_provinces_id_idx ON public.home_provinces USING btree (province_id);
 )   DROP INDEX public.home_provinces_id_idx;
       public         postgres    false    221            M           1259    67076    images_id_idx    INDEX     >   CREATE INDEX images_id_idx ON public.images USING btree (id);
 !   DROP INDEX public.images_id_idx;
       public         postgres    false    204            P           1259    67077    images_tour_info_id_idx    INDEX     R   CREATE INDEX images_tour_info_id_idx ON public.images USING btree (tour_info_id);
 +   DROP INDEX public.images_tour_info_id_idx;
       public         postgres    false    204            Q           1259    67078    orders_id_idx    INDEX     >   CREATE INDEX orders_id_idx ON public.orders USING btree (id);
 !   DROP INDEX public.orders_id_idx;
       public         postgres    false    206            T           1259    67079    orders_tour_id_idx    INDEX     H   CREATE INDEX orders_tour_id_idx ON public.orders USING btree (tour_id);
 &   DROP INDEX public.orders_tour_id_idx;
       public         postgres    false    206            U           1259    67080    orders_user_id_idx    INDEX     H   CREATE INDEX orders_user_id_idx ON public.orders USING btree (user_id);
 &   DROP INDEX public.orders_user_id_idx;
       public         postgres    false    206            V           1259    67081    provinces_area_id_idx    INDEX     N   CREATE INDEX provinces_area_id_idx ON public.provinces USING btree (area_id);
 )   DROP INDEX public.provinces_area_id_idx;
       public         postgres    false    208            W           1259    67082    provinces_id_idx    INDEX     D   CREATE INDEX provinces_id_idx ON public.provinces USING btree (id);
 $   DROP INDEX public.provinces_id_idx;
       public         postgres    false    208            Z           1259    67083    roles_id_idx    INDEX     <   CREATE INDEX roles_id_idx ON public.roles USING btree (id);
     DROP INDEX public.roles_id_idx;
       public         postgres    false    210            ]           1259    67084    tour_infos_id_idx    INDEX     F   CREATE INDEX tour_infos_id_idx ON public.tour_infos USING btree (id);
 %   DROP INDEX public.tour_infos_id_idx;
       public         postgres    false    212            `           1259    67085    tour_infos_province_id_idx    INDEX     T   CREATE INDEX tour_infos_province_id_idx ON public.tour_infos USING btree (tour_id);
 .   DROP INDEX public.tour_infos_province_id_idx;
       public         postgres    false    212            a           1259    67086    tours_id_idx    INDEX     <   CREATE INDEX tours_id_idx ON public.tours USING btree (id);
     DROP INDEX public.tours_id_idx;
       public         postgres    false    214            d           1259    67087    user_role_role_id_idx    INDEX     O   CREATE INDEX user_role_role_id_idx ON public.user_roles USING btree (role_id);
 )   DROP INDEX public.user_role_role_id_idx;
       public         postgres    false    216            e           1259    67088    user_role_user_id_idx    INDEX     O   CREATE INDEX user_role_user_id_idx ON public.user_roles USING btree (user_id);
 )   DROP INDEX public.user_role_user_id_idx;
       public         postgres    false    216            h           1259    67089    users_id_idx    INDEX     <   CREATE INDEX users_id_idx ON public.users USING btree (id);
     DROP INDEX public.users_id_idx;
       public         postgres    false    218            �   M   x�3���|��1O!���ɜFF���F�
�V&�VF�z��fF�x���`���楓i�1̐��\2������ �0�      �      x������ � �      �      x������ � �      �   �   x�u��i�@�U�߀͌^�\K�H�D�@����c�fx��>�qj���!�.f���#B@Cw���b�f!_5��%�h'j���Tb��ӑ��\u�v�R�����R��=�Ѫ��^��wڼ�2�-����p��\y�7�o�2���9�����!��3u4#�#�S�!�c=��|]"��Pn�          �  x����n�0�g�)<y�H��R�E�h�f*P\��Z����g��/�S��]����񛔊a'C�!$\�G��=G����zy�?]���"����>���<����@-â
���\[�`�������3�o`����`Zլ�5b�4h���"��]�_jq�fsŬф� "Ad�"ҧd?���a�8���zIz���oп��S�����mE4�*hX�%/=^�j����vuY�Vi�
l���UZ��LLRlhD(��Q�:-,8+]!��/�TڗN(P���_�?G�<���ue���$�T�Vh/og������g.5�D��L���5��m�Z�k�����r�3��"1� ��{����~����������!�3�JUHT˪�4�h��<;����[�S����C8፭�*x�f x�ؗ�`�)���o�V��ʎ0��0�c�"�.QN��xHv@��cP��\�>�)>\��'�}�:J�7�rĸ_� ����.���h,�}�%si�������[¶`�"�:�|��5��y��b���|D#BrDW#�+V�\*;*LU��I�N'�Hgc�83(�8{5n������9���B{�V��bʙ���|��<{��<��<�r��}
{��?��      �      x���[��8� ���_��� M���,v�+;If�lz����Ĳ8%��D����{H�e'��Ʈ�$��E�,up��ɿ��������J�e���^6b#�๨k���=���R��q�-i�ɇQČd�D��g��.��SN	�	����?��2I��e_{��e�x�c�P�bPMW���4����B_/L%]�Z���B����:9H���]UbX��lݶ��������/��Aneo�ҽ�Ŕ?,n+�Z����i�m; ��h}���=;;wtp0�ͺ��Bx٢7������B5��5l�\�4���ߪ-l�j��-|�k��(dk�^I8��h��;�Z�>�Zֲ0�nUq|.~X�	���E�E�Q��#�h7�to|o��n�E�{��IbyB�ŭ2����[�A��Jx��PIi�E�[3���)��0X8?����3��Q��nK9��-�q]�������
xe��\]��=-��N^é��Ȋz,����nw8����ѳ��骱 ���6U�hQ2J�%��"��{'�7�h � ΋%��Z��>��cv'�t����ӛ�g���HJ�H?�@Ʊ!}��Q�/��Y�ˑԪ��"1iFEZ����/��Y�Db��%���4���s|
�g��(���|�ɴ ��Ǩ?���^@�[��H����[�X��Vj��)K�p��ø#k��3�$���`�􂓳���h��3mO�$�$ygCb,Fɾ$�gI��pK��cȑk�`^��}�gY��l��pW{S�JF�~%�'5Z��I�R+RC �&���s�$����0?���@x�[�G�n�*Fž��E�W�+_��O���
#`_�O��6���[}S���J�#bo�����% �����n-��c�����	f�b��=�枻c��I�4�FW2OX���B��!{���]��b;�@ �>��V�ChF���o�9�V������z��͝�|C� ZD�m~H"֐	T���%����K+��#�p�(����(�@�,�Y B�H�d�4�&/Q4����pz�a;\��6�Q��g��)枻
�)GR�y*�Q�#f,��>8OvKE���s�B������!;�ϡ�ө	M��e��?����y���1
��J }�x��x�5�f��0��r�F�n��d7mu���JW�����\�c)ȯ��#l���^~
���v��z��4F��ן����{%z=�&v,�E���F'�}�KYY���Ů�CE�hد����T���a��Q.��'��ǷmM��eQ��mQ�zt�hH�-i@S7��-����M%��<�I��Z��Q6�� ;} �m%�=Apc�)�����
G���g��9�F����<�f �p��|�.��/4T
M�����]iֽ��mp8�	������cc}�1�@��`-f� ����e+P6��Ȟz�v;*��,�}5#�e��_T-��(�˵Mp��<���o�b]���.?ˮ�.�K�]p��-�)�9�� d��r� �Ѣ%�]܎���[{�h��}�λ�L�.��}8��yAz"�k��$�i��9v�i4��t�OBnoo��+]�R�`��R�_���6������./~����.r����e(���?C_M�J��.GrӠ{t�������7�h�͸�wu�件�R�_ ��\��]���]v�g�j�e��xd=�um+[��̳ѷ7ߧV^�_/ �#�P��c�R\JM���Siċx=�=�0�!���D��j<4vd�Z�n?�,At�����IU*�\W�5A�%1�@���T��L*A�}�ċx��I��,ީ���2��<	�2B�Oo���}wv�s����΅Q5�~z�'��U�N:�c���>��ߺm�-���X��o�*臾X�%Q��,�Y�p	�ȮO�X�;9�A>���9�����4�I�htt��Q��I���1ea��L�!RG������zN�4��Q���C���r���i��$�vf@�H������A��Zj���2T�j��M�S�	�<����z䛞�7A��֟�Cw�"ӥ\�I;�f�����(�4͢<]%�H'�)�E����
7<��.��7��1�V��W�u��\�Z���CpS\���)�g����	z�z�9��C�hهe��A�cF� ��[�F������5;��ޒ=4Y͉���҅0����U��q��[v��+���6[I���}�y�W!�q4�Hƣ�0�q4��x��4���O��8G�hܟ��)��h�{3��l�(�E��F�l�C�������2Z�b9��#��p��M�9��"\/p���?�p�94��x�t�'h��0ӧ�?A�h܋q�t�'h�{1Οn�G�^��2.��Q؊k���V�U�,خ�,�y��q6Ub�p	]��C�)#P���ٻ�7,gBF�� �2���_�~���(F���Sƒ���8�w0�J~�����}��~�k/��<]�k�O?�� �h��+R�%��A{��{�Rm�o�]��R�g�����l�<���Q��	} ��$M��1�sf\�1���3b����? �d�^�*�����ǈ�D�5�u3m{lb�-���d�³�h��le��|y���`�$P��tg]���!i�����F��%v�Q��Q�nt����N����a���J#e��r���Ly��<����]�l��ұ-*	��.��b���!����;׀�TJ�ݢe����ӯT��J��r!��0����o��OW	���/��FA��Cπ��P�
��j�S�ky�l�S�x�S�����f�'��l��O6<�e�l��9k0�(�J�(_ŹL�<bY�ZO�sT��=�����08���B��/G4������D�0�[��V�c�O�G���s��qe��c|�i���#��4���4^�J+c���Z�4	�8�g��C��%���:�}���M)[�mH��-tKj���'q�&_znj��q}^��v�h�9�F��`g��`gˍ�F��l�h�c���l�h�s�����>����7�h�J�j�W:�Ӏ�<N>�;�Ѧ��x�y�b���j��0�P�n@��FS;�[�k=�'�sF��ן�C��Z�&�ɯ�[�픃����Q���#r�ҏQ� e���ݼ-o�p�X4��ۧϭ�u�8r74�ip]ܸ�0��UR���l�N���?Ї�qעo�%|�F�pAxӻ�!x�P��i��+��Q�.�0�G�Ÿ�(��a���kǸֺ���C&�I`�A���`ܓ��kUK�Qr
���T����`���J(b:RG�ހ�i[�-�]gdI̺����]������ÿ�3?^�)��Ż�0���Nd��?�JY�������m������_>����?g��V���34���?L�� �9$��,��x�&!�4�W͚B5	Ô$a��4NXA���!Fq�O���z�l{��\D�(ٟ��J�OuJ"��fIFY��hF������8�WY��,NBf1�a�e|5� �����<�iL���%<�x���Q�0�@8�]g,�R��}�ό�q� b�����	_Y�y��8�Q��!p�xrvOi�N<\�,�<�Y�C���I`l��l�8�A<=�8PN�Yx����<�@�m�	�Ì%��O��}LL��"p��V��5�0
b��Q�%vĪ�-��c}.���=��A`��Rr���7�(H;j��X�F+ۓ�X������|�[ԏ�}������ �_�Lٗ d0���!dp%��Қ)�A���{V�s��T��^���m3�]�` G���߳��9oF�p��l��
G���:>oՍ"���/3�NpB�]�����G�2ۨ���|�� F �!;/H�H	�ͨ�<���n��O��ih�2�]2��v�ULOη{��薙*�*S�\�ƭڀ�Q��G]�f˖�KH��7�� �t��t	��]x��LJ׆iG!Z���(Jy��8j��vrvb{��6���0��}����ɾ�W9�EW� R��:p�P�����v�v�Ϧ �  �m���Ѡ�-������-�`o�4�$a!�{�;�<�O��y����Q�ٟO�|0�9�F��`3�h!;B�(ۣl�����F��#l�����N6��;�&�E�I����N�<d��W��'%XX�� =q�%��#q���Ǐ�!G��'�O�#q$��aj� �ʖس�E���ݾ2x��͋�7/�8��h^_
˩#Zh�����ԁ~�:���!�F�L}�n`�E������ێS�������Lb~�P�t�1"o���7恧vĩu���7���^碫����`��4jz�,�`Z>w�2Dv�W�n��l�ߎ�8f�ey���KV �Kd��=1?�.Ni�����J��9G���l܄�y�i�����kq�B^ۗ��J���}��?���^~�������      �   I   x�3�4�L��4�47773542�,����	C��eD�"cb�rVdF�"sbYp�VeB�Q1z\\\ ��;�      �   �  x����j�P��㧸/��{�?[�BV��C��0��r0h�X:d(�L���%iM]�]�!�u�z��+�����ŋ��9��ι�9��iU^e����8C�} |f�#�>��C���o��SK@W�b֖߲�1!�S�I�MNfX�٘u┌��l3�X�	����Ɯ^����>d��8�)^C�UŜ>]:�!�F)�@��4���ʈ��1��,X�T�:ńӼ*n��0��=� J�+,�:[�m�j;͵Tv�����7t����e	��I}d5�*?�׊��ő���f��k$�J��誕�Cw�D?�kc(:[O�����	j��G]�̭��a���j�����d�P ����gt��?[e� �&8q2�T��Q�|���~��H��X�#'��g�f2�l@Q�-�3��=��R���̴��KRk�����n�v���y���dp��1O�G�6%�,�.�j�Y�~������-��0fj�dBo��(��k��|�},�u��q�f�.i����5��L*�i�u�N�An�'�eU~�I4*��S:Ƈ��q��Vu�De,*�ƛ-o.�A��p�5���*2·,��O�m*�#zz����^<�5갡S_��d3�S��cT���\�Z��<��o�&Ƈ`�=a��"���Ǽ~�Q��a#�ʷ�9�	Zf��F��DT%����j�n��      �   >   x�3�LL����4202�50�5�T04�2��2��3�0274�#�eę\Z\���ZD�1z\\\ Y\E      �      x��}[o׵�s�W��J=�J��0���#����� ~)6u�vU�d5��'i��pr�H���	iAǦmE���	�f�?�_2���ڻvU7��`Ĥؗ���^�o]j|�qsnp�V�(?��F�z�`6�}c�����s�������[�G;7'N��c�_c�qI�=1va������+ccW�.5/�5~q��K����d�v���a�vz��|%��y�F�����y�����>���j�-������ڝ���`'Z8=��|E4�j;��'��D~���e��WO��RD���'kQ�"�?�����1n����
�Qvz�e坟��Ut���;\R!7��
\�
�5s�%7oF ���1j?�V�N�v�%��I;*�O���X�����~!�XI�|h�E��g��4��R�r�E����#˺[y�)ׇ���#kͨuz�,����������h-�]{p����oȭ��b��_����lAȅ�?ɛ�I�/;��2�Tc��~���3�#���s����w����p(+d��3ؑ��	M
M��N�O���� mܴ�����]���֏
G���>Y�qjW�\w�U�✼�O|o�چ��Z �g�:�˚�l/���ër��qk�S~�m�UW���|��-K���n��r�m�^���6sl�)�_K%���I�,L�R]�O�G`?D�&/�^��H|�s���;�s+�i;���{!���G������$�����T:J����5���Ko[V���q�y�V����Hnr���y�I��� ��@Κ�����z�PcDYJuqz���E��Wl=���Po@�D��!�E��'bI}�L�O����5��-��r���&����R�:�\l�����
�g�Be6%dp6�������$��;Po��N������vf�I7���y�rz�i[��x�r��Q�P%��i�%��uxe��il������-٩��X��$���n��+��!���=�	_���'�"�r����n`�'"_��L,#/|�6�~�k|Q�҃MYO�"mK��#-�pe�/{�>����T+��+Dc`��>67؍�Z<������������x/�zt��2RaJI�6�~�ƉJ<���]�11�y��9yu�������D��,\�.D7�D����� BwO��܈�e1���h�td��?� �7�sSBx|}2<���7��L#5��+Qk�97{K�^��D+"�W�;7~���_���wn\m�xgA?�ƭ������ԛ�ʸ�#�?Ћ�A���/Y�n4�S���i���kf�:r?��5gɌ�x����/�r��R/{�֍��{���ѿ��+"���>��E��\����LL-T��Ԃ�7�Kt=�;�|�䢀HD��`W������,d6�ۏ����:Gw@�"ZH2w���F21���Y<v� �A Dd�l�S|�7������$�ۑl��$8.��*VڸT����:{߾-^�p��8���O�C�.��:�O�S��E+�VHyG$��z����yظ�D���ɯ�|�'�(�hYa'5H�.�\�ͤ���qMY_���$�H�O�e��O�9��'���O��N�g�S�M���w��9�m\�Jl�<�_-9Y�:��[D3"x�mA��� oܐ(�M���3n�s��;i�nM늫�$����.5����`_�-�AWI'�Wb�?K�.�+3�vs��-~�1Κ\�b�:�T��݆L�MV����O��ra�ߵ����nO^�!�:Bܢ^m�Yo��daΌL lF��?=��m7��.�YT�N:t�a����:/:�/�5H�HV[��:۽����h9��7a�����A����}�(���:���4�r۩1�E�̚�q�wS��i�h���'�>�iA�<�p]���޹ڨ*�Un�k��B��������g�zl*���҇�!�\�_���ZL��� |��]s6T6Nm̋c��»s��Xy��&$�:Ny���Yx�D�(:�m��(�+�ŶɎ�Wy������)��T������mg�i�#�P,�~���9O�bp���s��ܯ�#3+��(���8���S�%l����)��Dv�ѓ��)"��-�V�Й��d=	����tӿ-������GX<���R-�IRt���w�P�a�b��s�`.p¦�*J�dI����=h�m�ո���c�M��]�f�����M�U�8PKs��]zV6����ښc0���FR�3����\��n�;����ai��1B9�(����kށ�`�_8J�CF��K���%�G'�D�"����)�6�h��`V��iX�ON�L7��������^���T,��zD����-�ں���B$�#�Aj3!T��,��%���m�o\� R�����<]D�Ohx�K}��2�@��:J���s��!mO#닇�R���Cm1�3u�E�d��b	>�낚��*'��`d�+v�{�zď���R��#��o����U?�o�C�P+?�gB��vJ�T@Z�zc��>������π�>�B��U���0|����-C�y�b��;*�Rӆꦔ�osGyp�>�Ia���AA���Εئ2«��4�����(�I '�t�8��^��!Py�Vp#q����7~6�P\�	㰏+�	�b�.�dL��JJ�͹��sJ�{D��,��^(�UlL�8�y=��Kg>O�O-'��wt`�"	+����Ћ �x[]��sa�h�B
��0K;5�����b47{+��#�e��̃h��}�m�j�:�ma	�Y�W�7-q�fDA1�O���k��n7Wd�.���/M���҅�{�Wk���혀)��SGk�³Xf��c3~��MӢ�/���s��~q��62mD7{9��;��Z��i;FJ�b�O]�&q��Ez��wq���)5��@VTT�=D�=aߘ̃���lLy%'��9�������Nڂ�c�ϳ[�'�������3��T�&�����*U�&M�z��.q�w�6�1�U"�&��rB�/sD�3s�`Z�I'y���Yt!Em��ƚR�_�t����)נ%�=��R[P���>���4u.�׌�B�@%�C�2z㚡v��V���E��R���@���A��Y����<����&����9ћ���7,N����-x��f@'&b��Z#hS�(PVw�����!~fg�̂�C��v�L5���vvN�%�S:������V{m^���{L�y1���&�Ixm�p�L�D�];���$]�J��8=�&7��I��P�	�4�nA��k9�]�nFz�R_���l���B}%C
hی�R�>�/.��A�J[�Hf�ߊ�)�U+d$-uѥ�.\��&��͙��Q�7�ʌM��D�c/�e�-[���b-�<E��i����ʀ�����j�6_����,�eڠO�	%#1x�Et<1��@�%�������K'Ȉ,�w�j;-�ՂyV�aA,��.����~˝$���l@��cgB�|�s�{��~��p��gM�c��ܐ2�,y��i�Ϊ��Zt��j|_ɾB �H���/����1���IƥQ\�}��X�=벺���uY��.�<���U[��K�����'Vq��kq�@�L��+�l��Q;H�v���FE�d�X.���(�5I<	X?iw��^��h����#�@�z�u����_�r�C8MUij�^F���{�<�y���c���Ѡ�5M��7����ѕ��!ߥ��;�R�!MVއ5!�M�r�e��b�=�r�aB@O�U��&��ip�Z���ūb���~FR�~Z����1��	����������N�{`X�g�r Y���K����������:��X�M6?� ��G�+�$N����lhj�&s���u9p��ƚ�h�@
n�6�@����y.���Gs=�b�4�lI�x���0s�ĉk�݊���zD|��4�!=�^i�&�,DE%��@)�ZO�ݫc���L�>�d��xg�%�
���R\{�[�l��m�~�ۮ'ތ~�"�    �d����AE�+���j%��%�6�>���[=Y-�ĕ��Ζ�b��3�q>�ls�LiSq�8~�򲷱^Ĉ�U�C���D�V��Vf��ĀR��ް�y���T��8I�u�HX2�v��L�^t���o��my}�oh-W�yDձ+n������m=��VSn�����t��\B5�"�60�@�B�"�/R���K5����O�'+K�����V���ۡ>�m��O�G��!f.,P�rW��ܲ�cn���gY4>9���}�U���]����_� ����^t��&����Ma�
��(�^5�o�dN�k<+�4����W��˵�P�� D�T�R�2�r�fQJQ��rZơ?ά@U�(��@�5����G&�����\QVH��`A�-�� �v�̃N�7�=5ݰ�U?�n-�]��%LP�I.�ˡq�_Rg�duzL�֩9*�:lH���b�<�|��7-X����A�>ݳr�Hp�Y��azH]�z�.9���~ٛ� �N&Hm�Gn����O�jwYM4��.u�hF�ܻ��T�~�{~,B�T?3�H~�E0�&x�J�\w���������Sz듇D�6y���j����J��2���3�oE7�d|�?jk�۰����pCu%<%�9��3ݮ��k�a�R��ߊ�8��Z�3��Z� ,��T��ȵj�����@�XP��������3�ȵj�{9-�Z���ˇ�"�Ə�  �3A<���ȩ�^�Udp��kl6&&=G��1b꒖㖭�	J�PI0i�U�VW���c�؈2թi �V��}* ����(g#�9Й�*��xoz�;*��LL��.�K ���3t!iB�&z㗫���M��VS;�GƍM[�D9]s`�h70��~�(������W�����8���v����'o������<�F]��FK3������ĥIP�d�J�+
*�eD0r+�Uj����.���Eɠ\��
C�G�Uk�~�v��11�����,����F9e�6�HBT��|����D]$�X�g[ cQm1P]��a����kDJ�DQ�zl��p�Ե�����������qnI�=t>ة��)%�Ω�T�(<A�E�C�������w�"i�-k�p���ķ1q�{�m@�v�/l�)<�♇Ŀ��28V�F�Oհ���By�Xc��^�a�w�kqy��.����DQ$��n��Y2�Y�@
K���EHI�B�^Ub�x��d
��4Po�Ἦc�#�~S���Y���kƷ�9�J4_��� +�](��[ �qx��T�KP����ѡU�l���6���h!��.���ů�ZU�^rS���h��@��*�sfa��U�(j[�G�"����'��F����\�*��d���T�x��l��Z�ħF?c�k�NZ:�I O��漴�����:���N��Pmuҷ�_�����*�0�&Ƅ�H��<:�_zx<bb���*w͢v��O�*`��!�D���2�T�|�U�eA��Yd@Z�&L�Mx+h��B/�酨�(R�o��ٴ��>�,:�� l�������65H��O�D��XDC-���b��������o��W)�	?m^��O0_�V�~��#[6t��?�0�B�Z�#��3�X�����[���x�Okn��w$Ԫ�~E*s�+��sH�V �_��K%ߖ�qo�CU}{�ma���M|pgA6���I��������a���{�D-��nD�o\�G�����Pz���e�̿(:��C^����&�NX+�攲�����1� ���x	 �H��1*��{5����J݄�X������K�~1�_?wEⅷ��5*[u����i%
,1q+5�O6G\d��������Gߠ����т¿������W�M� [5hP,m
9���m%�ݲ��ȂRH-Thλ,S�<l:��#0��C�q[��2A1ˈ2�J14Y���W�Q�'{�kn���q{�~w�Zשˡ=g>��b��P��?��`d��MZ�>+��o�q���@�T��Ba�tc�Z��氅V��X��H�����DL#>��Kqp)���i����\� C�\�]0��?�'���J��� �m�B��� 4��s�݊�l%FN�_C�QWD�I%��yi�2���.Z>�����/�pp93�<�GmVn3�5� Ѳ�eK�����&��|�%�=��;���>{�\�n���&��5���ٴ11�\'bw�a6cS��E�6z���S�f
�}hQָ����-�K�t�����n���mW��f�$uԮ�݀� ?�K�H�`�X�	�8�R',��(���W��"����W�__^E��r�2]B��,a0J31�Cn9hF���s��/鲋RQT�d�Q%;e�V��3�!�J=��r��Q{��Q�)�75"��Y���w�.ג=t�*�q'Z���׉��@��)�҃?6�E��}C�H\[��ے�v8�1͜�����1�X���)�8&�E�*3�tG)�9��c�� �pؐҏ����*�X������0��E��&�vg��G�P|�3c�Q\�lm��$�WI��iZ֌~�ZtѼ�R�Ԝ���y�h+�5�;�^���
"�;LW�P�0���:��m�uEA]R��߿U�Rl�	���/��kB�*>�p��m�n	�8*͵��(}A��≛1�B��Q"YXשO|9(Y�j	む>����y�
���G
�h%,�K�R�/!�W���b����˄G{u{o䘼�*�����.�7�A_�G��P�˗�A�f���%����VR����$?��(��7������^�WQ��`����JSE����'�*��rHM�ʷ~3�0web��"}�3��u�*�Ui�2t����0���mWM�48��^�C%M`j��SWq�X�����\05��ӎ%߸��U#�G��I��k@������"��y��I����[5��$��E�(8R.�╃�g��@���Ps=UO~3�>åPe�ѯ�h��WE��� �BV �\(��#�L%���w�Pdp������b�4�Z���Tuʵ��T/�Vc��j,0R�̀����6
yrRi2I�q������89@'��}D�f�䨦�U��%�$��ksbۦƋ$@��o�/�A�w�v�](�:ua=x��'t՛Ɨ���`%H,��u�6�{����ǚ�Q?mCU<,�L��C��9Bݪ{n�����W)�$kV�.���L��@���ޗ��z�q���?J�ʧC��b��Z9�e�a�g��d7��:��F�f�ECG�Z��q��6YF�,_"e��Ì�y���u|�/�?2xa�g%������d/��j-�b�/{��N���F0f��ʻ}�N�Q�h�nC��2'�(���-��2�3t�c��B�у�hbrU����^�Ԋ��J�R|õ����+�u�F�mS,�ӘߦĢ0�F,S�g*a�p�DA���ݑ*�~�./W��Xպ�{�;\#�rD��~��|�C�
�fDUMG�@bt�������4���8\�24<KG�����m-��W�m)��r� a����d�K�A��D[W�o�8�D߆����ҵ>��C�t�Z��3}�9V��/����;pӍ��B2�����!$���z4Rr�Sf�Y238��f����#?�;�	�W�;��J!���9P
Z��Uw�@�:�3s�^���f�d֣�fD@
d�L}lv��ƥ#m�f�FڕA,g�\���y�ob�mb��Q!�e���w��0�	���tS`KI��<c�6òx����p�2hϱ`�ݵfe0����ǁ����;�����
�m�:���p�)[�z�������/2l*Â�;K�^�]��˭[�����а��)|�0�~~����$�Dǵ-���@5rK؝�(��mJ}�QZ��9����
�d��ݙ��Ѿ�P|h9t��U+U_�`�T���7}1�,E�υ�Aaa=*�j�����)�;����83B��5�����,em�c��
�%���W��B̀� G  �,����4)�������������N��&f�,�f\68L�r��pچCj$�8od�	�k�0��Zi��-�X�fH�J6 U�Zm�f𘆩�6OO����WD�O�!RK�l���r^(
���w��)��ܳ�\[�5�q�>���Z�p�--�\��Y�Ig;���v��9�iV���`�n<;s)I�ۡHg^�k5�"̜V+��s|H��$��4���eNi|�N������0�{�.���J_���� x��3K)���>G��ϒt�R�N`Z������ب��qZ�u�OQWWg���WL�L������5Z��W���鱱(��F̑83�h,�IҜIl�@����uS)�E[ �AT��A�=ot�V�5�����ī���;ص�/�1̊����k�~84��D�qI�M�+w�A�T�~�tҭ�v$\�m��{
st�P����Rʆq8u0@e�2Zc�d�«��>�*���JتO�i--�,��ʂd��ϖ��a��������r�����hU�����u�!@m�Z�H��/}0L-�Z2���j�����K�a�uyS��v�?��"T94�n��<.���]����*hG�uH�iX�r�$b�����z&?�"���G��R�p�eEA<<۱��scMx1a�m{�m��ZN�	w��b�YJ��U�c� ׬��V�4+�:�������h�u���z�՝{��T��E1�& \���{���/�&M�b��+T��������j��QıF�Ny�}j��#X�����n�pS���W�8���M�����gd�p���YU�.ֵҥuu������;V��V�n�t����eթ@�a�7;��uq�@�e�(��1�����u�5eG���9�P�hM'z��p�5\�g�j�T`B�%��?��!�б-�`3e������S�C��wG�b��N��O>�|C`��f ��j#6�/�Ot��\jҦl��m�5�P�����!"!���fqm<-�9iEP�?c�>��1V5ǥZ異rޣ2`�--��P�+���m��9Tٛ��j�8�6���Ƥ�3ـs���P^�L]��qc)wCc��q\�����6�<wOq��A7���i)���g��8 �1 <|z�������,�23�VR�)|Гe#c�+�s]zޡA��)��e�.k-��\�Gi�3_��Ml�X{�"}�f���.�jx@�CV9����`|ܓ�%������ќ����Q�x�V���m��$���L�ꌥ0i�lp�ce��\�o㨇�������7!h����2G�ٛL�w�9����bFTK]}��S۩��4�4	Wl�#;n,DY_Ľ��0�S�(}�B�Q���N蘞�[ۃ��'����V�?��ĉ͂>Ec�ތ�3�S�8cc�H�0qL�2|���)��� �`2C ��p����P�d\$;T*�Q��Q����!*4=���N��h�
�u�J��~!��1gt��{u�������=���x��Ec�>��ճ����Q	�M��f�9���/;��V�f�xĊ���%j��(�pkuj8�����PI�.�� j��l��/����>e��������M���X+�o��5;	��KN�Q}�<�)���8�q�ѧ8ڃ�K�vD�[Je�g0��j��s��2ߜ;�nݦ��b�~�+4�4B>KR�kb�mTrǏ{�zv��s����*;�2la-����&R�.V��p���}����z6��[��A4���<@U�p �'�"WCeڱ�>Y��=��xyĜ�hx@e@r!� 7h�Ƚ��u��aQ��$�zY>�oOՂ�Za��X�J��yG�L_FG��K��t�<�<�c#��TaB��Q�J���~b�D��.A�i�)��Y��
�Tb��&�k�2#�73��V#��T��� ���jO���_h����$���Im�ı�t6��aQ�	�i�i�ť餛��ʡ}
H��y8��2nh�W����t"�:�R���.!2~���Z����x�9���x��WW?]a�M�|<��38CL�+����}JE���2͎&)7$X�)1k�l {xL�ϣ����k���j3u"��}�{n���2�� ]_�]�Fcz���eٜ��U=J��n �/ ��xӅO��{�� nztX��
�.a�T���L,�͒������h.��j����+��0��{�Vta��5r����=�2SZK��sd�b��4��u]sk��^=Ip��g�L�����C.��V��B��	ƈ�ys�60���I)Sþ�.�����8�t2_�ų1޴v���zf�!���z��M6Օ��5�T�A^�Kj�()��� ��_������=˭�J��M��S�g8���UY�����i���5*aϘH�=Sm��"����P1���9K��,q���V�eT�t�PY1�C�*u��BE�P[�i��W'�ga<�vu��S�� �"�8�����_.��բ��qhf0V7Ui�lcź��p-��p~j�㏶��M��S�7})xB�?�OC_��׆1}��:c��I�Q�$��c��8�Z{Y���W^a*����T�"�x+�'4�cR}����Q�&�{���L}
��m�bO��-	S
vH�+�����A�-�w����`�r�u��;��]�,Z����
3���V-�V8Nw�Ŭ���:����!iX����z������iXN|+UJѪ���c=�:+BD��C�Ů�p0Ge1��㒊�,ݗg��_��o��xpW��'6��Q�9�)rQ~&����~��y����BC1{zתY� ������IL���r!�6�~�.�ɈS&B�]��`hlN�c����7G��RA{nC8 �bC���ʅ��|vS�25(���]� {�����:�ʝ�5)�<w1򬪗��%�T�%��������l���k)]K>�Z�e-�p��;���J�X���=P�2-����T�I�r�w�z�Ҍj������u|7љZ����Y�G����Սr���*S��`�<I����W���L3�x�ϡ`A|l��>t�0Cz���7V�C�nT��2^��!B��
����0Q�eU�dn5+�������fīGje�r��� 툜��͘3aԎ��N�3���gt��ٓg\�c�^%�|R����)��c,8�a�5����H���_�{W�]q)�=p2���J�Mڼ�&���-�9sr��Y��I�ȥ������oO�o��h�=Vl]���,�(��ye_������M��N��؛� ����WS:�;ۡ,�Uku[KpY����
��R���oF�^5Z���C)��+Թ
�6e%|�>o��|�ܔ�y9ܼ:]7]n�]�YVݲj�ZU�넭��S���v��p[����f��h�sd_����y	9:�dQ{0܎g��&=x�6��uS�s���M�������V��:�J�Q��������P����"ڞ�X�"�麘ȍ�N�j�
���h��N��zw~�*��g^1xt:�.��F���D�܁B�Y��\�J����5� ���hi��4�_1�o�1 ��pc=,2��}E8hp��q���������6��|��������˶�)�x*@�ۄ��J�3��\<�z
�`E�Km�=)� {5���9쮒\�������PP8ӈ{�)�ꑇ��;����[w������8:/������C*�9'���q_qf�}q�5��\��4Bo��ÉbO�!@�r��bn�ڋ�ϖ�Ÿ�]���*����w��6�{�Tc}�K��Ά��]"Ɯ܉.�)�N؋u��.�M�k����Kr|?l˙>�������/�7i/5      �   u  x�՘�n�F���Ș���N�;[�Ԓ��@cLR��ԌL�r�m��.�( �(
�Z��H�������))�ĈHo�%@��ӹ��9�+�lv�ڂ�F��h;}O�Z��g�7L	�x8�$$�(���\1��9y6�}Dvi���xw�t�UU��&�Q�\�%8dn������xu�jχ}E3]�U��X��fl��֨9Z�ި?�Ն��!}�*?/�P	n��r|��Ag�d3���r�X6�7�·[����u��9�N<��Kc�$�2ʆ�R��`�!H�:$;�Eb�{�4.�S6<�rzu֚,�d�?�
�Q�d�
|G� ��"<vI,����a��_�_
���C͒����k��������a��Fu������F�g=���n(۲���ba8Zz�Sާ?J@r5Į��c�CA��U�N�Ѡ9v�����*�A�T�FJ��Fk���"���ah�e�u��{��wk���X�^��V����a�"�5�*O�ɟ3j��~QH�lmJ��4���V�t�&�$�(��~ �_�b�fԍ�(�J7���ӻdm�	j��4���M�P:���Tg0T�fHCn6�	��ɣl��NW����E�� %�y�������\��1y>"n�qϏ��RUh6q�ܐ�-�˿VM���k�k��*t�I,���x��l��(i�4&8��3�Bi��j\ '�(�\
{Hؓ�ř���<��F��*#m*� �vѷe�!��
����QU�a�%�|�Q�X�l�m0�����~�íd)�t
���4#VIs��rέ�e+ݏe�@sa�h��w���X�ӄ��6�E� �c�E�ɉą��"��F9Du��������L�,��,L7_`�aO�g`�"W]�Y��+��h���q:M����FE��ҦL���dYw�	�`){�Aˢ�F����·�`�!io=k��N��,�e2��Ӊܫ�V-���ҥ�Y��>
�G7��5AM#{�qP<�1tv��P�#e�;n493�qjE��wk��aY�FWw�O�b�TmñM���ʢ��F�4/G���2ӹ��
����"��������\�G�������؟�NV�_ր��?�u&���N��'�Mi&s�t ��oj�ׁ�NV�mi��06�n`Zu����'@ͭN�E�:r�8�<��E_�8Ja|pӷԔ�:��
-./v�5�7�#xEhG��L�0�u�'	�h!�11���`��Z�9.��L�ou�aҿ9왂�'"�zE&�]�B��������Y�rT�֗��
�3�NPG���2|��fre�%�Pat��gj�� ��q.A��8��(�b$��2.��'X�nQ�JܩZ ?�666��Z�      �   K   x�}˱�0��L��=o0�Y���]��)�����c�vW��B��i��Yj����1ٰ�V���ɧ"�� �      �   /  x���QO�0���_��t��v��'5�!%!_�˘h�	�zGB�i��~ɹ_N2_�|�1$�Bͮ���UV��C$���5��	2��D="G�)#�4�v��!�x`�i�{�wk�tR��
-�e����p0$dQ�����0tJ	2�c�)�����ˡ��e2�UvY��vz�A
㬎����"H�<Z�d������l�?_
�Q$-Q;��U��Y��O�:~��y�l�|U}%e��:���b�E�vw���g��iR|CA�du�r�M�B)��:�KE�f(*�N�����L��     