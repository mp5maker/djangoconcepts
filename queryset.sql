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