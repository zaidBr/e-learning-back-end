FROM tomsik68/xampp:8.1.2


WORKDIR /opt/lampp/htdocs


COPY . /opt/lampp/htdocs/

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.6.5

RUN composer install --no-interaction --no-plugins --no-scripts

EXPOSE 80
CMD ["/opt/lampp/xampp start"]
