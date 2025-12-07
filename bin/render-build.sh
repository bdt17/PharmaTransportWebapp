#!/usr/bin/env bash
set -e
bundle lock --add-platform x86_64-linux
rm -rf public/packs
rm -rf tmp/cache
bundle install
bin/rails assets:precompile
bin/rails db:migrate
