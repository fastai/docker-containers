FROM jekyll/jekyll:4.0.1
RUN apk add git
RUN git clone https://github.com/fastai/fastai-docs.git
RUN cd fastai-docs && gem install bundler && chmod -R u+rwx . && jekyll build
#RUN git clone https://github.com/fastai/fastai.git
#RUN cd fastai/docs && gem install bundler && chmod -R u+rwx . && jekyll build -V
RUN chmod -R 777 .
