-- user1에 whatsup, dubu, mori, tama 계정 4개 추가 / 프로필 사진 변경
INSERT INTO user1 VALUES('whatsup', '왓섭', '1234', 'whatsup@dang.com', '/whatsup/whatsup.png', '010-7979-0102', '2010-01-04');
INSERT INTO user1 VALUES('dubu', '두부', '1234', 'dubu@dang.com', '/dutamo/dubu.png', '010-7979-0505', '2013-05-05');
INSERT INTO user1 VALUES('tama', '타마', '1234', 'tama@meow.com', '/dutamo/tama.png', '010-7979-1026', '2022-10-26');
INSERT INTO user1 VALUES('mori', '모리', '1234', 'mori@meow.com', '/dutamo/mori.png', '010-7979-1226', '2022-12-26');
select * from user1;

-- board1 더미데이터 (개행문자 ||CHAR(13)||CHAR(10)||)  delete from board1;
select * from board1 order by no;

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