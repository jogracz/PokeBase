DROP TABLE poke_base;
CREATE DATABASE poke_base;

CREATE TABLE pokemons
(
  id int primary key NOT NULL,
  name varchar(80) NOT NULL UNIQUE
);

CREATE TABLE types
(
  id int primary key NOT NULL,
  name varchar(80) NOT NULL UNIQUE
);

CREATE TABLE pokemon_type
(
  id int primary key NOT NULL,
  pokemon_id int REFERENCES pokemons(id) NOT NULL,
  type_id int REFERENCES types(id) NOT NULL
);

CREATE TABLE trainers
(
  id int primary key NOT NULL,
  nickname varchar(30) NOT NULL UNIQUE,
  email varchar(30) NOT NULL UNIQUE,
  country varchar(30),
  city varchar(30),
  street_name varchar(30),
  street_number int,
  postcode int
);

CREATE TABLE gyms
(
  id int primary key NOT NULL,
  name varchar(30) NOT NULL UNIQUE,
  badge varchar(30) NOT NULL UNIQUE
);

CREATE TABLE trainer_gym
(
  id int primary key NOT NULL,
  trainer_id int REFERENCES trainers(id) NOT NULL,
  gym_id int REFERENCES gyms(id) NOT NULL
);

CREATE TABLE caught_pokemons
(
  id int primary key NOT NULL,
  pokemon_id int REFERENCES pokemons(id) NOT NULL,
  trainer_id int REFERENCES trainers(id) NOT NULL,
  pokemon_new_name varchar(30),
  pokemon_gender varchar(1),
  pokemon_level int NOT NULL,
  date_caught date NOT NULL,
  place_caught varchar(30) NOT NULL,

);

CREATE TABLE selected_pokemons
(
  id int primary key NOT NULL,
  caught_pokemon_id int REFERENCES caught_pokemons(id) NOT NULL,
  trainer_id int REFERENCES trainers(id) NOT NULL,
  pokemon_order int NOT NULL CHECK(pokemon_order BETWEEN 1 AND 6)
)