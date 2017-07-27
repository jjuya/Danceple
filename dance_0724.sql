
/* Drop Tables */

DROP TABLE tb_Apply CASCADE CONSTRAINTS;
DROP TABLE tb_Duescheck CASCADE CONSTRAINTS;
DROP TABLE tb_Genre CASCADE CONSTRAINTS;
DROP TABLE tb_Usernemo CASCADE CONSTRAINTS;
DROP TABLE tb_User CASCADE CONSTRAINTS;
DROP TABLE tb_Grade CASCADE CONSTRAINTS;
DROP TABLE tb_Season CASCADE CONSTRAINTS;
DROP TABLE tb_Project CASCADE CONSTRAINTS;
DROP TABLE tb_Team CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE seq_project;
DROP SEQUENCE seq_season;




/* Create Sequences */

CREATE SEQUENCE seq_project;
CREATE SEQUENCE seq_season;



/* Create Tables */

CREATE TABLE tb_Apply
(
	userid varchar2(20) NOT NULL,
	teamid varchar2(6) NOT NULL,
	genre1 varchar2(6) NOT NULL,
	genre2 varchar2(6),
	genre3 varchar2(6),
	-- 시즌 인덱싱
	seasonid number DEFAULT 0 NOT NULL,
	teamother varchar2(100),
	PRIMARY KEY (userid, teamid)
);


CREATE TABLE tb_Duescheck
(
	userid varchar2(20) NOT NULL,
	-- 시즌 인덱싱
	seasonid number DEFAULT 0 NOT NULL,
	teamid varchar2(6) NOT NULL,
	deuscheck varchar2(2) NOT NULL,
	PRIMARY KEY (userid, seasonid)
);


CREATE TABLE tb_Genre
(
	genreid varchar2(6) NOT NULL,
	genrename varchar2(20) NOT NULL,
	-- 관련 영상이나 설명 링크
	genreurl varchar2(50),
	PRIMARY KEY (genreid)
);


CREATE TABLE tb_Grade
(
	gradeid number NOT NULL,
	gradename varchar2(11) NOT NULL,
	PRIMARY KEY (gradeid)
);


CREATE TABLE tb_Project
(
	projectno number NOT NULL,
	projecttitle varchar2(50) NOT NULL,
	-- YYYY/MM/DD
	-- 매 시즌 프로젝트 실행일자
	projectdate date NOT NULL,
	-- 프로젝트 세부내용
	projectdesc varchar2(50),
	PRIMARY KEY (projectno)
);


CREATE TABLE tb_Season
(
	-- 시즌 인덱싱
	seasonid number DEFAULT 0 NOT NULL,
	-- 시즌의 시작 월.
	-- (간간히 뛰는 달이 있음.)
	snmonth varchar2(2) NOT NULL,
	-- YYYY/MM/dd
	startdate date NOT NULL,
	-- YYYY/MM/DD
	enddate date NOT NULL,
	projectno number NOT NULL,
	PRIMARY KEY (seasonid)
);


CREATE TABLE tb_Team
(
	teamid varchar2(6) NOT NULL,
	teamname varchar2(20) NOT NULL,
	--  금요일/ 토요일 / 일요일
	-- 
	teamday varchar2(10) NOT NULL,
	location varchar2(10) NOT NULL,
	-- HH:MM~HH:MM
	maintime varchar2(11),
	-- HH:MM~HH:MM
	pretime varchar2(11),
	-- Team 소개 페이지 연결
	teamurl varchar2(50),
	teamlevel varchar2(10),
	PRIMARY KEY (teamid)
);


CREATE TABLE tb_User
(
	userid varchar2(20) NOT NULL,
	username varchar2(30) NOT NULL,
	phone varchar2(12) NOT NULL,
	email varchar2(50) NOT NULL,
	gradeid number NOT NULL,
	userpwd varchar2(20) NOT NULL,
	gender varchar2(5) NOT NULL,
	-- 1 : 시즌 신청 패널티 있는 경우.
	-- 0 : 정상
	-- 
	-- 관리자가 설정할 수 있게
	penalty number DEFAULT 0 NOT NULL,
	birthday date NOT NULL,
	imgurl varchar2(150) NOT NULL,
	PRIMARY KEY (userid)
);


CREATE TABLE tb_Usernemo
(
	userid varchar2(20) NOT NULL,
	memo varchar2(50),
	PRIMARY KEY (userid)
);



/* Create Foreign Keys */

ALTER TABLE tb_Apply
	ADD FOREIGN KEY (genre1)
	REFERENCES tb_Genre (genreid)
;


ALTER TABLE tb_Apply
	ADD FOREIGN KEY (genre2)
	REFERENCES tb_Genre (genreid)
;


ALTER TABLE tb_Apply
	ADD FOREIGN KEY (genre3)
	REFERENCES tb_Genre (genreid)
;


ALTER TABLE tb_User
	ADD FOREIGN KEY (gradeid)
	REFERENCES tb_Grade (gradeid)
;


ALTER TABLE tb_Season
	ADD FOREIGN KEY (projectno)
	REFERENCES tb_Project (projectno)
;


ALTER TABLE tb_Apply
	ADD FOREIGN KEY (seasonid)
	REFERENCES tb_Season (seasonid)
;


ALTER TABLE tb_Duescheck
	ADD FOREIGN KEY (seasonid)
	REFERENCES tb_Season (seasonid)
;


ALTER TABLE tb_Apply
	ADD FOREIGN KEY (teamid)
	REFERENCES tb_Team (teamid)
;


ALTER TABLE tb_Duescheck
	ADD FOREIGN KEY (teamid)
	REFERENCES tb_Team (teamid)
;


ALTER TABLE tb_Apply
	ADD FOREIGN KEY (userid)
	REFERENCES tb_User (userid)
;


ALTER TABLE tb_Duescheck
	ADD FOREIGN KEY (userid)
	REFERENCES tb_User (userid)
;


ALTER TABLE tb_Usernemo
	ADD FOREIGN KEY (userid)
	REFERENCES tb_User (userid)
;



/* Comments */

COMMENT ON COLUMN tb_Apply.seasonid IS '시즌 인덱싱';
COMMENT ON COLUMN tb_Duescheck.seasonid IS '시즌 인덱싱';
COMMENT ON COLUMN tb_Genre.genreurl IS '관련 영상이나 설명 링크';
COMMENT ON COLUMN tb_Project.projectdate IS 'YYYY/MM/DD
매 시즌 프로젝트 실행일자';
COMMENT ON COLUMN tb_Project.projectdesc IS '프로젝트 세부내용';
COMMENT ON COLUMN tb_Season.seasonid IS '시즌 인덱싱';
COMMENT ON COLUMN tb_Season.snmonth IS '시즌의 시작 월.
(간간히 뛰는 달이 있음.)';
COMMENT ON COLUMN tb_Season.startdate IS 'YYYY/MM/dd';
COMMENT ON COLUMN tb_Season.enddate IS 'YYYY/MM/DD';
COMMENT ON COLUMN tb_Team.teamday IS ' 금요일/ 토요일 / 일요일
';
COMMENT ON COLUMN tb_Team.maintime IS 'HH:MM~HH:MM';
COMMENT ON COLUMN tb_Team.pretime IS 'HH:MM~HH:MM';
COMMENT ON COLUMN tb_Team.teamurl IS 'Team 소개 페이지 연결';
COMMENT ON COLUMN tb_User.penalty IS '1 : 시즌 신청 패널티 있는 경우.
0 : 정상

관리자가 설정할 수 있게';



