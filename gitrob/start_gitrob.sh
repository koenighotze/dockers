#!/bin/sh
/root/wait-for postgres:5432
yes | gitrob analyze --bind-address=0.0.0.0 --port=8000 --access-tokens=$GITHUB_ACCESS_TOKENS $*