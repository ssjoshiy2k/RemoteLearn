delimiter //
drop procedure ab//
CREATE PROCEDURE ab(tbl_name VARCHAR(255), username varchar(255)) NOT DETERMINISTIC READS SQL DATA SQL SECURITY DEFINER
BEGIN
declare startrno int;
declare endrno int;
declare done int default false;
declare cur1 cursor for select StartRollNo,EndRollNo from GroupTable where GroupCode=any(select GroupCode from UserInfo where SubjectCode =any(select SubjectCode from SubjectCoordinator where SubjectCoordinator.UserID=username ));

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  SET @table_name = tbl_name;
SET @subcode := (select distinct UserInfo.SubjectCode from SubjectCoordinator,UserInfo,GroupTable where SubjectCoordinator.UserID=UserInfo.UserID and UserInfo.GroupCode=GroupTable.groupCode and SubjectCoordinator.UserID=username and GroupTable.EndRollno-GroupTable.StartRollNo<20);
    select @subcode;
	set @q = 'INSERT INTO AssignmentExist values ( @table_name,@subcode)';
  PREPARE sam1 FROM @q;
  EXECUTE sam1;
  DEALLOCATE PREPARE sam1;
 SET @sql_text1 = concat( 'CREATE TABLE IF NOT EXISTS ',@table_name,' (Rollno int(4), SubjectCode int(3), ScheduledDate varchar(20), SubmissionDate varchar(20), Marks int(4), Approved int(1), foreign key(SubjectCode) references SubjectTable(SubjectCode) on delete cascade)');
  PREPARE stmt1 FROM @sql_text1;
  EXECUTE stmt1;
  DEALLOCATE PREPARE stmt1;
set @st = concat('SELECT count(*) INTO @var1 FROM ',@table_name,' WHERE SubjectCode = ',@subcode,'');
	prepare smt from @st;
	execute smt;
	deallocate prepare smt;
if(@var1 = 0) then
open cur1;
cursorloop:loop
fetch cur1 into startrno,endrno;
select startrno;
select endrno;
if done then 
	leave cursorloop;
end if;
set @i =startrno;
  	set @c=0;
some_label:LOOP
        set @st = concat( 'INSERT INTO ',@table_name,' (Rollno, SubjectCode, ScheduledDate, SubmissionDate, Marks, Approved) VALUES (',@i+@c,',',@subcode,',"dd-mm-yyyy","dd-mm-yyyy", 0,0)');
	prepare smt from @st;
	execute smt;
	deallocate prepare smt;
	set @c = @c + 1;
        IF @c > endrno-startrno THEN LEAVE some_label; END IF;
    END LOOP;

end loop cursorloop;
close cur1;
end if;	
END
//
