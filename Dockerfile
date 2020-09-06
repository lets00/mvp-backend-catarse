FROM ruby:2.7.0

RUN apt-get update -qq && apt-get install postgresql-client -y

WORKDIR /app

COPY . /app

RUN bundle install

#RUN chmod +x /app/entrypoint.sh

# Run migrations
#RUN ./app/entrypoint.sh

EXPOSE 4000

CMD ["rails", "server", "-p", "4000", "-b", "0.0.0.0"]