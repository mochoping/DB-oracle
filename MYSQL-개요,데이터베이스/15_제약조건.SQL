/*
제약조건(CONSTRAINTS)

    사용자가 원하는 조건의 데이터만 유지하기 위해 특정 컬럼에 설정하는 제약
    데이터 무결성 보장을 목적으로 함.

    * 무결성 없을 무, 모자랄 결, 성질 성
        無缺性
        무결성이란 완벽한 성질, 데이터가 손상되지 않고, 완전, 정확, 한결같아야함

    + 입력 데이터에 문제가 없는지 자동으로 검사하는 목적
    + 데이터 수정/삭제 가능여부 검사등을 목적으로 함
        --> 제약조건을 위배하는 DML 구문은 수행할 수 없음

    제약조건 종류
    PRIMARY KEY, NOT NULL, UNIQUE, CHECK, FOREIGN KEY

    제약조건 확인하는 방법
    MYSQL
    테이블 제약조건 확인
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    SELECT*
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE TABLE_NAME = '테이블명'
    AND TABLE_SCHEMA =' 데이터베이스명';


    INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    SELECT*
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE TABLE_NAME = '테이블명'
    AND TABLE_SCHEMA =' 데이터베이스명';

    ORACLE
    USER_CONSTRAINTS : 사용자가 작성한 제약조건을 확인하는 딕셔너리 뷰


*/
/*
 PRIMARY KEY (기본 키)
    - 각 행을 고유하게 식별하는 컬럼 또는 컬럼 조합
    - 테이블당 하나의 PRIMARY KEY만 설정
    - 기본 키로 설정된 컬럼은 자동으로 UNIQUE 와 NOT NULL 제약 조건을 가짐

    [작성법]
    CREATE TABLE 테이블명(
    테이블_ID INT AUTO_INCREMENT PRIMARY KEY,
    유저명 VARCHAR(50)
    )


NOT NULL 

    - 특정 컬럼이 NULL(빈) 값을 가질 수 없도록 제한

    - 데이터 입력시 반드시 값을 제공해야함
    - 기본값DEFAULT VALUE)을 설정해서 NULL(빈) 값 방지 가능

    [작성법]
    CREATE TABLE 테이블명(
     테이블_ID INT AUTO_INCREMENT PRIMARY KEY,
    유저명 VARCHAR(50) NOT NULL,
    가입일자 DATETIME NOT NULL DEFAULT CURRENT_DATE <- 자동기록

    -- DATE 자료형은 current_timestamp 사용 불가
    -- DATE 자료형은 연-월-일 만 저장이되고, DATETIME 연-월-일 시:분:초 저장이 되므로 DATETIME
    
    )

UNIQUE
    - 컬럼의 값이 고유해야함을 보잔
    - 테이블 내에서 중복된 값을 허용하지 않음
    - UNIQUE 제약 조건은 1회의 NULL 허용
    - 한 테이블에 여러 UNIQUE 컬럼 값을 가질 수 있음


    [작성법]
    CREATE TABLE 테이블명(
    테이블_ID     INT            AUTO_INCREMENT PRIMARY KEY,
    이메일        VARCHAR(100)   UNIQUE,
    주민번호      VARCHAR(100)   UNIQUE,
    휴대폰번호    VARCHAR(100)   UNIQUE
    )

CHECK 
    - 특정 컬럼 값이 지정된 조건을 만족해야함을 보장
    - MYSQL 8.0 이상에서 지원

    - 데이터 삽입 또는 업데이트시 조건 검증
    - 비만족시 저장되지 않음

    [작성법]
    CREATE TABLE 테이블명(
    테이블_ID     INT            AUTO_INCREMENT PRIMARY KEY,
    가격          DECIMAL(10,2)  CHECK (가격>0)
    )

FOREIGN KEY
    - 한 테이블의 컬럼이 다른 테이블의 PRIMARY KEY 나 UNIQUE 컬럼을 참조하도록 설정
    - 데이터베이스 내에서 테이블 간의 관계를 정의하는데 사용

    - 참조 무결성 유지
    - 부모 테이블의 데이터 변경시 행동(삭제/업데이트) 제어할 수 있음

    ON DELETE 와 ON UPDATE 동작
    CASCADE: 참조하는 데이터 변경시 참조된 데이터도 변경
    SET NULL : 참조된 데이터를 NULL로 설정
    RESTRICT : 변경을 제한

    [작성법]
    CREATE TABLE customers(
    customer_id  INT            AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(100)
    )

    CREATE TABLE orders(
    order_id     INT            AUTO_INCREMENT PRIMARY KEY,
    customer_id  INT
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
    FOREIGN KEY : 다른 테이블에 작성된 아이디를 현재 테이블에 위치한 특정 컬럼 ID 값에서
    REFERENCES : 참조할 것이다.
    다른테이블 이름( 다른테이블에 작성된 ID 값 )
    ON DELETE CASCADE : 만약에 다른 테이블에서 참조하는 ID 에서 DELETE 가 발생하면 현재 나의 테이블에서 삭제된 ID와
    일치하는 모든 컬럼 삭제


    
    )




    CREATE TABLE 이츠(
    이츠회원번호
    카테고리이름
        가게번호

)

CREATE TABLE 이츠가게들(
    가게번호
    가게이름
    가게주소
)
CREATE TABLE 메뉴들 (
    메뉴번호
    가게번호
    메뉴이름
    메뉴가격

)
*/
