FROM php:7

#Installing npm, git, zip, unzip and openssl which are required to install Laravel.
RUN apt-get update -y && apt-get install -y openssl zip unzip git npm
#Installing Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app

#Clonning the Simple PHP application repo
RUN git clone https://github.com/Saritasa/simplephpapp.git .

#Installing composer dependencies
RUN composer install

#Adding .env from .env.example
RUN cp .env.example .env

#Generating application key
RUN php artisan key:generate

#Install static dependencies
RUN npm install

#Building static scripts by running
RUN npm run production

#Binding application to port 80
CMD php artisan serve --host=0.0.0.0 --port=80
EXPOSE 80
