FROM fastai/ubuntu

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/root
WORKDIR /root

COPY .bashrc ./
RUN mkdir tmp
COPY Gemfile tmp/

RUN apt-fast install -y ruby-full

RUN gem install jekyll bundler
RUN cd tmp && bundle config set system 'true' && bundle install
RUN rm -rf tmp

CMD [ "/bin/bash" ]

