set shell := ["bash", "-uec"]

default:
    @just --list

all: fmt check

check:
    shellcheck *.sh

fmt:
    shfmt -w -s -i 4 *.sh
    prettier --loglevel silent --ignore-path=.prettierignore --config=.prettierrc.json --write .
    just --unstable --fmt
