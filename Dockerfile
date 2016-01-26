FROM ruby:2

MAINTAINER Gilles MATEU <gilles@mateu.org>

ENV RUBYSINATRA_HOME=/usr/local/rubysinatra/

RUN mkdir -p /usr/local/rubysinatra/{thin,app}

COPY app/* /usr/local/rubysinatra/app/
COPY thin/config.yml /usr/local/rubysinatra//thin/config.yml
COPY entrypoint.bash /

RUN chown -R www-data:www-data /usr/local/rubysinatra/ \
  && cp -a ${RUBYSINATRA_HOME} /root/app \
  && touch /root/firstrun

EXPOSE 3000

VOLUME /usr/local/rubysinatra/app/

WORKDIR /usr/local/rubysinatra
CMD /entrypoint.bash
