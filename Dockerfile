FROM ruby:2.7.1
ARG SECRET_KEY_BASE
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn 
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
ADD package.json /myapp/package.json
ADD yarn.lock /myapp/yarn.lock
RUN bundle install && yarn install
ADD . /myapp
RUN DB_ADAPTER=nulldb RAILS_ENV=production bundle exec rake assets:precompile