# server image는 ubunutu 24.04를 사용
FROM ubuntu:24.04
# Dockerfile 작성자
# MAINTAINER aaa aaa@aaa.net 

# image가 올라갔을 때 수행되는 명령어들
# -y 옵션을 넣어서 무조건 설치가 가능하도록 한다.

RUN apt-get update && \
    apt-get -y upgrade 

RUN apt-get install -y ruby-full build-essential zlib1g-dev curl git

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash

RUN apt-get install -y nodejs

ENV GEM_BIN=/usr/gem/bin
ENV GEM_HOME=/usr/gem

RUN gem install jekyll bundler

RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
RUN echo 'export GEM_HOME="$GEM_HOME"' >> ~/.bashrc
RUN echo 'export PATH="$GEM_HOME/bin:$PATH"' >> ~/.bashrc

# apache가 기본적으로 80포트를 사용하기 때문에 expose를 이용해 apache server로 접근이 가능하도록 한다.
 
VOLUME /chirpy
EXPOSE 35729
EXPOSE 4000

# 컨테이너가 생성 된 이후에 내부의 아파치 서버는 항상 실행중인 상태로 만들어준다.
# apachectl을 foreground(즉, deamon)상태로 돌아가도록 한다.
CMD ["apachectl", "-D", "FOREGROUND"]

# docker buildx build -t chirpy ./ 
# docker run --rm --name chirpy -vC:\Project\jekyll-theme-chirpy:/chirpy -p4000:4000 -p35729:35729 -it chirpy /bin/bash
# git clone https://github.com/cotes2020/jekyll-theme-chirpy.git
# ./tools/init.sh
# bundle install && bundle exec jekyll s --host 0.0.0.0 --livereload
