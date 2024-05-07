SELECT issue_id, COUNT(*)
FROM smt
GROUP BY issue_id
HAVING COUNT(*) > 1;


DO $$
DECLARE
    i INT := 1;
BEGIN
    WHILE i <= 50 LOOP
        INSERT INTO your_table_name (issue_id, vgnumber, request_type)
        VALUES
            (i, 'vg' || LPAD(i::TEXT, 5, '0'), 'complaint'),
            (i, 'vg' || LPAD(i::TEXT, 5, '0'), 'transfers'),
            (i, 'vg' || LPAD(i::TEXT, 5, '0'), 'request');
        i := i + 1;
    END LOOP;
END $$;


SELECT setval('smt_issue_id_seq', (SELECT max(issue_id) FROM your_table_name));
CREATE TABLE smt (
    issue_id INT PRIMARY KEY,
    vgnumber VARCHAR,
    request_type VARCHAR
);

-- Inserting data into the table
INSERT INTO smt (issue_id, vgnumber, request_type)
VALUES
    (001, 'vg00001', 'complaint'),
    (002, 'vg00001', 'transfers'),
    (003, 'vg00001', 'request'),
    (004, 'vg00002', 'complaint'),
    (005, 'vg00002', 'transfers'),
    (006, 'vg00002', 'request'),
    (064, 'vg00003', 'complaint'),
    (065, 'vg00003', 'transfers'),
    (066, 'vg00003', 'request'),
    (007, 'vg00004', 'complaint'),
    (008, 'vg00004', 'transfers'),
    (009, 'vg00004', 'request'),
    (010, 'vg00005', 'complaint'),
    (011, 'vg00005', 'transfers'),
    (012, 'vg00005', 'request'),
    (013, 'vg00006', 'complaint'),
    (014, 'vg00006', 'transfers'),
    (015, 'vg00006', 'request'),
    (016, 'vg00007', 'complaint'),
    (017, 'vg00007', 'transfers'),
    (018, 'vg00007', 'request'),
    (019, 'vg00008', 'complaint'),
    (020, 'vg00008', 'transfers'),
    (021, 'vg00008', 'request'),
    (022, 'vg00009', 'complaint'),
    (023, 'vg00009', 'transfers'),
    (024, 'vg00009', 'request'),
    (025, 'vg00010', 'complaint'),
    (026, 'vg00010', 'transfers'),
    (027, 'vg00010', 'request'),
    (028, 'vg00010', 'complaint'),
    (029, 'vg00011', 'transfers'),
    (030, 'vg00011', 'request'),
    (031, 'vg00011', 'complaint'),
    (032, 'vg00012', 'transfers'),
    (033, 'vg00012', 'request'),
    (034, 'vg00012', 'complaint'),
    (035, 'vg00013', 'transfers'),
    (036, 'vg00013', 'request'),
    (037, 'vg00013', 'complaint'),
    (038, 'vg00014', 'transfers'),
    (039, 'vg00014', 'request'),
    (040, 'vg00014', 'complaint'),
    (041, 'vg00015', 'transfers'),
    (042, 'vg00015', 'request'),
    (043, 'vg00015', 'complaint'),
    (044, 'vg00016', 'transfers'),
    (045, 'vg00016', 'request'),
    (046, 'vg00016', 'complaint'),
    (047, 'vg00017', 'transfers'),
    (048, 'vg00017', 'request'),
    (049, 'vg00017', 'complaint'),
    (050, 'vg00018', 'complaint');

DELETE FROM smt WHERE issue_id = 2 AND vgnumber = 'vg00001' AND request_type = 'transfers'