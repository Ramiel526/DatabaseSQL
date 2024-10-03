-- Create a view to show student nicknames, phone numbers, and phone types
CREATE OR REPLACE VIEW student_nickname_phone AS
SELECT sr.STUDENT_NAME AS nickname, sr.Phone_Number, pp.PHONE_TYPE
FROM student_roster sr
JOIN phone_purpose pp ON sr.Phone_Number = pp.PHONE_TYPE;

-- Query the view
SELECT * FROM student_nickname_phone;

-- DROP VIEW student_nickname_phone;

