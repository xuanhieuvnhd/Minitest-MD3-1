create database quanlyhocvien;
use quanlyhocvien;
create table Classes(
    classesID int not null auto_increment primary key,
    className varchar(50) not null ,
    classesLanguage varchar(50),
    classDescription varchar(100) not null
);
create table Address(
    addressID int not null auto_increment primary key,
    address varchar(100) not null
);
create table Students(
    studentsID int not null auto_increment primary key,
    studentsFullName varchar(100) not null ,
    address_ID int not null ,
    classes_ID int not null ,
    studentsAge int not null ,
    studentsPhone varchar(20) unique
    # foreign key (address_ID) references Address(addressID),
#     foreign key (classes_ID) references Classes(classesID)
);
create table Course(
    courseID int not null auto_increment primary key,
    courseName varchar(50) not null ,
    courseDescription varchar(100) not null
);
create table Point(
    pointID int not null auto_increment primary key,
    course_ID int not null ,
    students_ID int not null ,
    point float not null 
   #  foreign key (course_ID) references Course(courseID),
#     foreign key (students_ID) references Students(studentsID)
);

insert into Address (addressID, address) values
(1,'Hà Nội'),(2,'Hải Phòng'),(3,'Hà Nam'),(4,'Thái Bình'),(5,'Hải Dương');

insert into Classes (classesID, className, classesLanguage, classDescription) values
(1,'Môn toán','Việt Nam','Rất nhiều giáo viên dạy tốt'),
(2,'English','Tiếng Anh','Rất nhiều gái xinh đẹp'),
(3,'Môn lý','Việt Nam','Rất thích thú'),
(4,'Môn hoá','Việt Nam','Rất khó cho tất cả học viên'),
(5,'Môn sinh','Việt Nam','Cực kì thú vị');

insert into Students(studentsID, studentsFullName, address_ID, classes_ID, studentsAge, studentsPhone) values
(1,'Bui Huy Hieu',1,4,35,08468348),
(2,'Nguyen Hoang Trieu',2,4,15,03468543),
(3,'Tran Duy Duong',3,5,16,09764583),
(4,'Dang Truong Giang',4,3,17,09457823),
(5,'Nguyen Anh Ngoc',3,2,16,09563741),
(6,'Vu Kieu Anh',5,1,15,09238956),
(7,'To Viet Anh',1,2,16,09456643),
(8,'Le Van Luong',5,4,18,09653284),
(9,'Hoang Van Trung',1,5,17,09457825),
(10,'Dao Van Khoa',2,3,16,09435638);

insert into Course(courseID, courseName, courseDescription) values
(1,'Cơ bản','Công nghệ phần mềm'),
(2,'Chuyên ngành','Khoa học thiên văn'),
(3,'Nâng cao','Lập trình nâng cao');

insert into Point(pointID, course_ID, students_ID, point) values
(1,2,1,95),
(2,1,2,94),
(3,2,3,93),
(4,3,4,92),
(5,1,5,91),
(6,2,6,90),
(7,3,7,89),
(8,1,8,88),
(9,2,9,92),
(10,3,2,95),
(11,1,10,94),
(12,3,4,97),
(13,2,3,94),
(14,1,5,91),
(15,2,6,98);
#Hàm sum Hiển thị tổng điểm của các học viên
select sum(point)'Tổng điểm' from Point;
#Hàm avg Hiển thị điểm trung bình của tất cả các học viên
select avg(point)'Điểm Trung Bình' from Point;
#Hàm count Đếm số bản ghi trong 1 cột
select studentsID'Mã sinh viên',studentsFullName'Tên sinh viên', count(studentsID)'Mã sinh viên'from Students;
#Hàm Max trả về giá trị lớn nhất của 1 cột
select studentsID'Mã sinh viên',studentsFullName'Tên sinh viên',max(studentsAge)'Tuổi sinh viên' from Students;
#Hàm min trả về giá trị nhỏ nhất của 1 cột
select studentsID'Mã sinh viên',studentsFullName'Tên sinh viên',min(studentsAge)'Tuổi sinh viên'from Students;
#Hàm ucase để chuyển đổi chuỗi thành chữ in hoa
select studentsID'Mã sinh viên',studentsFullName'Tên sinh viên',ucase(studentsFullName)'Tên sinh viên' from Students;
#Hàm lcase để chuyển đổi chuỗi thành chữ in thường
select studentsID'Mã sinh viên',studentsFullName'Tên sinh viên',lcase(studentsFullName)'Tên sinh viên' from Students;
#Hàm lengt để trả về số lượng kí tự của 1 chuỗi
select studentsID'Mã sinh viên',studentsFullName'Tên sinh viên',length(studentsFullName) as 'Số ký tự'from Students;
#Hàm now trả về ngày giờ hiện tại của hệ thống
select studentsID'Mã sinh viên',studentsFullName'Tên sinh viên',now()'Ngày giờ hiện tại' from Students;
#Hiển thị tất cả các học viên
select * from  Students;
#Tìm kiếm HV có họ Nguyen
select * from  Students where studentsFullName like 'Nguyen%';
#Tìm kiếm học viên có tên Anh
select * from  Students where studentsFullName like '%Anh%';
#Tìm kiếm học viên có độ tuổi từ 17 đến 18
select * from  Students where studentsAge between 17 and 18;
#Tìm kiếm học có mã học viên là 9
select * from  Students where studentsID = 9;
#Thống kê số lượng học viên các lớp (count)
select className'Lớp Học' , COUNT(studentsFullName) 'Số Lượng' from Students 
join Classes C on Students.classes_ID = C.classesID group by className;
#Thống kê số lượng học viên các tỉnh(count)
select address'Tên Địa Chỉ' , COUNT(studentsFullName)'Số Lượng' from Students 
join Address A on A.addressID = Students.address_ID group by address;
#Tính điểm trung bình của các khoá học (avg)
select courseID'Mã khoá học', courseName'Tên Khóa Học' , avg(point)'Điểm Trung Bình' from Course
join Point P on Course.courseID = P.course_ID group by courseName;
#Khoá học có điểm trung bình cao nhất
select courseID'Mã khoá học', courseName 'Tên Khóa Học' , avg(point) 'Điểm Trung Bình' from Course 
join Point P on Course.courseID = P.course_ID group by courseName,
courseID  having avg(point) >= all (select avg(point) from Point group by Point.course_ID);
#Tạo chỉ mục
# Tìm tên học viên tên Vũ Kiều Anh
SELECT * FROM Students WHERE studentsFullName = 'Vu Kieu Anh'; 
#Hiển thị số lần tìm tên Vu Kieu Anh
EXPLAIN SELECT * FROM Students WHERE studentsFullName = 'Vu Kieu Anh'; 
#Thêm chỉ mục cho bảng Student cột full name
ALTER TABLE Students ADD INDEX idx_studentsFullName(studentsFullName);
#Sau khi thêm chỉ mục thì tìm kiếm nhanh hơn
EXPLAIN SELECT * FROM Students WHERE studentsFullName = 'Vu Kieu Anh'; 
#Tìm theo khoá chính
EXPLAIN SELECT * FROM Students WHERE studentsID = 1; 
#Thêm chỉ mục cho bảng Student cột số điện thoại
ALTER TABLE Students ADD INDEX idx_studentsPhone(studentsPhone);
#Luồng chạy khi tìm số điện thoại của học viên
EXPLAIN SELECT * FROM Students WHERE studentsPhone = 08468348;
#Xoá chỉ mục cho bảng Students cột studentsPhone
ALTER TABLE Students DROP INDEX studentsPhone;
ALTER TABLE Students DROP INDEX studentsFullName;
#Tạo View
create view Students_views as select studentsID,studentsFullName,studentsPhone from Students;
#Xem View vừa tạo
select * from Students_views;
#Xoá View
drop view Students_views;
#Sửa View sửa tên Bui Huy Hieu thành Hoàng Hiểu
update Students_views set studentsFullName = 'Hoàng Hiểu' where studentsFullName = 'Bui Huy Hieu';
#Xoá View theo điều kiện cho trước
delete from Students_views where studentsfullname = 'Nguyen Hoang Trieu';
#Tạo thủ tục lưu trữ
#Tạo mới 1 hàm tìm kiếm tất cả học viên
DELIMITER //
DROP PROCEDURE IF EXISTS `findAllStudents`//
CREATE PROCEDURE findAllStudents()
BEGIN
  SELECT * FROM Students;
END //
DELIMITER ;
#Gọi lại hàm vừa tạo bên trên
call findAllStudents();

DELIMITER //
#Nếu đã tồn tại thì xoá
DROP PROCEDURE IF EXISTS `findAllStudents`//
#Xong mới tạo mới thủ tục lưu
CREATE PROCEDURE findAllStudents()
BEGIN
SELECT * FROM Students where studentsAge = 16;
END //
DELIMITER ;
call findAllStudents();
#Tạo một procedure thêm học viên
DELIMITER //
DROP PROCEDURE IF EXISTS `addStudents`//
CREATE PROCEDURE addStudents(
   In name varchar(100),
   In Age int,
   In Phone varchar(20)
)
BEGIN
	INSERT INTO Students (studentsFullName,studentsAge,studentsPhone) 
    VALUES (name, Age,Phone);
END //
DELIMITER ;
#Gọi procedure addStudents để thêm học viên mới
CALL addStudents('Nguyen Tuan Anh', 23,9238951);
call findAllStudents();

#Tạo một procedure sửa học viên
DELIMITER //
DROP PROCEDURE IF EXISTS `updateStudents`//
CREATE PROCEDURE updateStudents(
   in name varchar(100),
   in Age int,
   in Phone varchar(20),
   out result VARCHAR(50)
)
BEGIN
	UPDATE Students
    SET studentsFullName = name,studentsAge = Age,studentsPhone = Phone where studentsFullName = name;
    SET result = 'Cập nhật thông tin thành công!';
END //
DELIMITER ;
#Sửa thông tin học viên với tên là Vu Kieu Anh
call updateStudents('Vu Kieu Anh',28,8888888,@result);
select @result;
call findAllStudents();

#Tạo một procedure sửa học viên
DELIMITER //
DROP PROCEDURE IF EXISTS `removeStudents`//
CREATE PROCEDURE removeStudents(
	in id int
)
BEGIN 
	DELETE FROM Students WHERE studentsID = id;
END//
DELIMITER ;
#Gọi procedure để xoá học viên theo id
call removeStudents(5);
call findAllStudents();
