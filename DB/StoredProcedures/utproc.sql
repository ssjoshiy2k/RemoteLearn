delimiter //

create procedure utproc(IN gcode int,IN subjectcode int)
begin

declare startnum int;
declare endnum int; 

set startnum=(select StartRollNo from GroupTable where GroupCode=gcode);
set endnum=(select EndRollNo from GroupTable where GroupCode=gcode);

while startnum<=endnum
do
insert ignore into UnitTest values(startnum,0,subjectcode,0,30);
set startnum=startnum+1;
end while;
end//


