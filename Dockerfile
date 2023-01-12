# syntax=docker/dockerfile:1
# Run locally with `docker run -p 3000:3000 <name>`, publishing the port out to the host is important
FROM ruby:2.7.6-slim-bullseye
RUN apt-get update -qq && apt-get install -y build-essential git nodejs
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem install bundler
RUN bundle install

COPY . /app

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
