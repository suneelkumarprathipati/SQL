with cte1 as 
(
    select distinct a.account_id as account_id from accounts as a where a.income < 20000
),
cte2 as 
(
    select distinct a.account_id as account_id from accounts as a where a.income >= 20000 and a.income <= 50000
),
cte3 as 
(
    select distinct a.account_id as account_id from accounts as a where a.income > 50000
)

select "Low Salary" as category, count(distinct cte1.account_id) as accounts_count from cte1
union
select "Average Salary" as category, count(distinct cte2.account_id) as accounts_count from cte2
union
select "High Salary" as category, count(distinct cte3.account_id) as accounts_count from cte3
