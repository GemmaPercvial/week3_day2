DROP TABLE IF EXISTS bounties;
CREATE TABLE bounties(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(225),
  bounty_value INT,
  danger_level VARCHAR(225),
  cashed_in BOOLEAN
);
