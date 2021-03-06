--------------------------------------------------------
--  파일이 생성됨 - 화요일-5월-21-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table EMPLOYEE
--------------------------------------------------------

  CREATE TABLE "MBMS"."EMPLOYEE" 
   (	"EMP_NO" VARCHAR2(50 BYTE), 
	"EMP_PW" VARCHAR2(100 BYTE), 
	"EMP_NAME" VARCHAR2(50 BYTE), 
	"EMP_POSITION" VARCHAR2(50 BYTE), 
	"EMP_EMAIL" VARCHAR2(300 BYTE), 
	"CELL_PHONE" VARCHAR2(15 BYTE), 
	"OFFICE_PHONE" VARCHAR2(15 BYTE), 
	"DEPT_NO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "MBMS"."EMPLOYEE"."EMP_NO" IS '사원번호';
   COMMENT ON COLUMN "MBMS"."EMPLOYEE"."EMP_PW" IS '비밀번호';
   COMMENT ON COLUMN "MBMS"."EMPLOYEE"."EMP_NAME" IS '이름';
   COMMENT ON COLUMN "MBMS"."EMPLOYEE"."EMP_POSITION" IS '직급';
   COMMENT ON COLUMN "MBMS"."EMPLOYEE"."EMP_EMAIL" IS '이메일';
   COMMENT ON COLUMN "MBMS"."EMPLOYEE"."CELL_PHONE" IS '핸드폰번호';
   COMMENT ON COLUMN "MBMS"."EMPLOYEE"."OFFICE_PHONE" IS '사무실번호';
   COMMENT ON COLUMN "MBMS"."EMPLOYEE"."DEPT_NO" IS '부서번호';
   COMMENT ON TABLE "MBMS"."EMPLOYEE"  IS '사원';
REM INSERTING into MBMS.EMPLOYEE
SET DEFINE OFF;
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1010','1q2w3e4r!@','박길동','상무','park@gsitm.com','010-2932-1231','02-230-9987',10);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1011','1q2w3e4r!@','김윤복','이사','kim@gsitm.com','010-9932-1231','02-230-9987',11);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1012','1q2w3e4r!@','박문길','이사','gill@gsitm.com','010-7732-1231','02-230-9987',12);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1013','1q2w3e4r!@','김율재','부장','yulll@gsitm.com','010-1132-1231','02-230-9987',13);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1014','1q2w3e4r!@','김윤나','부장','yooon@gsitm.com','010-3232-1231','02-230-9987',14);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1015','1q2w3e4r!@','조윤성','부장','choo@gsitm.com','010-9032-1231','02-230-9987',15);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1016','1q2w3e4r!@','박현빈','부장','binnn@gsitm.com','010-7632-1231','02-230-9987',16);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1017','1q2w3e4r!@','박영수','차장','parkbin@gsitm.com','010-7632-1231','02-230-9987',16);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1018','1q2w3e4r!@','김영호','과장','parkbin@gsitm.com','010-7632-1231','02-230-9987',16);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1019','1q2w3e4r!@','윤정웅','대리','woong@gsitm.com','010-1332-0031','02-230-9987',16);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1020','1q2w3e4r!@','윤정남','사원','namm@gsitm.com','010-1332-0031','02-230-9987',16);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1021','1q2w3e4r!@','박광수','사원','gsoooo@gsitm.com','010-1999-0031','02-230-9987',16);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1022','1q2w3e4r!@','김영길','차장','young@gsitm.com','010-2199-0031','02-230-9987',15);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1023','1q2w3e4r!@','윤정남','과장','jnam@gsitm.com','010-5699-0031','02-230-9987',15);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1024','1q2w3e4r!@','최정식','대리','sikkk@gsitm.com','010-5699-0031','02-230-9987',15);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1025','1q2w3e4r!@','최영환','대리','sikkk@gsitm.com','010-8909-0031','02-230-9987',15);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1026','1q2w3e4r!@','박영호','사원','hooow@gsitm.com','010-8909-0031','02-230-9987',15);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1027','1q2w3e4r!@','김중수','사원','sooo@gsitm.com','010-8009-9031','02-230-9987',15);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1028','1q2w3e4r!@','김영철','차장','youngch@gsitm.com','010-8009-9031','02-230-9987',14);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1029','1q2w3e4r!@','윤지은','대리','eun@gsitm.com','010-8009-9031','02-230-9987',14);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1030','1q2w3e4r!@','박정연','사원','yeon@gsitm.com','010-6663-9031','02-230-9987',14);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1031','1q2w3e4r!@','김진우','사원','jwoo@gsitm.com','010-5363-9031','02-230-9987',14);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1032','1q2w3e4r!@','박성호','차장','sho@gsitm.com','010-6663-9031','02-230-9987',13);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1033','1q2w3e4r!@','김영진','과장','jinn@gsitm.com','010-6663-9031','02-230-9987',13);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1034','1q2w3e4r!@','윤성진','대리','jinniii@gsitm.com','010-6663-9031','02-230-9987',13);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1035','1q2w3e4r!@','김성수','대리','sssoooo@gsitm.com','010-6663-9031','02-230-9987',13);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1036','1q2w3e4r!@','김재호','사원','jhoho@gsitm.com','010-6663-9031','02-230-9987',13);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1037','1q2w3e4r!@','김민재','대리','jaejae@gsitm.com','010-1563-9031','02-230-9987',12);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1038','1q2w3e4r!@','김준호','대리','jaejae@gsitm.com','010-1563-9031','02-230-9987',11);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1039','1q2w3e4r!@','김민우','대리','mwmw@gsitm.com','010-1563-9031','02-230-9987',10);
Insert into MBMS.EMPLOYEE (EMP_NO,EMP_PW,EMP_NAME,EMP_POSITION,EMP_EMAIL,CELL_PHONE,OFFICE_PHONE,DEPT_NO) values ('it1235','1q2w3e4r!@','조성윤','사원','whtjddbs@gsitm.com','010-1563-9031','02-230-9987',10);
--------------------------------------------------------
--  DDL for Index EMPLOYEE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MBMS"."EMPLOYEE_PK" ON "MBMS"."EMPLOYEE" ("EMP_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table EMPLOYEE
--------------------------------------------------------

  ALTER TABLE "MBMS"."EMPLOYEE" ADD CONSTRAINT "EMPLOYEE_PK" PRIMARY KEY ("EMP_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MBMS"."EMPLOYEE" MODIFY ("OFFICE_PHONE" NOT NULL ENABLE);
  ALTER TABLE "MBMS"."EMPLOYEE" MODIFY ("CELL_PHONE" NOT NULL ENABLE);
  ALTER TABLE "MBMS"."EMPLOYEE" MODIFY ("EMP_EMAIL" NOT NULL ENABLE);
  ALTER TABLE "MBMS"."EMPLOYEE" MODIFY ("EMP_POSITION" NOT NULL ENABLE);
  ALTER TABLE "MBMS"."EMPLOYEE" MODIFY ("EMP_NAME" NOT NULL ENABLE);
  ALTER TABLE "MBMS"."EMPLOYEE" MODIFY ("EMP_PW" NOT NULL ENABLE);
  ALTER TABLE "MBMS"."EMPLOYEE" MODIFY ("EMP_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEE
--------------------------------------------------------

  ALTER TABLE "MBMS"."EMPLOYEE" ADD CONSTRAINT "FK_EMPLOYEE_DEPT_NO_DEPARTMENT" FOREIGN KEY ("DEPT_NO")
	  REFERENCES "MBMS"."DEPARTMENT" ("DEPT_NO") ENABLE;
