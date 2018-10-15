create role admin;
grant role admin to GROUP ${SDX_ADMIN_GROUP};
grant all on server server1 to role admin;