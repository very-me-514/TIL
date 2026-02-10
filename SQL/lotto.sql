DROP TABLE lotto_draws;

CREATE TABLE lotto_draws (
    draw_round INT PRIMARY KEY,        -- 회차
    win_num_1 INT NOT NULL,
    win_num_2 INT NOT NULL,
    win_num_3 INT NOT NULL,
    win_num_4 INT NOT NULL,
    win_num_5 INT NOT NULL,
    win_num_6 INT NOT NULL,
    bonus_num INT NOT NULL,
    draw_date DATE NOT NULL,            -- 추첨일자 (YYYY-MM-DD)
    first_prize_winners INT NOT NULL,
    first_prize_amount BIGINT NOT NULL,
    second_prize_winners INT NOT NULL,
    second_prize_amount BIGINT NOT NULL
);

SELECT * FROM lotto_draws;
);
ALTER TABLE lotto ADD CONSTRAINT unique_lt_epsd UNIQUE (lt_epsd);

SELECT * FROM lotto_draws;

SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'lotto';


ltEpsd - 회차
tm??WnNo - 번호
bnsWnNo - 보너스
ltRflYmd - 추첨일자 (yyyymmdd -> yyyy-mm-dd 로 바꿔서 date 컬럼에 저장 필요)
rnk1WnNope - 1등 수
rnk1WnAmt - 1등 당첨금액
rnk2WnNope - 2등 수
rnk2WnAmt - 2등 당첨금액
...