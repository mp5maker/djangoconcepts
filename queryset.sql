1. all(): Get Raw Sql 
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


2. filter(pk=1) : Get Raw SQL 
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