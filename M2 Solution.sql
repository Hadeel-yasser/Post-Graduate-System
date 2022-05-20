CREATE DATABASE PostGradOffice;
go
use PostGradOffice;
CREATE TABLE PostGradUser(
id int primary key identity(1,1),
email varchar(50) not null,
password varchar(30) not null
)

CREATE TABLE Admin(
id int primary key foreign key references PostGradUser on delete cascade on update cascade
)

CREATE TABLE GucianStudent(
id int primary key foreign key references PostGradUser on delete cascade on update cascade,
firstName varchar(20),
lastName varchar(20),
type varchar(3),
faculty varchar(30),
address varchar(50),
GPA decimal(3,2),
undergradID int
)

CREATE TABLE NonGucianStudent(
id int primary key foreign key references PostGradUser on delete cascade on update cascade,
firstName varchar(20),
lastName varchar(20),
type varchar(3),
faculty varchar(30),
address varchar(50),
GPA decimal(3,2),
)



CREATE TABLE GUCStudentPhoneNumber(
id int foreign key references GucianStudent on delete cascade on update cascade,
phone varchar(50) ,
primary key(id,phone)
)


CREATE TABLE NonGUCStudentPhoneNumber(
id int foreign key references NonGucianStudent on delete cascade on update cascade,
phone varchar(50),
primary key(id,phone)
)


select * from NonGUCianStudentRegisterThesis
select * from PostGradUser
select * from NonGucianStudent

-----------------------------
CREATE TABLE Course(
id int primary key identity(1,1),
fees int,
creditHours int,
code varchar(10)
)

CREATE TABLE Supervisor(
id int primary key foreign key references PostGradUser,
name varchar(20),
faculty varchar(30)
);

CREATE TABLE Examiner(
id int primary key foreign key references PostGradUser on delete cascade on update cascade,
name varchar(20),
fieldOfWork varchar(100),
isNational BIT
)

CREATE TABLE Payment(
id int primary key identity(1,1),
amount decimal(7,2),
noOfInstallments int,
fundPercentage decimal(4,2)
)

CREATE TABLE Thesis(
serialNumber int primary key identity(1,1),
field varchar(20),
type varchar(20) not null,
title varchar(100) not null,
startDate date not null,
endDate date not null,
defenseDate date,
years as (year(endDate)- year(startDate)),
grade decimal(4,2),
payment_id int foreign key references payment on delete cascade on update cascade,
noOfExtensions int
)
select * from Thesis 
CREATE TABLE Publication(
id int primary key identity(1,1),
title varchar(100) not null,
dateOfPublication date,
place varchar(100),
accepted BIT,
host varchar(100)
);

Create table Defense (serialNumber int,
date datetime,
location varchar(15),
grade decimal(4,2),
primary key (serialNumber, date),
foreign key (serialNumber) references Thesis on delete cascade on update cascade)


Create table GUCianProgressReport (
sid int foreign key references GUCianStudent on delete cascade on update cascade, 
no int, 
date datetime, 
eval int, 
state int, 
description varchar(200), 
thesisSerialNumber int foreign key references Thesis on delete cascade on update cascade, 
supid int foreign key references Supervisor, 
primary key (sid, no) )

Create table NonGUCianProgressReport (sid int foreign key references NonGUCianStudent on delete cascade on update cascade,
no int
, date datetime
, eval int
, state int
, description varchar(200)
, thesisSerialNumber int foreign key references Thesis on delete cascade on update cascade
, supid int foreign key references Supervisor
, primary key (sid, no) )

Create table Installment 
(date datetime,
paymentId int foreign key references Payment on delete cascade on update cascade,
amount decimal(8,2), 
done bit, 
primary key (date, paymentId))



select *from Installment

Create table NonGucianStudentPayForCourse(sid int foreign key references NonGucianStudent on delete cascade on update cascade,
paymentNo int foreign key references Payment on delete cascade on update cascade,
cid int foreign key references Course on delete cascade on update cascade,
primary key (sid, paymentNo, cid))


Create table NonGucianStudentTakeCourse (sid int foreign key references NonGUCianStudent on delete cascade on update cascade
, cid int foreign key references Course on delete cascade on update cascade
, grade decimal (4,2)
, primary key (sid, cid) )

Create table GUCianStudentRegisterThesis (sid int foreign key references GUCianStudent on delete cascade on update cascade,
supid int foreign key references Supervisor
, serial_no int foreign key references Thesis on delete cascade on update cascade
, primary key(sid, supid, serial_no))


Create table NonGUCianStudentRegisterThesis (sid int foreign key references NonGUCianStudent on delete cascade on update cascade,
supid int foreign key references Supervisor,
serial_no int foreign key references Thesis on delete cascade on update cascade,
primary key (sid, supid, serial_no))


Create table ExaminerEvaluateDefense(date datetime,
serialNo int,
examinerId int foreign key references Examiner on delete cascade on update cascade,
comment varchar(300),
primary key(date, serialNo, examinerId),
foreign key (serialNo, date) references Defense (serialNumber, date) on delete cascade on update cascade)

Create table ThesisHasPublication(serialNo int foreign key references Thesis on delete cascade on update cascade,
pubid int foreign key references Publication on delete cascade on update cascade,
primary key(serialNo,pubid))


select * from PostGradUser

--- extra procedure for admin registration ---



go
create proc studentRegister
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@faculty varchar(20),
@Gucian bit,
@email varchar(50),
@address varchar(50)
as
begin
insert into PostGradUser(email,password) values(@email,@password)
DECLARE @id int
SELECT @id=SCOPE_IDENTITY()
if(@Gucian=1)
insert into GucianStudent(id,firstName,lastName,faculty,address) values(@id,@first_name,@last_name,@faculty,@address)
else
insert into NonGucianStudent(id,firstName,lastName,faculty,address) values(@id,@first_name,@last_name,@faculty,@address)
end


select * from PostGradUser
select * from GucianStudent

go
create proc supervisorRegister
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@faculty varchar(20),
@email varchar(50)
as
begin
insert into PostGradUser(email,password) values(@email,@password)
DECLARE @id int
SELECT @id=SCOPE_IDENTITY()
declare @name varchar(50)
set @name = CONCAT(@first_name,@last_name)
insert into Supervisor(id,name,faculty) values(@id,@name,@faculty)
end


-------- Insertion ---------------
insert into PostGradUser (email, password ) values ('abdelfattah_sisi@gmail.com', 'masr123')
declare @adminID int 
set @adminID = SCOPE_IDENTITY()
insert into Admin (id) values (@adminID)



select * from PostGradUser
select * from Supervisor
select * from PostGradUser


go
create proc userLogin
@email varchar (50),
@password varchar(20),
@success bit output,
@id int output,
@type int output,
@Gucian int output
AS

if exists( select email,password from PostGradUser where email=@email and password=@password)
BEGIN
set @success ='1'
select @id = id from PostGradUser where email=@email and password=@password 

-- check user type 0-->Student,1-->Admin,2-->Supervisor ,3-->Examiner
if exists(select id  from GucianStudent where GucianStudent.id = @id )
begin
set @type=0
set @Gucian=1
END
if exists(select id from NonGucianStudent where NonGucianStudent.id =@id)
BEGIN
set @type=0
set @Gucian=2
END
if exists(select Admin.id from Admin where admin.id=@id )
BEGIN
set @type=1
set @Gucian =0
END

if exists(select id from Supervisor where Supervisor.id=@id)
BEGIN 
set @type=2
set @Gucian = 0
END

if exists(select id from Examiner where Examiner.id=@id )
BEGIN 
set @type=3
set @Gucian = 0
END

END
else
set @success= '0'

select * from NonGucianStudent


GO
create proc addMobile
@ID varchar(20),
@mobile_number varchar(20)
as
begin
if @ID is not null and @mobile_number is not null
begin
--check Gucian student or not
if(exists(select * from GucianStudent where id=@ID))
insert into GUCStudentPhoneNumber values(@ID,@mobile_number)
if(exists(select * from NonGucianStudent where id=@ID))
insert into NonGUCStudentPhoneNumber values(@ID,@mobile_number)
end
end

select* from GUCStudentPhoneNumber

go
CREATE Proc AdminListSup
As
Select u.id,u.email,u.password,s.name, s.faculty
from PostGradUser u inner join Supervisor s on u.id = s.id
go

CREATE Proc AdminViewSupervisorProfile
@supId int
As
Select u.id,u.email,u.password,s.name, s.faculty
from PostGradUser u inner join Supervisor s on u.id = s.id
WHERE @supId = s.id
go

CREATE Proc AdminViewAllTheses
As
Select serialNumber,field,type,title,startDate,endDate,defenseDate,years,grade,payment_id,noOfExtensions
From Thesis

go
CREATE Proc AdminViewOnGoingTheses
@thesesCount int output
As
Select @thesesCount=Count(*)
From Thesis
where endDate > Convert(Date,CURRENT_TIMESTAMP)

go
CREATE Proc AdminViewStudentThesisBySupervisor
As
Select s.name,t.title,gs.firstName
From Thesis t inner join GUCianStudentRegisterThesis sr on t.serialNumber=sr.serial_no
inner join Supervisor s on s.id=sr.supid inner join GucianStudent gs on sr.sid=gs.id
where t.endDate > Convert(Date,CURRENT_TIMESTAMP)
union
Select s.name,t.title,gs.firstName
From Thesis t inner join NonGUCianStudentRegisterThesis sr on t.serialNumber=sr.serial_no
inner join Supervisor s on s.id=sr.supid inner join NonGucianStudent gs on sr.sid=gs.id
where t.endDate > Convert(Date,CURRENT_TIMESTAMP)

select * from GUCianStudentRegisterThesis
select * from NonGUCianStudentRegisterThesis

--- check execution ---
go
CREATE Proc AdminListNonGucianCourse
@courseID int
As
if(exists(select * from Course where id=@courseID))
Select ng.firstName,ng.lastName,c.code,n.grade
From NonGucianStudentTakeCourse n inner join Course c on n.cid=c.id inner join NonGucianStudent ng on ng.id=n.sid
where n.cid=@courseID

go
CREATE Proc AdminUpdateExtension
@ThesisSerialNo int
As
if(exists(select * from Thesis where serialNumber=@ThesisSerialNo))
begin
declare @noOfExtensions int
select @noOfExtensions=noOfExtensions from Thesis where serialNumber=@ThesisSerialNo
update Thesis
set noOfExtensions=@noOfExtensions+1,Thesis.endDate = DATEADD ( year,1, Thesis.endDate)
where serialNumber=@ThesisSerialNo
end

Select * from NonGucianStudentTakeCourse
select * from Course
select * from NonGucianStudent
select * from Thesis


go
CREATE Proc AdminIssueThesisPayment
@ThesisSerialNo int,
@amount decimal,
@noOfInstallments int,
@fundPercentage decimal
As
if(exists(select * from Thesis where serialNumber=@ThesisSerialNo))
begin
insert into Payment(amount,noOfInstallments,fundPercentage) values(@amount,@noOfInstallments,@fundPercentage)
declare @id int
SELECT @id=SCOPE_IDENTITY()
update Thesis
set payment_id=@id
where serialNumber=@ThesisSerialNo
end

go
CREATE Proc AdminViewStudentProfile
@sid int
As
if(exists(select * from GucianStudent where id=@sid))
Select u.id,u.email,u.password,s.firstName,s.lastName,s.type,s.faculty,s.address,s.address,s.GPA
from PostGradUser u inner join GucianStudent s on u.id=s.id
WHERE @sid = s.id
else if(exists(select * from NonGucianStudent where id=@sid))
Select u.id,u.email,u.password,s.firstName,s.lastName,s.type,s.faculty,s.address,s.address,s.GPA
from PostGradUser u inner join NonGucianStudent s on u.id=s.id
WHERE @sid = s.id

select * from Supervisor

select * from Installment

drop proc AdminIssueInstallPayment

go
CREATE Proc AdminIssueInstallPayment
@paymentID int,
@InstallStartDate date, @success bit output
As
set @success=0

if(exists(select * from Payment where id=@paymentID))
begin
declare @numOfInst int
select @numOfInst=noOfInstallments
from Payment
where id=@paymentID

declare @payAmount int
select @payAmount=amount
from Payment
where id=@paymentID

DECLARE @Counter INT
SET @Counter=1


declare @instdate date
set @instdate=@InstallStartDate

declare @instAmount int
set @instAmount= @payAmount/@numOfInst

WHILE (@counter <= @numOfInst)
BEGIN

if(@counter=1)
Begin
insert into Installment(date,paymentId,amount,done)values(@InstallStartDate,@paymentID,@instAmount,0)
set @instdate = DATEADD(MONTH, 6, @instdate);
set @success=1
end

else
begin

insert into Installment(date,paymentId,amount,done)values(@instdate,@paymentID,@instAmount,0)
set @instdate = DATEADD(MONTH, 6, @instdate);
set @success=1
end 

SET @counter=@counter+1

END
end


select * from Thesis

go
CREATE Proc AdminListAcceptPublication
As
select t.serialNumber,p.title
from ThesisHasPublication tp inner join Thesis t on tp.serialNo=t.serialNumber
inner join Publication p on p.id=tp.pubid
where p.accepted=1

go
CREATE Proc AddCourse
@courseCode varchar(10),
@creditHrs int,
@fees decimal
As
insert into Course values(@fees,@creditHrs,@courseCode)


go
CREATE Proc linkCourseStudent
@courseID int,
@studentID int
As
if(exists(select * from Course where id=@courseID))
BEGIN
if(exists(select * from NonGucianStudent where id=@studentID))
insert into NonGucianStudentTakeCourse(sid,cid,grade)values(@studentID,@courseID,null)
END




select * from Course
select * from NonGucianStudent

select * from NonGucianStudentTakeCourse
go
CREATE Proc addStudentCourseGrade
@courseID int,
@studentID int,
@grade decimal
As
if(exists(select * from NonGucianStudentTakeCourse where sid=@studentID and cid=@courseID))
update NonGucianStudentTakeCourse
set grade =@grade
where cid=@courseID and sid=@studentID



go
CREATE Proc ViewExamSupDefense
@defenseDate datetime
As
select s.serial_no,ee.date,e.name,sup.name
from ExaminerEvaluateDefense ee inner join examiner e on ee.examinerId=e.id
inner join GUCianStudentRegisterThesis s on ee.serialNo=s.serial_no
inner join Supervisor sup on sup.id=s.supid

go
CREATE Proc EvaluateProgressReport
@supervisorID int,
@thesisSerialNo int,
@progressReportNo int,
@evaluation int
As
if(exists(select * from Thesis where serialNumber=@thesisSerialNo ) and @evaluation in(0,1,2,3) )
begin
if(exists(select * from GUCianStudentRegisterThesis where serial_no=@thesisSerialNo and supid=@supervisorID))
begin
declare @gucSid int
select @gucSid=sid
from GUCianStudentRegisterThesis
where serial_no=@thesisSerialNo
update GUCianProgressReport
set eval=@evaluation, supid=@supervisorID
where sid=@gucSid and thesisSerialNumber=@thesisSerialNo and no=@progressReportNo
end
else if(exists(select * from NonGUCianStudentRegisterThesis where serial_no=@thesisSerialNo and supid=@supervisorID))
begin
declare @nonGucSid int
select @nonGucSid=sid
from NonGUCianStudentRegisterThesis
where serial_no=@thesisSerialNo
update NonGUCianProgressReport
set eval=@evaluation,supid=@supervisorID
where sid=@nonGucSid and thesisSerialNumber=@thesisSerialNo and no=@progressReportNo
end
end


go
CREATE Proc ViewSupStudentsYears
@supervisorID int
As
if(exists(select * from Supervisor where id=@supervisorID))
begin
select s.firstName,s.lastName,t.years
from GUCianStudentRegisterThesis sr inner join GucianStudent s on sr.sid=s.id
inner join Thesis t on t.serialNumber=sr.serial_no
where sr.supid=@supervisorID
union
select s.firstName,s.lastName,t.years
from NonGUCianStudentRegisterThesis sr inner join NonGucianStudent s on sr.sid=s.id
inner join Thesis t on t.serialNumber=sr.serial_no
where sr.supid=@supervisorID
end

drop proc ViewSupStudentsYears

select * from PostGradUser
select * from GucianStudent

select * from Supervisor
select * from Thesis

select * from Admin


go
CREATE Proc SupViewProfile
@supervisorID int
As
if(exists(select * from Supervisor where id=@supervisorID))
begin
select u.id,u.email,u.password,s.name,s.faculty
from PostGradUser u inner join Supervisor s on u.id=s.id
end
go
---------------------------------------
create proc UpdateSupProfile
@supervisorID int, @name varchar(20), @faculty varchar(20)
as
update Supervisor
set name = @name, faculty = @faculty
where id = @supervisorID



select * from Publication
select * from ThesisHasPublication

go
create proc ViewAStudentPublications
@StudentID int
as
select P.*
from GUCianStudentRegisterThesis GUC
inner join Thesis T
on GUC.serial_no = T.serialNumber
inner join ThesisHasPublication TP
on T.serialNumber = TP.serialNo
inner join Publication P
on P.id = TP.pubid
where GUC.sid = @StudentID
union all
select P.*
from NonGUCianStudentRegisterThesis NON
inner join Thesis T
on NON.serial_no = T.serialNumber
inner join ThesisHasPublication TP
on T.serialNumber = TP.serialNo
inner join Publication P
on P.id = TP.pubid
where NON.sid = @StudentID



go 
create proc AddDefenseGucian 
@ThesisSerialNo int , 
@DefenseDate Datetime , 
@DefenseLocation varchar(15),
@success bit output
AS
set @success=0
declare @studentID1 int
 
select @studentID1= GT.sid 
from GucianStudentRegisterThesis GT
where GT.serial_no = @ThesisSerialNo

if @studentID1 is not null
BEGIN
insert into Defense (serialNumber,date,location) VALUES(@ThesisSerialNo, @DefenseDate, @DefenseLocation)
UPDATE Thesis
set defenseDate=@DefenseDate
where serialNumber=@ThesisSerialNo
set @success=1
END


go
create proc AddDefenseNonGucian
@ThesisSerialNo int , @DefenseDate Datetime , @DefenseLocation varchar(15),@success bit output
as
set @success=0

declare @idOfStudent int
select @idOfStudent = sid
from NonGUCianStudentRegisterThesis
where serial_no = @ThesisSerialNo
if(not exists(select grade
from NonGucianStudentTakeCourse
where sid = @idOfStudent and grade < 50))
begin
insert into Defense values(@ThesisSerialNo,@DefenseDate,@DefenseLocation,null)
UPDATE Thesis
set defenseDate=@DefenseDate
where serialNumber=@ThesisSerialNo
set @success=1
end


select * from NonGucianStudent


select * from PostGradUser


---- extra procedure for examiner registration ------
GO
CREATE PROC RegisterExaminer
@email varchar(50),
@password varchar (20),
@ExaminerName varchar(20), 
@National bit, 
@fieldOfWork varchar(20)
AS
insert into PostGradUser (email, password) values (@email, @password)
DECLARE @examID int
set @examID = SCOPE_IDENTITY()
insert into Examiner (id,name, isNational, fieldOfWork) values (@examID,@ExaminerName, @National, @fieldOfWork)


drop proc RegisterExaminer

GO
CREATE PROC AddExaminer
@ThesisSerialNo int , 
@DefenseDate Datetime , 
@ExaminerId int,
@success bit output

AS
set @success=0
 if (exists( select * from Thesis where serialNumber=@ThesisSerialNo and defenseDate=@DefenseDate))
 BEGIN
insert into ExaminerEvaluateDefense (date, serialNo, examinerId) values (@DefenseDate, @ThesisSerialNo, @ExaminerId)
set @success=1
END



go
create proc CancelThesis
@ThesisSerialNo int, @success bit output
as
set @success=0

if(exists( select * from GUCianProgressReport where thesisSerialNumber = @ThesisSerialNo ))
begin
declare @gucianEval int
set @gucianEval = (
select top 1 eval
from GUCianProgressReport
where thesisSerialNumber = @ThesisSerialNo
order by no desc)
if(@gucianEval = 0)
begin
delete from Thesis where serialNumber = @ThesisSerialNo
set @success=1
end
end
else
begin
declare @nonGucianEval int
set @nonGucianEval = (
select top 1 eval
from NonGUCianProgressReport
where thesisSerialNumber = @ThesisSerialNo
order by no desc
)
if(@nonGucianEval = 0)
begin
delete from Thesis where serialNumber = @ThesisSerialNo
set @success=1
end
end



go
create proc AddGrade
@ThesisSerialNo int
as
declare @grade decimal(4,2)
select @grade = grade
from Defense
where serialNumber = @ThesisSerialNo
update Thesis
set grade = @grade
where serialNumber = @ThesisSerialNo


go
create proc AddDefenseGrade
@ThesisSerialNo int , @DefenseDate Datetime , @grade decimal(4,2), @examinerID int, @success bit output
as
set @success=0
if(exists(select * from ExaminerEvaluateDefense where examinerId=@examinerID and serialNo=@ThesisSerialNo and date=@DefenseDate))
BEGIN
update Defense
set grade = @grade
where serialNumber = @ThesisSerialNo and date = @DefenseDate
set @success=1
END


select * from Defense
select * from ExaminerEvaluateDefense

go
create proc AddCommentsGrade
@ThesisSerialNo int , @DefenseDate Datetime , @comments varchar(300), @examinerID int,@success bit output
as
set @success=0 
if(exists(select * from ExaminerEvaluateDefense where examinerId=@examinerID and serialNo=@ThesisSerialNo and date=@DefenseDate))
BEGIN
update 
ExaminerEvaluateDefense
set comment = @comments
where serialNo = @ThesisSerialNo and date = @DefenseDate
set @success=1
END


go
create proc viewMyProfile
@studentId int
as
if(exists(
select * from GucianStudent where id = @studentId
))
begin
select G.*,P.email
from GucianStudent G
inner join PostGradUser P
on G.id = P.id
where G.id = @studentId
end
else
begin
select N.*,P.email
from NonGucianStudent N
inner join PostGradUser P
on N.id = P.id
where N.id = @studentId
end

select * from GucianStudent

go
create proc editMyProfile
@studentID int, @firstName varchar(20), @lastName varchar(20), @password varchar(30), @email varchar(50)
, @address varchar(50), @type varchar(3)
as
update GucianStudent
set firstName = @firstName, lastName = @lastName, address = @address, type = @type
where id = @studentID
update NonGucianStudent
set firstName = @firstName, lastName = @lastName, address = @address, type = @type
where id = @studentID
update PostGradUser
set email = @email, password = @password
where id = @studentID

go
create proc addUndergradID
@studentID int, @undergradID varchar(10)
as
update GucianStudent
set undergradID = @undergradID
where id = @studentID
go

create proc ViewCoursesGrades
@studentID int
as
select  C.*,NGC.grade
from Course c inner join NonGucianStudentTakeCourse NGC on NGC.cid=c.id
where sid = @studentID

select * from PostGradUser

go
create proc ViewCoursePaymentsInstall
@studentID int
as
select P.id as 'Payment Number', P.amount as 'Amount of Payment',P.fundPercentage as 'Percentage of fund for payment', P.noOfInstallments as 'Number of installments',
I.amount as 'Installment Amount',I.date as 'Installment date', I.done as 'Installment done or not'
from NonGucianStudentPayForCourse NPC
inner join Payment P
on NPC.paymentNo = P.id and NPC.sid = @studentID
inner join Installment I
on I.paymentId = P.id
go
create proc ViewThesisPaymentsInstall
@studentID int
as
select P.id as 'Payment Number', P.amount as 'Amount of Payment', P.fundPercentage as 'Fund',P.noOfInstallments as 'Number of installments',
I.amount as 'Installment amount',I.date as 'Installment date', I.done as 'Installment done or not'
from GUCianStudentRegisterThesis G
inner join Thesis T
on G.serial_no = T.serialNumber and G.sid = @studentID
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
union
select P.id as 'Payment Number',P.amount as 'Amount of Payment', P.fundPercentage as 'Fund',P.noOfInstallments as 'Number of installments',
I.amount as 'Installment amount',I.date as 'Installment date', I.done as 'Installment done or not'
from NonGUCianStudentRegisterThesis NG
inner join Thesis T
on NG.serial_no = T.serialNumber and NG.sid = @studentID
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
go
create proc ViewUpcomingInstallments
@studentID int
as
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Installment I
inner join NonGucianStudentPayForCourse NPC
on I.paymentId = NPC.paymentNo and NPC.sid = @studentID and I.date > CURRENT_TIMESTAMP
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join GUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date > CURRENT_TIMESTAMP
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join NonGUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date > CURRENT_TIMESTAMP
go
create proc ViewMissedInstallments
@studentID int
as
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Installment I
inner join NonGucianStudentPayForCourse NPC
on I.paymentId = NPC.paymentNo and NPC.sid = @studentID and I.date < CURRENT_TIMESTAMP and I.done = '0'
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join GUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date < CURRENT_TIMESTAMP and I.done = '0'
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join NonGUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date < CURRENT_TIMESTAMP and I.done = '0'

go
create proc AddProgressReport
@thesisSerialNo int, @progressReportDate date, @studentID int,@progressReportNo int,@success int output
as

declare @gucian int
set @success=0

if(exists(
select id
from GucianStudent
where id = @studentID
))
begin
set @gucian = '1'
end

if(exists( select id from NonGucianStudent where id = @studentID))
begin
set @gucian = '0'
end

if(@gucian = '1')
begin
insert into GUCianProgressReport values(@studentID,@progressReportNo,@progressReportDate,null,null,null,@thesisSerialNo,null)
set @success='1'
end

if(@gucian='0')
begin
insert into NonGUCianProgressReport values(@studentID,@progressReportNo,@progressReportDate,null,null,null,@thesisSerialNo,null)
set @success='1'
end



select * from GUCianProgressReport



go
create proc FillProgressReport
@thesisSerialNo int, @progressReportNo int, @state int, @description varchar(200),@studentID int, @success bit output
as
declare @gucian bit
set @success=0

if(exists(
select * from GucianStudent
where id = @studentID
))
begin
set @gucian = '1'
end

if(exists(
select * from NonGucianStudent
where id = @studentID
))
begin
set @gucian = '0'
end

if(@gucian = '1')
begin
update GUCianProgressReport
set state = @state, description = @description, date = CURRENT_TIMESTAMP
where thesisSerialNumber = @thesisSerialNo and sid = @studentID and no = @progressReportNo
set @success=1
end

if (@gucian='0')
begin
update NonGUCianProgressReport
set state = @state, description = @description, date = CURRENT_TIMESTAMP
where thesisSerialNumber = @thesisSerialNo and sid = @studentID and no = @progressReportNo
set @success=1
end




select * from NonGUCianProgressReport


drop proc FillProgressReport

go
create proc ViewEvalProgressReport
@thesisSerialNo int, @progressReportNo int,@studentID int
as
select eval
from GUCianProgressReport
where sid = @studentID and thesisSerialNumber = @thesisSerialNo and no = @progressReportNo
union
select eval
from NonGUCianProgressReport
where sid = @studentID and thesisSerialNumber = @thesisSerialNo and no = @progressReportNo

go
create proc addPublication
@title varchar(50), @pubDate datetime, @host varchar(50), @place varchar(50), @accepted bit
as
insert into Publication values(@title,@pubDate,@place,@accepted,@host)

go
create proc linkPubThesis
@PubID int, @thesisSerialNo int
as
insert into ThesisHasPublication values(@thesisSerialNo,@PubID)

---- extra procedure for student register thesis -----
go 
create proc StudentRegisterThesis
@studentID int,
@superID int,
@field varchar(20),
@type varchar(20),
@title varchar(20),
@startDate datetime,
@endDate datetime,
@noOfExtensions int

AS
INSERT INTO Thesis(field,type,title,startDate,endDate,noOfExtensions) VALUES(@field,@type,@title,@startDate,@endDate,@noOfExtensions)
DECLARE @newSerial int
set @newSerial= SCOPE_IDENTITY()

IF (EXISTS( SELECT* FROM GucianStudent where GucianStudent.id =@studentID))
INSERT INTO GucianStudentRegisterThesis(sid,supid,serial_no) VALUES(@studentID,@superID,@newSerial)

ELSE
INSERT INTO NonGucianStudentRegisterThesis(sid,supid,serial_no) VALUES(@studentID,@superID,@newSerial)


select * from publication 
select * from GUCianProgressReport
Select * from GucianStudent
Select * from GUCianStudentRegisterThesis
select * from Thesis

-----new procedure for viewing thesis-------
go 
create proc StudentViewThesis 
@id int

as
if (exists (select * from GUCianStudentRegisterThesis where GUCianStudentRegisterThesis.sid = @id ))
begin
select Thesis.* from GUCianStudentRegisterThesis GRT 
inner join Thesis on GRT.serial_no = Thesis.serialNumber
where GRT.sid=@id
end
if(exists(select * from NonGUCianStudentRegisterThesis where NonGUCianStudentRegisterThesis.sid=@id))
BEGIN
select Thesis.* from NonGUCianStudentRegisterThesis NGRT 
inner join Thesis on NGRT.serial_no = Thesis.serialNumber
where NGRT.sid=@id
END


-- extra procedures for component --
go
create proc ExamSupDefense
@examinerID int

As

if(exists( select E.id from Examiner E inner join ExaminerEvaluateDefense ED on E.id=Ed.examinerId))
BEGIN
select T.title, G.firstName,G.lastName, S.name
from Thesis T inner join GUCianStudentRegisterThesis GT on T.serialNumber=GT.serial_no
inner join GucianStudent G on Gt.sid=G.id
inner join Supervisor S on GT.supid=S.id 
inner join 
ExaminerEvaluateDefense ED on GT.serial_no=ED.serialNo
where ED.examinerId=@examinerID

UNION

select T1.title, NG.firstName,NG.lastName, S1.name
from Thesis T1 inner join NonGUCianStudentRegisterThesis NGT on T1.serialNumber=NGT.serial_no
inner join NonGucianStudent NG on NGT.sid=NG.id
inner join Supervisor S1 on NGT.supid=S1.id 
inner join 
ExaminerEvaluateDefense ED1 on NGT.serial_no=ED1.serialNo
where ED1.examinerId=@examinerID


END


go 
create proc ExaminerSearch
@keyword varchar(50),@success bit output
As
set @success=0
if (exists(Select * From Thesis where title LIKE '%' + @keyword+ '%'))
BEGIN
Select *
From Thesis
where title LIKE '%' + @keyword+ '%'
set @success=1
end




declare @success bit 
EXEC ExaminerSearch 'testings',@success output
print @success



go
 create proc UpdateExaminerName
 @ExaminerID int,@name varchar(20)
 as 
 if(exists(select * from Examiner where Examiner.id=@ExaminerID))
 BEGIN
 Update Examiner
 set name= @name
 where Examiner.id= @ExaminerID
 END

 go
 create proc UpdateExaminerField
 @fieldOfWork varchar(100), @ExaminerID int
 AS

 if(exists(select * from Examiner where Examiner.id=@ExaminerID))
 BEGIN
 Update Examiner
 set fieldOfWork= @fieldOfWork
 where Examiner.id= @ExaminerID
 END

 exec UpdateExaminerName 10,'Haythem Ismail'
 exec UpdateExaminerField 'Engineering',10



 
select * from Supervisor
select * from GucianStudent
select * from PostGradUser
select * from Examiner
select * from Thesis 
select * from Supervisor
select * from ExaminerEvaluateDefense
select * from NonGUCianProgressReport
select * from GUCianProgressReport
select * from GUCianStudentRegisterThesis
select * from Course
select * from NonGucianStudentTakeCourse




go
create trigger deleteSupervisor
on Supervisor
instead of delete
as
delete from GUCianProgressReport where supid in (select id from deleted)
delete from NonGUCianProgressReport where supid in (select id from deleted)
delete from GUCianStudentRegisterThesis where supid in (select id from deleted)
delete from NonGUCianStudentRegisterThesis where supid in (select id from deleted)
delete from Supervisor where id in (select id from deleted)
delete from PostGradUser where id in (select id from deleted)