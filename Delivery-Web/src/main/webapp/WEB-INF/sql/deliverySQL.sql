create table tbl_user(
    user_no	    number primary key, 
-- 가입 시 작성하는 부분 --
    user_id	    varchar2(20)    not null, 
    user_pw	    varchar2(20)    not null, 
    user_name	varchar2(30)    not null, 
    user_phone	varchar2(13)    not null, 
    user_email	varchar2(50)    not null, 
    user_addr	varchar2(300)   not null, 
    user_img    varchar2(600)   not null, 
    user_birth  date 		    not null,
-- 기본적으로 설정되는 부분 --
    user_date	timestamp       default sysdate,
    user_state	varchar2(1)     default 'X',
    user_point	number          default 0, 
    user_rank	varchar2(10)    default 'bronze'
);

create table tbl_deliver(
    dlvr_no	    number          primary key,
-- 가입 시 작성하는 부분 --
    dlvr_id	    varchar2(20)    not null, 
    dlvr_pw	    varchar2(20)    not null, 
    dlvr_name	varchar2(30)    not null, 
    dlvr_phone	varchar2(13)    not null, 
    dlvr_email	varchar2(50)    not null, 
    dlvr_addr	varchar2(300)   not null,  
    dlvr_img    varchar2(600)   not null,  
    dlvr_idCard	varchar2(600)   not null, 
    dlvr_birth	date    		not null,
-- 기본적으로 설정되는 부분 --
    dlvr_date	timestamp       default sysdate, 
    dlvr_state	varchar2(1)     default 'X', 
    dlvr_point	number          default 0, 
    dlvr_rank	varchar2(10)    default 'bronze'
);

create table tbl_admin(
    admin_no	number          primary key, 
-- 가입 시 작성하는 부분 --
    admin_id	varchar2(20)    not null, 
    admin_pw	varchar2(20)    not null, 
    admin_name	varchar2(30)    not null, 
    admin_phone	varchar2(13)    not null, 
    admin_email	varchar2(50)    not null, 
-- 기본적으로 설정되는 부분 -- 
    admin_date	timestamp       default sysdate, 
    admin_state	varchar2(1)     default 'X'
);

create table tbl_code(
    code_no varchar2(10)        primary key,
    code_detail varchar2(30)    not null
);

create table tbl_order(
    order_no    number          primary key, 
-- 주문 시 작성하는 부분 -- 
    order_ca	varchar2(10)    REFERENCES tbl_code(code_no), 
    order_req	varchar2(100)   not null, 
    order_lat	number, 
    order_lng	number, 
    user_id	    number          REFERENCES tbl_user(user_no), 
    order_state	varchar2(10)    REFERENCES tbl_code(code_no), 
-- 배달원이 주문을 받으면 작성되는 부분 -- 
    dlvr_id	    number          REFERENCES tbl_deliver(dlvr_no),
-- 기본적으로 설정되는 부분 -- 
    order_date	timestamp       default sysdate
);

create table tbl_user_point(
    uPoint_no	number          primary key, 
    point_code	varchar2(10)    REFERENCES tbl_code(code_no), 
    user_no	    number          REFERENCES tbl_user(user_no), 
    uPoint_dp	number, 
    uPoint_wd	number, 
    uPoint_date	timestamp       default sysdate
);

create table tbl_deliver_point(
    dPoint_no	number          primary key, 
    point_code	varchar2(10)    REFERENCES tbl_code(code_no), 
    dlvr_no	    number          REFERENCES tbl_deliver(dlvr_no), 
    dPoint_dp	number, 
    dPoint_wd	number, 
    dPoint_date	timestamp       default sysdate
);

create table tbl_report(
    report_no	    number          primary key, 
    user_no	        number          REFERENCES tbl_user(user_no), 
    dlvr_no	        number          REFERENCES tbl_deliver(dlvr_no), 
    report_content	varchar2(300)   not null, 
    report_img      varchar2(600)   not null, 
    report_state	varchar2(10)    REFERENCES tbl_code(code_no), 
    report_type	    varchar2(4)     not null, 
    report_date	    timestamp       default sysdate
);

create table tbl_timeline(
    time_no         number          primary key,
    writer_no       number, 
    writer_state    varchar2(10)    REFERENCES  tbl_code(code_no), 
    time_content    varchar2(600), 
    time_img        varchar2(600), 
    time_date       timestamp       default sysdate, 
    time_state      varchar2(10)    REFERENCES  tbl_code(code_no), 
    time_star       number          default 2.5, 
    dlvr_no         number          REFERENCES  tbl_deliver(dlvr_no)
);

-- 1:1 문의
create table tbl_question(
q_no number primary key,
q_category varchar2(20) REFERENCES tbl_code(code_no) not null,
q_order_no number REFERENCES tbl_order(order_no),
q_phone varchar2(13) not null,
q_email varchar2(50) not null,
q_title varchar2(300) not null,
q_content varchar2(3000) not null,
q_writer varchar2(20) not null,
q_img varchar2(600),
q_date TIMESTAMP(6) DEFAULT sysdate not null
);

drop table tbl_user;

create SEQUENCE seq_account_no;

create sequence seq_c_no;

create sequence seq_timeline_no;

create sequence seq_report_no;

create sequence seq_order_no;

create sequence seq_point_no;