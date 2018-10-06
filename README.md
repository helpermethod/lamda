# lamda

[![CircleCI](https://circleci.com/gh/helpermethod/lamda.svg?style=svg)](https://circleci.com/gh/helpermethod/lamda)
[![Coverage Status](https://coveralls.io/repos/github/helpermethod/lamda/badge.svg?branch=master)](https://coveralls.io/github/helpermethod/lamda?branch=master)

A functional programming library for Lua, inspired by [Ramda](https://ramdajs.com/).

## Install

```sh
$ luarocks install lamda
```

## Usage

```lua
local lamda = require('lamda')
```

## API

flip(fn)
concat(tbl1, tbl2)
pipe(fn, ...)
partial(fn, ...)
partial_right(fn, ...)
any_pass(predicate, ...)
sort(comparator, tbl)              
