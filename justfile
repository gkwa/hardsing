set shell := ["bash", "-uec"]

default:
    @just --list

fmt:
    shfmt -w -s -i 4 setup 
    shfmt -w -s -i 4 teardown
    prettier --loglevel silent --ignore-path=.prettierignore --config=.prettierrc.json --write .
    just --unstable --fmt
