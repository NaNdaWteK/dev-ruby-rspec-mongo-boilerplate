FROM ruby

RUN apt-get update

ENV MODE development

ENV HOME=/opt/app

RUN mkdir -p $HOME

ADD . $HOME

WORKDIR $HOME

RUN gem install bundler

RUN bundle install
