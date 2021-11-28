delimiter //
create procedure deleteA(IN username varchar(5),IN tablename varchar(25))
begin
set @tblname=tablename;
set @subcode=(select distinct UserInfo.SubjectCode from SubjectCoordinator,UserInfo,GroupTable where SubjectCoordinator.UserID=UserInfo.UserID and UserInfo.GroupCode=GroupTable.groupCode and SubjectCoordinator.UserID=username and GroupTable.EndRollno-GroupTable.StartRollNo<20);
select @subcode;

delete from AssignmentExist where AssignmentName=tablename and SubjectCode=@subcode;

set @q=concat('delete from ',@tblname,' where SubjectCode=',@subcode,';');

  PREPARE sam1 FROM @q;
  EXECUTE sam1;
  DEALLOCATE PREPARE sam1;

end//
