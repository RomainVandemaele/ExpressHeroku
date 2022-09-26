DROP TABLE IF EXISTS points;
DROP TABLE IF EXISTS "comments";
DROP TABLE IF EXISTS schedules;
DROP TABLE IF EXISTS trips;
DROP TABLE IF EXISTS clients;


CREATE TABLE IF NOT EXISTS clients (
    "client_id" SERIAL,
    "username" VARCHAR(32) NOT NULL UNIQUE,
    "first_name" VARCHAR(32) NOT NULL,
    "last_name" VARCHAR(32) NOT NULL,
    "mail" VARCHAR(32) NOT NULL,
    "password" VARCHAR(24) NOT NULL CHECK (LENGTH(password)>=6),
    pending BOOLEAN DEFAULT TRUE,
    token VARCHAR(8) NOT NULL,
    PRIMARY KEY(client_id)
);

CREATE TABLE IF NOT EXISTS trips (
    trip_id SERIAL NOT NULL,
    trip_name VARCHAR(24) NOT NULL,
    client_id INT NOT NULL,
    grade INT NOT NULL,
    PRIMARY KEY (trip_id),
    FOREIGN KEY(client_id) REFERENCES clients(client_id) ON DELETE CASCADE,
    CONSTRAINT unique_client_name UNIQUE(trip_name,client_id)
);


CREATE TABLE IF NOT EXISTS "comments" (
    comment_id SERIAL NOT NULL,
    trip_id INT NOT NULL,
    client_id INT NOT NULL,
    "comment" TEXT NOT NULL,
    upload_date TIME NOT NULL,
    PRIMARY KEY (comment_id),
    FOREIGN KEY(trip_id) REFERENCES trips(trip_id) ON DELETE CASCADE, 
    FOREIGN KEY(client_id) REFERENCES clients(client_id) 
);


CREATE TABLE IF NOT EXISTS points (
    point_id SERIAL NOT NULL,
    point_name VARCHAR(32) NOT NULL,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    trip_id INT NOT NULL,
    adress TEXT NOT NULL,
    place_id TEXT NOT NULL,
    PRIMARY KEY (point_id),
    FOREIGN KEY(trip_id) REFERENCES trips(trip_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS  trip_steps (
    start_point_id SERIAL NOT NULL,
    end_point_id INT NOT NULL,
    step_time FLOAT NOT NULL,
    step_length FLOAT NOT NULL,
    step_mode VARCHAR(16) NOT NULL,
    step_order INTEGER NOT NULL,
    trip_id INT NOT NULL,
    PRIMARY KEY (start_point_id,end_point_id),
    FOREIGN KEY(trip_id) REFERENCES trips(trip_id) ON DELETE CASCADE,
    FOREIGN KEY(start_point_id) REFERENCES points(point_id),
    FOREIGN KEY(end_point_id) REFERENCES points(point_id)
);



CREATE TABLE IF NOT EXISTS schedules (
    schedule_id SERIAL NOT NULL,
    "day" DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    trip_id INTEGER NOT NULL,
    PRIMARY KEY (schedule_id),
    FOREIGN KEY(trip_id) REFERENCES trips(trip_id)
);

ALTER TABLE schedules ADD CONSTRAINT end_after_start CHECK( end_time > start_time);

CREATE TABLE IF NOT EXISTS schedule_steps (
    step_id SERIAL NOT NULL,
    duration FLOAT NOT NULL,
    "type" TEXT NOT NULL,
    schedule_id INT NOT NULL,
    PRIMARY KEY(step_id),
    FOREIGN KEY(schedule_id) REFERENCES schedules(schedule_id)
    
);

CREATE TABLE IF NOT EXISTS step_type (
    "name" TEXT NOT NULL,
    PRIMARY KEY ("name")
);


ALTER TABLE points ADD COLUMN place_id TEXT DEFAULT ''

ALTER TABLE points DROP CONSTRAINT points_trip_id_fkey;
ALTER TABLE points ADD CONSTRAINT points_trip_id_fkey FOREIGN KEY(trip_id) REFERENCES trips(trip_id) ON DELETE CASCADE;


ALTER TABLE trip_steps DROP CONSTRAINT trip_steps_trip_id_fkey;
ALTER TABLE trip_steps ADD CONSTRAINT trip_steps_trip_id_fkey FOREIGN KEY(trip_id) REFERENCES trips(trip_id) ON DELETE CASCADE

ALTER TABLE trips ADD CONSTRAINT unique_client_name UNIQUE(trip_name,client_id)
