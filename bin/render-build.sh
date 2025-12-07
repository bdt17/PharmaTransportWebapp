#!/usr/bin/env bash
set -e
bundle lock --add-platform x86_64-linux
bundle install
bin/rails assets:precompile
bin/rails db:migrate
