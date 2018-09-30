1. all()
SELECT
   "auth_user"."id",
   "auth_user"."password",
   "auth_user"."last_login",
   "auth_user"."is_superuser",
   "auth_user"."username",
   "auth_user"."first_name",
   "auth_user"."last_name",
   "auth_user"."email",
   "auth_user"."is_staff",
   "auth_user"."is_active",
   "auth_user"."date_joined" 
FROM
   "auth_user"


2. filter(pk=1) 
SELECT
   "auth_user"."id",
   "auth_user"."password",
   "auth_user"."last_login",
   "auth_user"."is_superuser",
   "auth_user"."username",
   "auth_user"."first_name",
   "auth_user"."last_name",
   "auth_user". "email",
   "auth_user"."is_staff",
   "auth_user"."is_active",
   "auth_user"."date_joined" 
FROM
   "auth_user" 
WHERE
   "auth_user"."id" = 1


3.  filter(first_name="S") | filter(last_name="K")
    Alternatively,
    filter(Q(first_name="S") | Q(last_name="K"))
SELECT
   "serializer_employee"."id",
   "serializer_employee"."first_name",
   "serializer_employee"."last_name",
   "serializer_employee"."age",
   "serializer_employee"."salary" 
FROM
   "serializer_employee" 
WHERE
   (
      "serializer_employee"."first_name" = S 
      OR "serializer_employee"."last_name" = K
   )

4.  filter(Q(first_name__startswith="S") | Q(last_name__startswith="K"))
SELECT
   "serializer_employee"."id",
   "serializer_employee"."first_name",
   "serializer_employee"."last_name",
   "serializer_employee"."age",
   "serializer_employee"."salary" 
FROM
   "serializer_employee" 
WHERE
   (
      "serializer_employee"."first_name" LIKE S% ESCAPE \'\\\' 
      OR "serializer_employee"."last_name" LIKE K% ESCAPE \'\\\'
   )

5. filter(first_name="Photon", last_name="Khan")
   Alternatively,
   filter1 & filter2
   Alternatively,
   filter(Q(first_name="Photon") & Q(last_name="Khan"))
SELECT
   "serializer_employee"."id",
   "serializer_employee"."first_name",
   "serializer_employee"."last_name",
   "serializer_employee"."age",
   "serializer_employee"."salary" 
FROM
   "serializer_employee" 
WHERE
   (
      "serializer_employee"."first_name" = Photon 
      AND "serializer_employee"."last_name" = Khan
   )

6. exclude(age__gt=30)
   Alternatively,
   filter(~Q(age__gt=30))
SELECT
   "serializer_employee"."id",
   "serializer_employee"."first_name",
   "serializer_employee"."last_name",
   "serializer_employee"."age",
   "serializer_employee"."salary" 
FROM
   "serializer_employee" 
WHERE
   NOT ("serializer_employee"."age" > 30)

7. filter1.union(filter2)
SELECT
   "serializer_employee"."id",
   "serializer_employee"."first_name",
   "serializer_employee"."last_name",
   "serializer_employee"."age",
   "serializer_employee"."salary" 
FROM
   "serializer_employe e" 
WHERE
   "serializer_employee"."salary" > 50000.0 
UNION
SELECT
   "serializer_employee"."id",
   "serializer_employee"."first_name",
   "serializer_employee"."last_name",
   "serializer_employee"."age",
   "serializer_employee"."salary" 
FROM
   "serializer_employee" 
WHERE
   "serializer_employee"."salary" < 20000.0

8. filter(first_name__startswith="S").values('first_name', 'last_name')
SELECT
   "serializer_employee"."first_name",
   "serializer_employee"."last_name" 
FROM
   "serializer_employee" 
WHERE
   "serializer_employee"."first_name" LIKE S% ESCAPE \'\\\'
   
   Alternatively,
   filter(first_name__startswith="S").only('first_name', 'last_name')
SELECT
   "serializer_employee"."id",
   "serializer_employee"."first_name",
   "serializer_employee"."last_name" 
FROM
   "serializer_employee" 
WHERE
   "serializer_employee"."first_name" LIKE S% 

9. Subquery
SELECT
   "serializer_category"."id",
   "serializer_category"."name",
   (
      SELECT
         U0."name" 
      FROM
         "serializer_hero" U0 
      WHERE
         U0."category_id" = 
         (
            "serializer_category"."id"
         )
      ORDER BY
         U0."benevolence_factor" DESC LIMIT 1
   )
   AS "most_benevolent_hero" 
FROM
   "serializer_category"

10. filter(last_name=F("first_name"))
SELECT
   "serializer_employee"."id",
   "serializer_employee"."first_name",
   "serializer_employee"."last_name",
   "serializer_employee"."age",
   "serializer_employee"."salary" 
FROM
   "serializer_employee" 
WHERE
   "serializer_employee"."last_name" = 
   (
      "serializer_employee"."first_name"
   )

11. Substr("first_name", 1, 1)
SELECT
   "serializer_employee"."id",
   "serializer_employee"."first_name",
   "serializer_employee"."last_name",
   "serializer_employee"."age",
   "serializer_employee"."salary",
   SUBSTR("serializer_employee"."last_name", 1, 1) AS "last",
   SUBSTR("serializer_employee"."first_name", 1, 1) AS "first" 
FROM
   "serializer_employee" 
WHERE
   SUBSTR("serializer_employee"."first_name", 1, 1) = 
   (
      SUBSTR("se rializer_employee"."last_name", 1, 1)
   )

12. Q(file='')|Q(file=None)
SQL SKIPPED

13. first() [This wont show any sql]
SQL SKIPPED

14. last(args) [This wont show any sql]
SQL SKIPPED

15. order_by(args) [This wont show any sql]
SQL SKIPPED

16. Alternative to first() using all()[1:2]*
SELECT
   "serializer_employee"."id",
   "serializer_employee"."first_name",
   "serializer_employee"."last_name",
   "serializer_employee"."age",
   "serializer_employee"."salary" 
FROM
   "serializer_employe e" LIMIT 1 OFFSET 1

17. Alternative to nth-order() using all()[3:4]*
SELECT
   "serializer_employee"."id",
   "serializer_employee"."first_name",
   "serializer_employee"."last_name",
   "serializer_employee"."age",
   "serializer_employee"."salary" 
FROM
   "serializer_employe e" LIMIT 1 OFFSET 3

18. Row having duplicate field values [first_name matches another person]
>> Finding Number of duplicates with name
SELECT
   "serializer_employee"."first_name",
   COUNT("serializer_employee"."first_name") AS "name_count" 
FROM
   "serializer_employee" 
GROUP BY
   "serializer_employee"."first_name" 
HAVING
   COUNT("serializer_employee"."first_name") > 1

>> Finding the duplicate objects
SELECT
   "serializer_employee"."id",
   "serializer_employee"."first_name",
   "serializer_employee"."last_name",
   "serializer_employee"."age",
   "serializer_employee"."salary" 
FROM
   "serializer_employee" 
WHERE
   "serializer_employee"."first_name" IN 
   (
      Shahriar
   )

19. Distinct VALUES
SELECT
   "serializer_employee"."first_name",
   COUNT("serializer_employee"."first_name") AS "name_count" 
FROM
   "serializer_employee" 
GROUP BY
   "serializer_employee"."first_name" 
HAVING
   COUNT("seri alizer_employee"."first_name") = 1

SELECT
   "serializer_employee"."id",
   "serializer_employee"."first_name",
   "serializer_employee"."last_name",
   "serializer_employee"."age",
   "serializer_employee"."salary" 
FROM
   "serializer_employe e" 
WHERE
   "serializer_employee"."first_name" IN 
   (
      Samith,
      Photon,
      Amanur,
      Erfan
   )

20. Group Records [This wont show any sql]
SQL SKIPPED

21. Bulk Create
SQL SKIPPED

22. Save()
SQL SKIPPED

23. order_by('-age', '-salary')
SELECT
   "serializer_employee"."id",
   "serializer_employee"."first_name",
   "serializer_employee"."last_name",
   "serializer_employee"."age",
   "serializer_employee"."salary" 
FROM
   "serializer_employee" 
ORDER BY
   "serializer_employee"."age" ASC,
   "serializer_employee"."salary" DESC

23. __ Double Underscore Inner date_join
SELECT
   "serializer_hero"."id",
   "serializer_hero"."name",
   "serializer_hero"."category_id",
   "serializer_hero"."benevolence_factor" 
FROM
   "serializer_hero" 
   INNER JOIN
      "serializer_category" 
      ON ("serializer_hero"."category_id" = "serializer_category"."id") 
ORDER BY
   "serializer_category"."name" ASC,
   "serializer_hero"."name" ASC