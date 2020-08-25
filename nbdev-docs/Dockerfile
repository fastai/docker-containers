FROM jekyll/jekyll:4.0.1
RUN apk add git && apk upgrade
WORKDIR /srv/dev-install
RUN git clone https://github.com/fastai/fastai.git --depth 1
RUN chmod -R 777 .
RUN cd fastai/docs_src && gem install bundler && chmod -R u+rwx . && jekyll build
WORKDIR /srv/jekyll
