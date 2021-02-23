
/* Drop Tables */

DROP TABLE SHOW_ACTORS CASCADE CONSTRAINTS;
DROP TABLE ACTORS CASCADE CONSTRAINTS;
DROP TABLE SHOW_EVENTS CASCADE CONSTRAINTS;
DROP TABLE SHOW_INTEREST_CARTS CASCADE CONSTRAINTS;
DROP TABLE SHOW_LIKE_USERS CASCADE CONSTRAINTS;
DROP TABLE SHOW_TICKET_ORDER_ITEMS CASCADE CONSTRAINTS;
DROP TABLE SHOW_SEAT CASCADE CONSTRAINTS;
DROP TABLE SHOW_TICKET_ORDERS CASCADE CONSTRAINTS;
DROP TABLE SHOW_PUT_SHOWS CASCADE CONSTRAINTS;
DROP TABLE SHOW_REVIEWS CASCADE CONSTRAINTS;
DROP TABLE SHOWS CASCADE CONSTRAINTS;
DROP TABLE SHOW_BANK_CARD_COMPANIES CASCADE CONSTRAINTS;
DROP TABLE SHOW_CATEGORIES CASCADE CONSTRAINTS;
DROP TABLE SHOW_COUPON_HISTORIES CASCADE CONSTRAINTS;
DROP TABLE SHOW_COUPONS CASCADE CONSTRAINTS;
DROP TABLE SHOW_NOTICES CASCADE CONSTRAINTS;
DROP TABLE SHOW_PLACE_SEAT CASCADE CONSTRAINTS;
DROP TABLE SHOW_PLACE CASCADE CONSTRAINTS;
DROP TABLE SHOW_PROMOTION_EVENT CASCADE CONSTRAINTS;
DROP TABLE SHOW_USER_POINT_HISTORIES CASCADE CONSTRAINTS;
DROP TABLE SHOW_USER_ROLES CASCADE CONSTRAINTS;
DROP TABLE SHOW_USERS CASCADE CONSTRAINTS;
DROP TABLE SHOW_VIEWING_GRADES CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE ACTORS
(
	ACTOR_NO number(5,0) NOT NULL,
	ACTOR_NAME varchar2(100) NOT NULL,
	PRIMARY KEY (ACTOR_NO)
);


CREATE TABLE SHOWS
(
	SHOW_NO number(10,0) NOT NULL,
	CATEGORY_NO number(2,0) NOT NULL,
	SHOW_NAME varchar2(100) NOT NULL,
	VIEWING_NO number(2,0) NOT NULL,
	RUNNING_TIME varchar2(20) NOT NULL,
	-- 메인 포스터 이미지 주소를 첨부할 것임.
	POSTER_IMG varchar2(100),
	BEGIN_DATE date,
	END_DATE date,
	PLACE_NO number(5,0) NOT NULL,
	ATTENTION_IMG varchar2(100),
	SALE_IMG varchar2(100),
	SHOW_DETAIL_IMG varchar2(100),
	SHOW_CREATED_DATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (SHOW_NO)
);


CREATE TABLE SHOW_ACTORS
(
	ACTOR_NO number(5,0) NOT NULL,
	PUT_SHOW_NO number(10,0) NOT NULL
);


CREATE TABLE SHOW_BANK_CARD_COMPANIES
(
	BANK_NO number(2,0) NOT NULL,
	BANK_NAME varchar2(30) NOT NULL,
	PRIMARY KEY (BANK_NO)
);


CREATE TABLE SHOW_CATEGORIES
(
	CATEGORY_NO number(2,0) NOT NULL,
	CATEGORY_NAME varchar2(30) NOT NULL,
	TOP_CATEGORY_NO number(2,0),
	PRIMARY KEY (CATEGORY_NO)
);


CREATE TABLE SHOW_COUPONS
(
	COUPON_NO number(10,0) NOT NULL,
	COUPON_NAME number(12,0) NOT NULL,
	COUPON_PRICE number(7,0) NOT NULL,
	COUPON_START_DATE date NOT NULL,
	-- 쿠폰 발급 7일 후 만료됨.
	COUPON_END_DATE date NOT NULL,
	-- DEFAULT는 'N'
	-- 쿠폰 기간이 만료되면 'Y'로 변경
	COUPON_STATUS char(1) DEFAULT 'N' NOT NULL,
	PRIMARY KEY (COUPON_NO)
);


-- 회원가입한 유저의 데이터에 발급 받은 쿠폰 정보를 미리 넣어놓을 것임. 
-- 로그인한 유저가 직접 클릭해서 쿠폰을 발급받는 기능은 현재는 배제.
CREATE TABLE SHOW_COUPON_HISTORIES
(
	COUPON_HISTORY_NO number(5,0) NOT NULL,
	COUPON_NO number(10,0) NOT NULL,
	-- 시퀀스로 증가시킨다.
	USER_NO number(10,0) NOT NULL,
	COUPON_NAME number(12,0) NOT NULL,
	COUPON_DISCOUNT_PRICE number(5,0) NOT NULL,
	-- DEFAULT는 'N'
	-- 쿠폰을 사용하면 'Y'로 변경
	COUPON_DISABLED char(1) DEFAULT 'N' NOT NULL,
	COUPON_USED_DATE date,
	PRIMARY KEY (COUPON_HISTORY_NO)
);


CREATE TABLE SHOW_EVENTS
(
	EVENT_NO number(10,0) NOT NULL,
	-- 초대이벤트의 경우 1을
	-- 경품이벤트의 경우 2를 부여한다.
	EVENT_TYPE number(1,0) NOT NULL,
	EVENT_NAME varchar2(100) NOT NULL,
	SHOW_NO number(10,0) NOT NULL,
	EVENT_START_DAY date NOT NULL,
	EVENT_END_DAY date NOT NULL,
	EVENT_IMG varchar2(100),
	PRIMARY KEY (EVENT_NO)
);


CREATE TABLE SHOW_INTEREST_CARTS
(
	-- 시퀀스로 증가시킬 것임.
	SHOW_CART_NO number(10,0) NOT NULL,
	-- 시퀀스로 증가시킨다.
	USER_NO number(10,0) NOT NULL,
	SHOW_NO number(10,0) NOT NULL,
	PRIMARY KEY (SHOW_CART_NO)
);


CREATE TABLE SHOW_LIKE_USERS
(
	-- 시퀀스로 증가시킨다.
	USER_NO number(10,0) NOT NULL,
	SHOW_NO number(10,0) NOT NULL
);


CREATE TABLE SHOW_NOTICES
(
	-- 시퀀스로 자동 증가시킨다.
	NOTICE_NO number(10,0) NOT NULL,
	-- 제약조건(SELECT)으로 '서비스점검', '티켓오픈', '변경/취소' 를 넣을 것임.
	NOTICE_TYPE varchar2(20) NOT NULL,
	NOTICE_TITLE varchar2(200) NOT NULL,
	NOTICE_CONTENT varchar2(3000) NOT NULL,
	-- DEFAULT로 SYSDATE
	NOTICE_CREATED_DATE date DEFAULT SYSDATE,
	PRIMARY KEY (NOTICE_NO)
);


CREATE TABLE SHOW_PLACE
(
	PLACE_NO number(5,0) NOT NULL,
	LOCAL_NAME varchar2(30) NOT NULL,
	PLACE_NAME varchar2(50) NOT NULL,
	PLACE_ADDRESS varchar2(200) NOT NULL,
	SEAT_CAPACITY number(5,0) NOT NULL,
	PRIMARY KEY (PLACE_NO)
);


CREATE TABLE SHOW_PLACE_SEAT
(
	PLACE_NO number(5,0) NOT NULL,
	SEAT_NO varchar2(20),
	SEAT_GRADE varchar2(20),
	SEAT_PRICE number(5,0)
);


CREATE TABLE SHOW_PROMOTION_EVENT
(
	EVENT_NO number(10,0) NOT NULL,
	EVENT_NAME varchar2(100) NOT NULL,
	EVENT_START_DAY date NOT NULL,
	EVENT_END_DAY date NOT NULL,
	EVENT_IMG varchar2(100),
	-- 이벤트 상세 이미지
	EVENT_DETAIL_IMG varchar2(100),
	PRIMARY KEY (EVENT_NO)
);


CREATE TABLE SHOW_PUT_SHOWS
(
	PUT_SHOW_NO number(10,0) NOT NULL,
	SHOW_NO number(10,0) NOT NULL,
	SHOW_DAY varchar2(30) NOT NULL,
	SHOW_START_TIME varchar2(30) NOT NULL,
	PRIMARY KEY (PUT_SHOW_NO)
);


CREATE TABLE SHOW_REVIEWS
(
	REVIEW_NO number(10,0) NOT NULL,
	SHOW_NO number(10,0) NOT NULL,
	-- 시퀀스로 증가시킨다.
	USER_NO number(10,0) NOT NULL,
	-- 5점 만점이다.
	REVIEW_RATING number(1,0) NOT NULL,
	REVIEW_CONTENT varchar2(300) NOT NULL,
	-- DEFAULT로 SYSDATE를 넣을 것임.
	REVIEW_CREATED_DATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (REVIEW_NO)
);


CREATE TABLE SHOW_SEAT
(
	SEAT_NO number(7,0) NOT NULL,
	-- 공연이 등록되고, 상연이 추가될 때마다
	-- 좌석정보를 처음부터 끝까지 추가한다.
	-- 
	SHOW_SEAT_NO varchar2(20),
	PUT_SHOW_NO number(10,0) NOT NULL,
	-- 비어있는 좌석은 'N'을 
	-- 예매된 좌석은 'Y'를 부여한다.
	-- DEFAULT로 'N'을 넣을 것임.
	TICKED char(1) DEFAULT 'N' NOT NULL,
	PRIMARY KEY (SEAT_NO)
);


CREATE TABLE SHOW_TICKET_ORDERS
(
	-- 시퀀스값을 가져온다.
	ORDER_NO number(10,0) NOT NULL,
	-- 시퀀스로 증가시킨다.
	USER_NO number(10,0) NOT NULL,
	PUT_SHOW_NO number(10,0) NOT NULL,
	-- 예매는 주문수량이 1로 고정이 아닌가? 
	-- 한 번에 1인 X매만 예매 가능하니까?
	ORDER_AMOUNT number(3,0) NOT NULL,
	-- 제약 조건으로 '결제전', '결제완료'
	ORDER_STATUS varchar2(30) NOT NULL,
	TOTAL_ORDER_PRICE number(7,0) NOT NULL,
	USED_POINT number(5,0),
	TOTAL_PAYMENT_PRICE number(7,0) NOT NULL,
	-- 제약조건으로 '무통장입금', '카드결제'
	ORDER_PAYMENT_METHOD varchar2(20) NOT NULL,
	BANK_NO number(2,0) NOT NULL,
	BANK_CARD_ACCOUNT number(14,0) NOT NULL,
	-- DEFAULT값으로 SYSDATE를 넣을 것임.
	ORDER_CREATED_DATE date DEFAULT SYSDATE,
	COUPON_HISTORY_NO number(5,0),
	PRIMARY KEY (ORDER_NO)
);


CREATE TABLE SHOW_TICKET_ORDER_ITEMS
(
	-- 시퀀스로 증가된다.
	ORDER_ITEM_NO number(10,0) NOT NULL,
	-- 시퀀스값을 가져온다.
	ORDER_NO number(10,0) NOT NULL,
	SEAT_NO number(7,0) NOT NULL,
	PRIMARY KEY (ORDER_ITEM_NO)
);


CREATE TABLE SHOW_USERS
(
	-- 시퀀스로 증가시킨다.
	USER_NO number(10,0) NOT NULL,
	USER_NAME varchar2(50) NOT NULL,
	USER_ID varchar2(50) NOT NULL UNIQUE,
	USER_PASSWORD varchar2(50) NOT NULL,
	USER_BIRTH date NOT NULL,
	USER_TEL varchar2(50) NOT NULL,
	USER_EMAIL varchar2(200) NOT NULL,
	USER_ADDRESS varchar2(500) NOT NULL,
	-- 제약 조건으로 'Y' 혹은 'N' 을 넣을 것임.
	EMAIL_RECEIVING_CONSENT char(1) NOT NULL,
	-- 제약조건으로 'Y' 혹은 'N'을 넣을 것임
	SMS_RECEIVING_CONSENT char(1) NOT NULL,
	-- DEFAULT로 1000을 넣을 것임.
	-- 회원가입시 1000포인트.
	USER_AVAILABLE_POINT number(10,0),
	-- DEFAULT로 SYSDATE를 넣을 것임.
	USER_CREATED_DATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (USER_NO)
);


CREATE TABLE SHOW_USER_POINT_HISTORIES
(
	-- 시퀀스로 증가시킨다.
	HISTORY_NO number(10,0) NOT NULL,
	-- 시퀀스로 증가시킨다.
	USER_NO number(10,0) NOT NULL,
	-- 한 번에 쓸 수 있는 포인트를 50000으로 제한할까?
	POINT_AMOUNT number(7,0) NOT NULL,
	POINT_CONTENT varchar2(200) NOT NULL,
	-- DEFAULT로 SYSDATE
	POINT_CREATED_DATE date,
	PRIMARY KEY (HISTORY_NO)
);


CREATE TABLE SHOW_USER_ROLES
(
	-- 시퀀스로 증가시킨다.
	USER_NO number(10,0) NOT NULL,
	-- 사용자의 경우 USER를 
	-- 관리자의 경우 ADMIN을 부여한다. 
	-- 사용자가 회원가입을 할 경우 DEFAULT로 USER를 부여함.
	USER_ROLE varchar2(30) DEFAULT 'USER' NOT NULL,
	-- 회원 가입, 계정 추가시 DEFAULT로 'Y'를 부여.
	-- 탈퇴 혹은 미사용시 'N'으로 변경.
	USER_ABLE_STATUS char(1) DEFAULT 'Y' NOT NULL,
	USER_WITHDRAWAL_DATE date
);


CREATE TABLE SHOW_VIEWING_GRADES
(
	VIEWING_NO number(2,0) NOT NULL,
	-- 나이 비교
	VIEWING_GRADE_SD number(2,0) NOT NULL,
	VIEWING_GRADE_NAME varchar2(50) NOT NULL,
	PRIMARY KEY (VIEWING_NO)
);



/* Create Foreign Keys */

ALTER TABLE SHOW_ACTORS
	ADD FOREIGN KEY (ACTOR_NO)
	REFERENCES ACTORS (ACTOR_NO)
;


ALTER TABLE SHOW_EVENTS
	ADD FOREIGN KEY (SHOW_NO)
	REFERENCES SHOWS (SHOW_NO)
;


ALTER TABLE SHOW_INTEREST_CARTS
	ADD FOREIGN KEY (SHOW_NO)
	REFERENCES SHOWS (SHOW_NO)
;


ALTER TABLE SHOW_LIKE_USERS
	ADD FOREIGN KEY (SHOW_NO)
	REFERENCES SHOWS (SHOW_NO)
;


ALTER TABLE SHOW_PUT_SHOWS
	ADD FOREIGN KEY (SHOW_NO)
	REFERENCES SHOWS (SHOW_NO)
;


ALTER TABLE SHOW_REVIEWS
	ADD FOREIGN KEY (SHOW_NO)
	REFERENCES SHOWS (SHOW_NO)
;


ALTER TABLE SHOW_TICKET_ORDERS
	ADD FOREIGN KEY (BANK_NO)
	REFERENCES SHOW_BANK_CARD_COMPANIES (BANK_NO)
;


ALTER TABLE SHOWS
	ADD FOREIGN KEY (CATEGORY_NO)
	REFERENCES SHOW_CATEGORIES (CATEGORY_NO)
;


ALTER TABLE SHOW_COUPON_HISTORIES
	ADD FOREIGN KEY (COUPON_NO)
	REFERENCES SHOW_COUPONS (COUPON_NO)
;


ALTER TABLE SHOW_TICKET_ORDERS
	ADD FOREIGN KEY (COUPON_HISTORY_NO)
	REFERENCES SHOW_COUPON_HISTORIES (COUPON_HISTORY_NO)
;


ALTER TABLE SHOWS
	ADD FOREIGN KEY (PLACE_NO)
	REFERENCES SHOW_PLACE (PLACE_NO)
;


ALTER TABLE SHOW_PLACE_SEAT
	ADD FOREIGN KEY (PLACE_NO)
	REFERENCES SHOW_PLACE (PLACE_NO)
;


ALTER TABLE SHOW_ACTORS
	ADD FOREIGN KEY (PUT_SHOW_NO)
	REFERENCES SHOW_PUT_SHOWS (PUT_SHOW_NO)
;


ALTER TABLE SHOW_SEAT
	ADD FOREIGN KEY (PUT_SHOW_NO)
	REFERENCES SHOW_PUT_SHOWS (PUT_SHOW_NO)
;


ALTER TABLE SHOW_TICKET_ORDERS
	ADD FOREIGN KEY (PUT_SHOW_NO)
	REFERENCES SHOW_PUT_SHOWS (PUT_SHOW_NO)
;


ALTER TABLE SHOW_TICKET_ORDER_ITEMS
	ADD FOREIGN KEY (SEAT_NO)
	REFERENCES SHOW_SEAT (SEAT_NO)
;


ALTER TABLE SHOW_TICKET_ORDER_ITEMS
	ADD FOREIGN KEY (ORDER_NO)
	REFERENCES SHOW_TICKET_ORDERS (ORDER_NO)
;


ALTER TABLE SHOW_COUPON_HISTORIES
	ADD FOREIGN KEY (USER_NO)
	REFERENCES SHOW_USERS (USER_NO)
;


ALTER TABLE SHOW_INTEREST_CARTS
	ADD FOREIGN KEY (USER_NO)
	REFERENCES SHOW_USERS (USER_NO)
;


ALTER TABLE SHOW_LIKE_USERS
	ADD FOREIGN KEY (USER_NO)
	REFERENCES SHOW_USERS (USER_NO)
;


ALTER TABLE SHOW_REVIEWS
	ADD FOREIGN KEY (USER_NO)
	REFERENCES SHOW_USERS (USER_NO)
;


ALTER TABLE SHOW_TICKET_ORDERS
	ADD FOREIGN KEY (USER_NO)
	REFERENCES SHOW_USERS (USER_NO)
;


ALTER TABLE SHOW_USER_POINT_HISTORIES
	ADD FOREIGN KEY (USER_NO)
	REFERENCES SHOW_USERS (USER_NO)
;


ALTER TABLE SHOW_USER_ROLES
	ADD FOREIGN KEY (USER_NO)
	REFERENCES SHOW_USERS (USER_NO)
;


ALTER TABLE SHOWS
	ADD FOREIGN KEY (VIEWING_NO)
	REFERENCES SHOW_VIEWING_GRADES (VIEWING_NO)
;



/* Comments */

COMMENT ON COLUMN SHOWS.POSTER_IMG IS '메인 포스터 이미지 주소를 첨부할 것임.';
COMMENT ON COLUMN SHOW_COUPONS.COUPON_END_DATE IS '쿠폰 발급 7일 후 만료됨.';
COMMENT ON COLUMN SHOW_COUPONS.COUPON_STATUS IS 'DEFAULT는 ''N''
쿠폰 기간이 만료되면 ''Y''로 변경';
COMMENT ON TABLE SHOW_COUPON_HISTORIES IS '회원가입한 유저의 데이터에 발급 받은 쿠폰 정보를 미리 넣어놓을 것임. 
로그인한 유저가 직접 클릭해서 쿠폰을 발급받는 기능은 현재는 배제.';
COMMENT ON COLUMN SHOW_COUPON_HISTORIES.USER_NO IS '시퀀스로 증가시킨다.';
COMMENT ON COLUMN SHOW_COUPON_HISTORIES.COUPON_DISABLED IS 'DEFAULT는 ''N''
쿠폰을 사용하면 ''Y''로 변경';
COMMENT ON COLUMN SHOW_EVENTS.EVENT_TYPE IS '초대이벤트의 경우 1을
경품이벤트의 경우 2를 부여한다.';
COMMENT ON COLUMN SHOW_INTEREST_CARTS.SHOW_CART_NO IS '시퀀스로 증가시킬 것임.';
COMMENT ON COLUMN SHOW_INTEREST_CARTS.USER_NO IS '시퀀스로 증가시킨다.';
COMMENT ON COLUMN SHOW_LIKE_USERS.USER_NO IS '시퀀스로 증가시킨다.';
COMMENT ON COLUMN SHOW_NOTICES.NOTICE_NO IS '시퀀스로 자동 증가시킨다.';
COMMENT ON COLUMN SHOW_NOTICES.NOTICE_TYPE IS '제약조건(SELECT)으로 ''서비스점검'', ''티켓오픈'', ''변경/취소'' 를 넣을 것임.';
COMMENT ON COLUMN SHOW_NOTICES.NOTICE_CREATED_DATE IS 'DEFAULT로 SYSDATE';
COMMENT ON COLUMN SHOW_PROMOTION_EVENT.EVENT_DETAIL_IMG IS '이벤트 상세 이미지';
COMMENT ON COLUMN SHOW_REVIEWS.USER_NO IS '시퀀스로 증가시킨다.';
COMMENT ON COLUMN SHOW_REVIEWS.REVIEW_RATING IS '5점 만점이다.';
COMMENT ON COLUMN SHOW_REVIEWS.REVIEW_CREATED_DATE IS 'DEFAULT로 SYSDATE를 넣을 것임.';
COMMENT ON COLUMN SHOW_SEAT.SHOW_SEAT_NO IS '공연이 등록되고, 상연이 추가될 때마다
좌석정보를 처음부터 끝까지 추가한다.
';
COMMENT ON COLUMN SHOW_SEAT.TICKED IS '비어있는 좌석은 ''N''을 
예매된 좌석은 ''Y''를 부여한다.
DEFAULT로 ''N''을 넣을 것임.';
COMMENT ON COLUMN SHOW_TICKET_ORDERS.ORDER_NO IS '시퀀스값을 가져온다.';
COMMENT ON COLUMN SHOW_TICKET_ORDERS.USER_NO IS '시퀀스로 증가시킨다.';
COMMENT ON COLUMN SHOW_TICKET_ORDERS.ORDER_AMOUNT IS '예매는 주문수량이 1로 고정이 아닌가? 
한 번에 1인 X매만 예매 가능하니까?';
COMMENT ON COLUMN SHOW_TICKET_ORDERS.ORDER_STATUS IS '제약 조건으로 ''결제전'', ''결제완료''';
COMMENT ON COLUMN SHOW_TICKET_ORDERS.ORDER_PAYMENT_METHOD IS '제약조건으로 ''무통장입금'', ''카드결제''';
COMMENT ON COLUMN SHOW_TICKET_ORDERS.ORDER_CREATED_DATE IS 'DEFAULT값으로 SYSDATE를 넣을 것임.';
COMMENT ON COLUMN SHOW_TICKET_ORDER_ITEMS.ORDER_ITEM_NO IS '시퀀스로 증가된다.';
COMMENT ON COLUMN SHOW_TICKET_ORDER_ITEMS.ORDER_NO IS '시퀀스값을 가져온다.';
COMMENT ON COLUMN SHOW_USERS.USER_NO IS '시퀀스로 증가시킨다.';
COMMENT ON COLUMN SHOW_USERS.EMAIL_RECEIVING_CONSENT IS '제약 조건으로 ''Y'' 혹은 ''N'' 을 넣을 것임.';
COMMENT ON COLUMN SHOW_USERS.SMS_RECEIVING_CONSENT IS '제약조건으로 ''Y'' 혹은 ''N''을 넣을 것임';
COMMENT ON COLUMN SHOW_USERS.USER_AVAILABLE_POINT IS 'DEFAULT로 1000을 넣을 것임.
회원가입시 1000포인트.';
COMMENT ON COLUMN SHOW_USERS.USER_CREATED_DATE IS 'DEFAULT로 SYSDATE를 넣을 것임.';
COMMENT ON COLUMN SHOW_USER_POINT_HISTORIES.HISTORY_NO IS '시퀀스로 증가시킨다.';
COMMENT ON COLUMN SHOW_USER_POINT_HISTORIES.USER_NO IS '시퀀스로 증가시킨다.';
COMMENT ON COLUMN SHOW_USER_POINT_HISTORIES.POINT_AMOUNT IS '한 번에 쓸 수 있는 포인트를 50000으로 제한할까?';
COMMENT ON COLUMN SHOW_USER_POINT_HISTORIES.POINT_CREATED_DATE IS 'DEFAULT로 SYSDATE';
COMMENT ON COLUMN SHOW_USER_ROLES.USER_NO IS '시퀀스로 증가시킨다.';
COMMENT ON COLUMN SHOW_USER_ROLES.USER_ROLE IS '사용자의 경우 USER를 
관리자의 경우 ADMIN을 부여한다. 
사용자가 회원가입을 할 경우 DEFAULT로 USER를 부여함.';
COMMENT ON COLUMN SHOW_USER_ROLES.USER_ABLE_STATUS IS '회원 가입, 계정 추가시 DEFAULT로 ''Y''를 부여.
탈퇴 혹은 미사용시 ''N''으로 변경.';
COMMENT ON COLUMN SHOW_VIEWING_GRADES.VIEWING_GRADE_SD IS '나이 비교';



