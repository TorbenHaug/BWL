@echo off
echo ^| bundle exec rake db:migrate:reset
echo ^| ^=^> Clean database and run migrations
echo.
echo ^| rails s
echo ^| ^=^> Start rails server
