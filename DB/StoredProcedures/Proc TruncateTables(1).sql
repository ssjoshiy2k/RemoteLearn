delimiter //

CREATE PROCEDURE trunc() NOT DETERMINISTIC READS SQL DATA SQL SECURITY DEFINER
BEGIN
set @q = 'truncate SubjectCoordinator';
  PREPARE sam1 FROM @q;
  EXECUTE sam1;
  DEALLOCATE PREPARE sam1;

set @q = 'DELETE FROM UserInfo WHERE UserID > "0" ';
  PREPARE sam1 FROM @q;
  EXECUTE sam1;
  DEALLOCATE PREPARE sam1;

set @q = ' DELETE FROM GroupTable where GroupCode > 0';
  PREPARE sam1 FROM @q;
  EXECUTE sam1;
  DEALLOCATE PREPARE sam1;

set @q = 'ALTER TABLE GroupTable AUTO_INCREMENT = 1';
  PREPARE sam1 FROM @q;
  EXECUTE sam1;
  DEALLOCATE PREPARE sam1;

set @q = 'DELETE FROM LoginTable WHERE UserID > "0" ';
  PREPARE sam1 FROM @q;
  EXECUTE sam1;
  DEALLOCATE PREPARE sam1;

set @q = 'DELETE FROM SubjectTable where SubjectCode > 0';
  PREPARE sam1 FROM @q;
  EXECUTE sam1;
  DEALLOCATE PREPARE sam1;

set @q = 'ALTER TABLE SubjectTable AUTO_INCREMENT = 1';
  PREPARE sam1 FROM @q;
  EXECUTE sam1;
  DEALLOCATE PREPARE sam1;


END
//
delimiter ;


