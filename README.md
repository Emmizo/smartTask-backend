Step to install laravel environment 


Step 1: Install Laravel and Dependencies

1. Install PHP and Composer

Make sure you have PHP and Composer installed. You can check by running:
php -v
composer -V
If not installed, download from:
	•	PHP via https://www.php.net/manual/en/install.php
	•	Composer via https://getcomposer.org/

2. Install Laravel

If Laravel is not installed globally, run:
- composer global require laravel/installer

- Ensure ~/.composer/vendor/bin (Mac/Linux) or %USERPROFILE%\AppData\Roaming\Composer\vendor\bin (Windows) is in your system PATH.

3.   Navigate to your development directory:Clone the Projectfrom https://github.com/Emmizo/smartTask-backend.git

4. Navigate into the project folder:

create in root folder .env file then copy code from .env.example copy them to .env

5. run command composer install or composer update
6. create database "smarttask" and import database shared in root in folder called "DB"
7. import database base on your platform either you use mariadb with xampp or mysql with workbench

8. in project run "php artisan serve" to run project
9. then get api documentation in folder called "api-docs"
