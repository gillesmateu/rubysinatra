#!/bin/bash

RUBYSINATRA_HOME=/usr/local/rubysinatra/
RUBYSINATRAAPP_HOME=${RUBYSINATRA_HOME}/app
RUBYSINATRATHIN_HOME=${RUBYSINATRA_HOME}/thin

if [ ! -d ${RUBYSINATRAAPP_HOME} ]
then
  cp -a /root/app/app ${RUBYSINATRA_HOME}
  chown -R www-data:www-data ${RUBYSINATRAAPP_HOME}
fi

if [ ! -d ${RUBYSINATRATHIN_HOME} ]
then
  cp -a /root/app/thin ${RUBYSINATRA_HOME}
  chown -R www-data:www-data ${RUBYSINATRATHIN_HOME}
fi

cd ${RUBYSINATRAAPP_HOME} 
/usr/local/bundle/bin/bundle install

thin -c  ${RUBYSINATRATHIN_HOME} -R ${RUBYSINATRAAPP_HOME}/config.ru  start 
