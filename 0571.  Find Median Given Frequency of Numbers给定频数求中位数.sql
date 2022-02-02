SELECT ROUND(AVG(num),1) median FROM
(SELECT num, SUM(frequency)over(order by num) asc_accumu,
    SUM(frequency)over(order by num desc) desc_accumu
    FROM Numbers) t1,
(SELECT SUM(frequency) total FROM Numbers)t2
WHERE asc_accumu>=total/2 AND desc_accumu>=total/2
