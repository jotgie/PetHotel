CREATE TABLE Users (
  id        SERIAL PRIMARY KEY,
  mail      VARCHAR (63) NOT NULL,
  admin     BOOLEAN      NOT NULL,
  active    BOOLEAN      NOT NULL,
  lang      VARCHAR(2)   NOT NULL    DEFAULT 'pl',
  work_time REAL                     DEFAULT 8.0
);

CREATE UNIQUE INDEX users_mail_index
  ON Users (mail);

CREATE TABLE Requests (
  id           SERIAL PRIMARY KEY,
  created      TIMESTAMP                 NOT NULL,
  modified     TIMESTAMP                 NOT NULL,
  requester_id INT REFERENCES Users (id) NOT NULL,
  start_date   DATE                      NOT NULL,
  end_date     DATE                      NOT NULL,
  mail_content VARCHAR (255)
);

CREATE INDEX requests_modified_index
  ON Requests (modified);

CREATE TABLE Acceptances (
  id          SERIAL PRIMARY KEY,
  request_id  INT REFERENCES Requests (id)   NOT NULL,
  leader_id   INT REFERENCES Users    (id)   NOT NULL,
  decider_id  INT REFERENCES Users    (id),
  accepted    BOOLEAN                        NOT NULL   DEFAULT FALSE
);

CREATE INDEX acceptances_requestId_index
  ON Acceptances (request_id);

CREATE TABLE History (
  id         SERIAL PRIMARY KEY,
  created    TIMESTAMP                    NOT NULL,
  user_id    INT REFERENCES Users (id)    NOT NULL,
  decider_id INT REFERENCES Users (id),
  request_id INT REFERENCES Requests(id),
  hours      REAL                          NOT NULL,
  type       INT,
  comment    VARCHAR(255)
);

-- CREATE UNIQUE INDEX history_userId_index ON History (user_id);

CREATE TABLE Holidays (
  id    SERIAL         PRIMARY KEY,
  name  VARCHAR (100)  NOT NULL,
  date  DATE           NOT NULL
);

ALTER SEQUENCE users_id_seq RESTART;

ALTER SEQUENCE requests_id_seq RESTART;

ALTER SEQUENCE acceptances_id_seq RESTART;

ALTER SEQUENCE history_id_seq RESTART;

ALTER SEQUENCE holidays_id_seq RESTART;