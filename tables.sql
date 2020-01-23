
DROP TABLE Registry;
DROP TABLE Station;

CREATE TABLE IF NOT EXISTS Station (
    ID INT(3) AUTO_INCREMENT,
    name VARCHAR(64) UNIQUE,
    lat FLOAT,
    lng FLOAT,
    PRIMARY KEY(ID)
);

CREATE TABLE IF NOT EXISTS Registry (
    ID INT(5) AUTO_INCREMENT,
    no2_val INT(3),
    o3_val INT(3),
    pm_val INT(3),
    station_ID INT(3),
    PRIMARY KEY(ID),
    CONSTRAINT fk_station FOREIGN KEY (station_ID)
        REFERENCES Station(ID)
);