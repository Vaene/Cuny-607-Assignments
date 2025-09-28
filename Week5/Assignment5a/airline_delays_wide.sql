-- SQL export generated from R
CREATE TABLE airline_delays_wide (airline TEXT, status TEXT, los_angeles INTEGER, phoenix INTEGER, san_diego INTEGER, san_francisco INTEGER, seattle INTEGER);
BEGIN TRANSACTION;
INSERT INTO airline_delays_wide (airline, status, los_angeles, phoenix, san_diego, san_francisco, seattle) VALUES ('ALASKA', 'on time', '497', ' 221', '212', '503', '1841');
INSERT INTO airline_delays_wide (airline, status, los_angeles, phoenix, san_diego, san_francisco, seattle) VALUES ('ALASKA', 'delayed', ' 62', '  12', ' 20', '102', ' 305');
INSERT INTO airline_delays_wide (airline, status, los_angeles, phoenix, san_diego, san_francisco, seattle) VALUES ('AM WEST', 'on time', '694', '4840', '383', '320', ' 201');
INSERT INTO airline_delays_wide (airline, status, los_angeles, phoenix, san_diego, san_francisco, seattle) VALUES ('AM WEST', 'delayed', '117', ' 415', ' 65', '129', '  61');
COMMIT;
