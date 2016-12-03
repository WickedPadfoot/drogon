FROM ruby:2.3

RUN apt-get update \
      && apt-get install -y --no-install-recommends postgresql-client \
      && apt-get install -y nodejs \
      && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/app/src
COPY src/Gemfile* ./
RUN bundle install
COPY src .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
