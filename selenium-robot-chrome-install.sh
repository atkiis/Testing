#!/bin/bash

set -ex

GECKODRIVER_VERSION="v0.24.0"
CHROMEDRIVER_VERSION="2.46"
FIREFOX_VERSION="66.0"
RF_VERSION="3.1.1"
SELENIUM_VERSION="3.141.0"

apt-get update
DEBIAN_FRONTEND="noninteractive" apt-get -q install --force-yes -y -o Dpkg::Options::="--force-confnew" --no-install-recommends \
                   apt-utils wget bash git curl python2.7 python-pip python3 python3-pip firefox unzip bzip2 xvfb fluxbox xauth libgtk-3-0 libasound2 libdbus-glib-1-2 &&\
                   apt-get -q autoremove && apt-get -q clean -y && rm -rf /var/lib/apt/lists/* &&\
                   rm -f /var/cache/apt/*.bin
 
pip3 install selenium==${SELENIUM_VERSION} robotframework==${RF_VERSION} robotframework-seleniumlibrary==3.3.1

# Firefox and geckodriver matched

wget --quiet -N https://ftp.mozilla.org/pub/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/en-US/firefox-${FIREFOX_VERSION}.tar.bz2
tar xjf firefox-${FIREFOX_VERSION}.tar.bz2 -C /opt
ln -sf /opt/firefox/firefox /usr/local/bin/firefox
ln -sf /opt/firefox/firefox /usr/bin/firefox
rm firefox-${FIREFOX_VERSION}.tar.bz2

#Chromedriver for Firefox to communicate to SeleniumLibrary
wget -q https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
chmod a+x ./chromedriver
mkdir -p /opt/chromedriver/
mv ./chromedriver /opt/chromedriver/

#Geckodriver for Firefox to communicate to SeleniumLibrary.
wget --quiet -N https://github.com/mozilla/geckodriver/releases/download/${GECKODRIVER_VERSION}/geckodriver-${GECKODRIVER_VERSION}-linux64.tar.gz
mkdir -p /opt/geckodriver/
tar zxf geckodriver-${GECKODRIVER_VERSION}-linux64.tar.gz -C /opt/geckodriver
chmod a+x /opt/geckodriver/geckodriver
ln -sf /opt/geckodriver/geckodriver /usr/local/bin/geckodriver
ln -sf /opt/geckodriver/geckodriver /usr/bin/geckodriver
ln -sf /opt/chromedriver/chromedriver /usr/local/bin/chromedriver
ln -sf /opt/chromedriver/chromedriver /usr/bin/chromedriver
rm geckodriver-${GECKODRIVER_VERSION}-linux64.tar.gz
