/* 
TCL ( TRANSACTION CONTROL LANGUAGE ) : 트랜잭션 제어 언어

TRANSACTION : 업무, 처리

-- 데이터 변경 사항을 묶어 하난의 트랜잭션에 담아 처리함.
(데이처 변경 사항을 묶어 하나의 업무로 담아 처리함)

-- 트랜잭션(업무,처리)의 대상이 되는 데이터 변경사항 : DML(INSERT, UPDATE, DELETE)


EX)
    INSERT 작업 완료! ----------------------------------------> DB 저장 (X)
    INSERT 작업 완료! -----> 트랜잭션에 추가 -----> COMMIT ----> DB 저장(O)
    INSERT 10개 완료! -----> 1개 업무처리공간에 10개의 INSERT 가 담겨있음 ----> ROLLBACK --> 모든작업 없던일로 처리


COMMIT : 메모리 버퍼(트랜젝션)에 임시 저장된 데이터 변경 사항을 DB 에 반영

ROLLBACK : 최정저장 취소
            메모리 버퍼(트랜잭션)에 저장된 데이터 변경사항을 삭제하고, 마지막 커밋상태로 돌아감

SAVEPOINT : 임시저장
            메모리 버퍼(트랜잭션)에 저장 지점을 설정해서 ROLLBACK 수행시 전체 작업을 삭제하는것. 저장지점까지만 일부 ROLLBACK

            [SAVEPOINT 사용법]
            SAVEPOINT 임시저장이름1 :

            ROLLBACK TO 임시저장이름1 : 

            이름작성시 큰따옴표호 감싸줌
            


            /*

            트랜잭션
            Atomicity(원자성) : 트랜잭션에 포함된 작업이 모두 성공하거나 실패해야함. 중간에 일부만 실행되어서는 안됨
                             ex) 은행 계좌 송금시 돈이 빠져나간작업과 입금작업이 둘다 수행되어야함

            Consistency(일관성) :트랜잭션이 실행되기 전과 후의 데이터 상태가 일관적이어야 함.
            Isolation(격리성) : 여러 트랜잭션이 동시 실행될 때, 서로의 작업에 영향을 주면 안됨.
            Durability(지속성) : 트랜잭션이 완료된 후 결과는 영구적으로 저장
            