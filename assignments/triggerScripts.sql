-- TRIGGER for change of address
create or replace trigger address_update
before update of address on student
for each row
begin
	insert into address_history (student_id, prev_address, DateOfChange)
	values (:old.student_id, :old.address, sysdate);
end;
/

-- deletion of student record
create or replace trigger student_history
before delete on student for each row
begin
insert into student_history values (
	:old.student_id, :old.student_name, :old.dob
);
end;
/
