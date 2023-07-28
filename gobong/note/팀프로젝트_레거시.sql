--create user teamproject_legacy identified by 1234;
--grant connect, dba, resource to teamproject_legacy;

CREATE TABLE user1 (
    id varchar2(30) primary key,
    name varchar2(30) not null,
    pw varchar2(100) not null,
    email varchar2(100) not null,
    tel varchar2(15),
    regdate date default sysdate not null
);




CREATE TABLE follows (
    id varchar2(30),   --id가 following_id를 팔로우함
    following_id varchar2(30),
    foreign key(id) references user1(id)
);

commit;

CREATE TABLE board1 (
    no number primary key,
    id varchar2(30) ,
    content varchar2(500),
    hashtag varchar2(100),
    up number default 0,
    regdate date default sysdate not null,
    img1 varchar2(1000) not null,
    img2 varchar2(1000),
    img3 varchar2(1000),
    prv number default 0 --전체공개, 친구공개, 비공개
    ,foreign key(id) references user1(id)
);

-- 보드테이블 upcheck 삭제

alter table board1 drop column upcheck;


commit;

--0718
CREATE TABLE user1 (
    id varchar2(30) primary key,
    name varchar2(30) not null,
    pw varchar2(100) not null,
    email varchar2(100) not null,
    img varchar2(1000) DEFAULT '/img/myimg.jpg',
    tel varchar2(15),
    regdate date default sysdate not null
);

--유저테이블 수정으로 집어넣기

alter table user1 add img varchar2(1000) DEFAULT '/img/myimg.jpg';

desc user1;


-- 보드테이블 upcheck 삭제

CREATE TABLE board1 (
    no number primary key,
    id varchar2(30) ,
    content varchar2(500),
    hashtag varchar2(100),
    up number default 0,
    regdate date default sysdate not null,
    img1 varchar2(1000) not null,
    img2 varchar2(1000),
    img3 varchar2(1000),
    prv number default 0 --전체공개, 친구공개, 비공개
    ,foreign key(id) references user1(id)
);

--수정으로 컬럼제거

alter table board1 drop column upcheck;

desc board1;


--좋아요 테이블추가
--좋아요한 테이블 , 그리고 그걸 누른아이디 , 좋아요 유무
create table like1 (no number ,id varchar2(30) , upcheck number default 0 ,foreign key(no) references board1(no), foreign key(id) references user1(id));



commit;

-- 댓글 테이블 추가
create table reply (rno number primary key, no number, id varchar2(30), comment1 varchar2(500),
    foreign key(no) references board1(no), foreign key(id) references user1(id));
----------------------------------------------------------------------------------------------------
-- 테이블구문

--유저
select * from user1;
--본인을 팔로우한 사람 조회
select u.id from user1 u inner join follows f on f.id = u.id where f.following_id = 'test2';

--본인이 팔로우한 사람 조회
select u.id , f.following_id from user1 u inner join follows f on f.id = u.id where f.id = 'test1';

--본인이 팔로우한 사람의 게시물 리스트 조회
select b.id, b.no from board1 b inner join follows f on f.id = b.id where f.follower_id = 'sons1998' order by;
select pw from user1 where id = 'test1';

--보드
select * from board1;
-- 좋아요시 좋아요 개수 올라가게끔
update board1 set up=up+1 where no=8;



--해쉬태그 글 불러오기
select b.no,u.name, b.id, u.img, b.content, b.img1, b.hashtag, b.regdate,b.up 
    from user1 u , board1 b where u.id=b.id and lower(b.hashtag) Like lower('#%봉%') order by b.no desc;

-- 전체공개글 불러오기
select b.no,u.name, b.id, u.img, b.content, b.img1, b.hashtag, b.regdate,b.up, (select count(*) from reply where no = b.no) as reply_cnt from user1 u inner join board1 b on u.id=b.id where b.prv=0 order by b.no desc;
-- 친구공개글 불러오기
select DISTINCT b.no, u.name, b.id as id, u.img, b.content, b.img1, b.hashtag, b.regdate
		from board1 b, follows f, user1 u 
		where b.id=f.following_id and u.id=f.id and u.id='test1' and b.prv<=1 order by b.regdate desc;
select b.no,u.name, b.id, u.img, b.content, b.img1, b.hashtag, b.regdate,b.up, (select count(*) from reply where no = b.no) as reply_cnt from user1 u inner join board1 b on u.id=b.id order by b.no desc;
        select * from board1;
        
select no from (select * from board1 order by no desc) where rownum=1;
--좋아요
select * from like1;
-- 좋아요 해당 아이디의 좋아요 삭제 delete from like1 where no=2 and id='test1';
desc like1;
insert into like1 values(no, id upcheck);
insert into like1 values(2,'test3',1);
-- 해당 테이블의 좋아요 누른사람들 id 갖고오기
select * from like1 where no=2;
-- 좋아요누른사람들 사진과 아이디 갖고오기
select u.id as id, u.img from like1 l , user1 u where l.id = u.id and no=2;

-- delete from like1 where no=2 and id='test1';
select count(*) from like1 where no=2 and id='test1';
delete from like1 where no=2 and id='test1';


--댓글
-- 글삭제시 댓글도 삭제되게끔
delete from reply where no=7;
--------------------------------------------------------------------------------------------------------------
--인서트구문
--회원가입
insert into user1(id,name,pw,email,tel,regdate,img) values('test6','테스트6','1234','dddd@naver.com','dddd',default,default);

--------------------------------------------------------------------------------------------------------------
-- 더미테이블

-- 더미유저
insert into user1 values('test1','테스트유저','1234','dddd@test.com','010-0000-0000',default);
insert into user1 values('test2','테스트유저','1234','dddd@test.com','010-0000-0000',default);
insert into user1 values('test3','테스트유저','1234','dddd@test.com','010-0000-0000',default);
-- 더미팔로워
insert into follows values('test1','test2');
insert into follows values('test1','test3');
select * from follows;
commit;

--더미게시글 (업체크 없앤후)
insert into board1 values (1, 'test1', '테스트내용1', '#해시태그', default, default, 'test1.jpg', 'img2.png', 'img3.png', default);
insert into board1 values (2, 'test1', '테스트내용2', '#해시태그', default, default, 'test2.jpg', 'img2.png', 'img3.png', default);
insert into board1 values (3, 'test1', '테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3', 
'#해시태그', default, default, 'test3.jpg', 'img2.png', 'img3.png', default);

select * from board1;

commit;

select * from user1;

-------------------------------------


--테스트테이블
CREATE TABLE test_board (
    no number primary key,
    content varchar2(500),
    img1 varchar2(1000) not null
);
insert into test_board values(1,'테스트내용입니다','file');
commit;
select * from test_board;

insert into board1 values (9, 'test1', '테스트내용1', '#해시태그', default, default, 'test1.jpg', 'img2.png', 'img3.png', default);
delete from board1 where no>=0;
commit;
select b.no,u.name, b.id, u.img, b.content, b.img1, b.hashtag, b.regdate from user1 u inner join board1 b on u.id=b.id order by b.no desc;
select * from board1;


commit;

select * from board1;
select * from user1;
commit;

commit;

select * from reply;
delete from reply where no=#{no};
commit;

select * from like1;
select rno from reply order by rno desc;

select * from user1;
desc user1;

insert into user1(id,name,pw,email,tel,regdate,img) values('test7','김김김','1234','ddd@adad.com','010-0000-0000',default,default);
commit;

select * from board1;

select DISTINCT b.no, u.name, b.id as id, u.img, b.content, b.img1, b.hashtag, b.regdate,b.up, (select count(*) from reply where no = b.no) as reply_cnt
		from board1 b, follows f, user1 u 
		where b.id=f.following_id and u.id=f.id and u.id='test1' and b.prv<=1 order by b.regdate desc;
        
-- 내가 쓴 댓글보기

select distinct b.no,b.id,b.content,b.hashtag,b.up,b.regdate,b.img1,b.img2,b.img3,b.prv 	from board1 b, reply r where b.no= r.no and r.id='test1';


SELECT * FROM user1 WHERE id LIKE 'test%';

select * from board1;
insert into board1 values (16, 'test1', '테스트내용3'||CHR(13)||CHR(10)||'엔터테    시트      잘되'||CHR(13)||CHR(10)||'나', '#해시태그', default, default, 'test1.jpg', 'img2.png', 'img3.png', default);

SELECT CHR(10)
FROM dual;

commit;

INSERT INTO board1 VALUES
(18, 'test1', '2010년 1월 4일에 태어난 왓섭이 육아일기를 시작하겠습니다'||CHR(13)||CHR(10)||' 매우 귀여우니 심장 조심하세요.', 
'#2010년 #첫만남 #꼬물이', DEFAULT, DEFAULT, '00.jpg', '02.jpg', '01.jpg', DEFAULT);

select * from reply where id='test1';
select * from like1;
select no from board1 where id='test1';
-- 인티저 리스트로 받아와서 순회하면서 오라클구문 다 삭제
select * from follows;

desc follows;
FOLLOWING_ID
commit;

select * from user1;

--모든 댓글 삭제
delete from reply where id=#{};
update user1 set name='테스트이' where id = 'test2';
update user1 set name='테스트삼' where id = 'test3';
delete from follows where id='test1';
commit;
select * from user1;
select * from reply;
select * from follows;
select * from board1;
		select b.no, u.name, u.id, u.img, b.content, b.img1, b.hashtag, b.regdate,b.up, (select count(*) from reply where no = b.no) as reply_cnt
		from board1 b, follows f, user1 u 
		where b.id = u.id and f.following_id = u.id and b.prv<=1 and f.id=#{id} order by b.regdate desc;
        
        select DISTINCT b.no, u.name, b.id as id, u.img, b.content, b.img1, b.hashtag, b.regdate,b.up, (select count(*) from reply where no = b.no) as reply_cnt
		from board1 b, follows f, user1 u 
		where b.id=f.following_id and u.id=f.id and u.id=#{id} and b.prv<=1 order by b.regdate desc
        
        
        select u.name from follows f,user1 u where f.following_id = u.id and u.id='test3';
        
        select rno, no, id, comment1,(select img from user1 where reply.id=id) as img from reply where no=1 order by rno desc;
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

-- 더미데이터

-- user1에 whatsup, dubu, mori, tama 계정 4개 추가 / 프로필 사진 변경
INSERT INTO user1(ID,NAME,PW,EMAIL,IMG,TEL,REGDATE) VALUES('whatsup', '왓섭', '1234', 'whatsup@dang.com', '/whatsup/whatsup.png', '010-7979-0102', '2010-01-04');
INSERT INTO user1(ID,NAME,PW,EMAIL,IMG,TEL,REGDATE) VALUES('dubu', '두부', '1234', 'dubu@dang.com', '/dutamo/dubu.png', '010-7979-0505', '2013-05-05');
INSERT INTO user1(ID,NAME,PW,EMAIL,IMG,TEL,REGDATE) VALUES('tama', '타마', '1234', 'tama@meow.com', '/dutamo/tama.png', '010-7979-1026', '2022-10-26');
INSERT INTO user1(ID,NAME,PW,EMAIL,IMG,TEL,REGDATE) VALUES('mori', '모리', '1234', 'mori@meow.com', '/dutamo/mori.png', '010-7979-1226', '2022-12-26');
select * from user1;
COMMIT;

-- board1 더미데이터 (개행문자 ||CHAR(13)||CHAR(10)||)  delete from board1;
select * from board1;
delete from board1 where no<=22;

INSERT INTO board1 VALUES
(0, 'whatsup', '2010년 1월 4일에 태어난 우리 왓섭이'||CHR(13)||CHR(10)||'매우 귀여우니 심장 조심', 
'#2010년 #첫만남 #꼬물이', DEFAULT, DEFAULT, '/whatsup/00.jpg', '/whatsup/02.jpg', '/whatsup/01.jpg', DEFAULT);

INSERT INTO board1 VALUES
(1, 'whatsup', '1살쯤 됐나 이때부터 눈에 보이는 건 다 물고 다님'||CHR(13)||CHR(10)||'그러다 나까지 물어버림', 
'#1살 #말티즈', DEFAULT, DEFAULT, '/whatsup/03.jpg', '/whatsup/04.jpg', '/whatsup/05.jpg', DEFAULT);

INSERT INTO board1 VALUES
(2, 'whatsup', '미용 망해서 옷 사줌'||CHR(13)||CHR(10)||'기분이 몹시 언짢아보임', 
'#미용망함 #까까머리', DEFAULT, DEFAULT, '/whatsup/06.jpg', '/whatsup/07.jpg', '/whatsup/08.jpg', DEFAULT);

INSERT INTO board1 VALUES
(3, 'whatsup', '산책 나가면 신나서 막 날라댕김'||CHR(13)||CHR(10)||'날아라 말티쥬', 
'#점프 #댕신남 #메롱', DEFAULT, DEFAULT, '/whatsup/09.jpg', '/whatsup/10.jpg', '/whatsup/11.jpg', DEFAULT);

INSERT INTO board1 VALUES
(4, 'whatsup', '누나 몰래 음식 훔쳐먹다 걸린 썰 푼다'||CHR(13)||CHR(10)||'사실 먹기 전에 걸렸다', 
'#개도둑 #완전범죄실패 #범죄현장', DEFAULT, DEFAULT, '/whatsup/12.jpg', '/whatsup/13.jpg', '/whatsup/14.jpg', DEFAULT);

INSERT INTO board1 VALUES
(5, 'whatsup', '팬아트 선물받음'||CHR(13)||CHR(10)||'길쭉길쭉 모델견', 
'#롱다리 #닭발컷', DEFAULT, DEFAULT, '/whatsup/15.png', '/whatsup/16.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(6, 'whatsup', '증사 찍었다'||CHR(13)||CHR(10)||'긴장해서 실물보다 못 나온듯', 
'#증사 #증명사진 #실물파', DEFAULT, DEFAULT, '/whatsup/17.jpg', '/whatsup/18.jpg', '/whatsup/19.jpg', DEFAULT);

INSERT INTO board1 VALUES
(7, 'whatsup', '자는데 왜 깨워'||CHR(13)||CHR(10)||'졸리다고', 
'#개졸려 #하품 #고슴도치', DEFAULT, DEFAULT, '/whatsup/21.jpg', '/whatsup/22.jpg', '/whatsup/20.jpg', DEFAULT);

INSERT INTO board1 VALUES
(8, 'whatsup', '만사 귀찬타'||CHR(13)||CHR(10)||'암것도 하기 실타', 
'#고라파덕 #귀찮', DEFAULT, DEFAULT, '/whatsup/23.jpg', '/whatsup/24.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(9, 'whatsup', '조명 맛집에서 셀카'||CHR(13)||CHR(10)||'눈에 별 박았음', 
'#개미남 #렌즈', DEFAULT, DEFAULT, '/whatsup/25.jpg', '/whatsup/26.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(10, 'whatsup', '산책 인싸템 장만했다'||CHR(13)||CHR(10)||'밤산책 어서오고', 
'#꿀벌가방 #산책LED', DEFAULT, DEFAULT, '/whatsup/27.jpg', null, null, DEFAULT);

INSERT INTO board1 VALUES
(11, 'whatsup', '사진 찍지 말고 빨리 와라', 
'#눈으로 욕하기 #빨리빨리', DEFAULT, DEFAULT, '/whatsup/28.jpg', '/whatsup/29.jpg', '/whatsup/30.jpg', DEFAULT);

INSERT INTO board1 VALUES
(12, 'whatsup', '털찌는 과정',
'#살인미소 #메롱', DEFAULT, DEFAULT, '/whatsup/31.jpg', '/whatsup/32.jpg', '/whatsup/33.jpg', DEFAULT);

INSERT INTO board1 VALUES
(13, 'whatsup', '사진 찍지 말고 빨리 와라 2'||CHR(13)||CHR(10)||'겨울에도 이러네', 
'#겨울산책 #패딩', DEFAULT, DEFAULT, '/whatsup/34.jpg', '/whatsup/35.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(14, 'whatsup', '먹방 찍기 시작함'||CHR(13)||CHR(10)||'더 줘', 
'#황태츄 #개껌', DEFAULT, DEFAULT, '/whatsup/36.jpg', '/whatsup/37.jpg', '/whatsup/38.jpg', DEFAULT);

INSERT INTO board1 VALUES
(15, 'whatsup', '생일이라 놀러가서 사진 찍음', 
'#생파 #선글라스', DEFAULT, DEFAULT, '/whatsup/39.jpg', '/whatsup/40.jpg', '/whatsup/41.jpg', DEFAULT);

INSERT INTO board1 VALUES
(16, 'whatsup', '요즘 근황', 
'#키티 #닌텐도', DEFAULT, DEFAULT, '/whatsup/42.jpg', '/whatsup/43.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(17, 'mori', '어서와 박스냥은 처음이지', 
'#캣타워 #박스', DEFAULT, DEFAULT, '/dutamo/mori00.jpg', '/dutamo/mori01.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(18, 'mori', '오늘의 할 일'||CHR(13)||CHR(10)||'낮잠 자기', 
'#zzZ #낮잠', DEFAULT, DEFAULT, '/dutamo/mori04.jpg', null, null, DEFAULT);

INSERT INTO board1 VALUES
(19, 'dubu', '촉촉한 초코칩'||CHR(13)||CHR(10)||'까만콩 세 개', 
'#까만콩 #초코칩 #뷰러입술', DEFAULT, DEFAULT, '/dutamo/dubu01.jpg', '/dutamo/dubu02.jpg', '/dutamo/dubu00.jpg', DEFAULT);

INSERT INTO board1 VALUES
(20, 'tama', '머해'||CHR(13)||CHR(10)||'나랑 놀아', 
'#아이컨택 #장화신은 #고양이', DEFAULT, DEFAULT, '/dutamo/tama03.jpg', '/dutamo/tama05.jpg', '/dutamo/tama04.jpg', DEFAULT);

INSERT INTO board1 VALUES
(21, 'tama', '요즘은 냥북이 대세', 
'#냥북 #맥북 #노트북', DEFAULT, DEFAULT, '/dutamo/tama00.jpg', '/dutamo/tama02.jpg', '/dutamo/tama01.jpg', DEFAULT);

INSERT INTO board1 VALUES
(22, 'mori', '눕는게 제일 좋아', 
'#눕냥 #이불 #침대', DEFAULT, DEFAULT, '/dutamo/mori02.jpg', '/dutamo/mori03.jpg', '/dutamo/mori05.jpg', DEFAULT);

-- 팔로우 팔로잉 추가 delete from follows;
select * from follows;

INSERT INTO follows VALUES ('whatsup', 'dubu');
INSERT INTO follows VALUES ('whatsup', 'tama');
INSERT INTO follows VALUES ('whatsup', 'mori');

INSERT INTO follows VALUES ('dubu', 'whatsup');
INSERT INTO follows VALUES ('dubu', 'tama');
INSERT INTO follows VALUES ('dubu', 'mori');

INSERT INTO follows VALUES ('tama', 'dubu');
INSERT INTO follows VALUES ('tama', 'whatsup');
INSERT INTO follows VALUES ('tama', 'mori');

INSERT INTO follows VALUES ('mori', 'dubu');
INSERT INTO follows VALUES ('mori', 'whatsup');
INSERT INTO follows VALUES ('mori', 'tama');

COMMIT;

--------------------------------------------------------

--자기소개 테이블
--테이블생성
create table introduceMe1(id varchar2(30) primary key, content1 varchar2(120),foreign key(id) references user1(id) );
--자기소개테이블 더미값
insert into introduceMe1 values('tama','안녕하세요 아기고양이 타마입니다 😾');
--자기소개테이블 내용불러오기
select content1 from introduceMe1 where id='tama';


select * from introduceMe1;
commit;

desc reply;
