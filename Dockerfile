## Github sites does not use our gemfile, it instead uses it's own
## The packages for this gets updated incrementally over time,
## so storing a "locked" version of anything for dev holds no benefit.
## When running the container we are deleting any local Gemfile.lock
## To prevent clashes if in a different state (eg. if it was run in a
## local dev environment).

FROM ruby:2.6.3-alpine
RUN apk update
RUN apk add build-base
COPY ./Gemfile ./advanced-mis/Gemfile
WORKDIR ./advanced-mis
RUN bundle install
RUN apk del build-base
COPY ./ ./advanced-mis
EXPOSE 4000
CMD rm Gemfile.lock && bundle exec jekyll serve --host 0.0.0.0 --baseurl ""
