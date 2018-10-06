# lamda

![CircleCI branch](https://img.shields.io/circleci/project/gh/helpermethod/lamda/master.svg)

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
