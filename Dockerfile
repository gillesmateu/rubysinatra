FROM ruby:2

MAINTAINER Gilles MATEU <gilles@mateu.org>

ENV RUBYSINATRA_HOME=/usr/local/rubysinatra/

RUN mkdir -p /usr/local/rubysinatra/{thin,app}

COPY app/app.rb /usr/local/rubysinatra/app/
COPY app/Gemfile /usr/local/rubysinatra/app/
COPY app/config.ru /usr/local/rubysinatra/app/
COPY thin/config.yml /usr/local/rubysinatra/thin/config.yml
COPY entrypoint.bash /

RUN chown -R www-data:www-data /usr/local/rubysinatra/ \
  && cp -a ${RUBYSINATRA_HOME} /root/app

EXPOSE 3000

VOLUME /usr/local/rubysinatra

WORKDIR /usr/local/rubysinatra
CMD /entrypoint.bash
