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

### flip(fn)

Returns a new function with the order of the first two arguments reversed.

```lua
local join = lamda.flip(table.concat)

join(',', {1, 2, 3}) # returns '1,2,3'
```

### join(separator, tbl)

```lua
join(',', {1, 2, 3}) # returns '1,2,3'
```

### concat(tbl1, tbl2)

### pipe(fn, ...)

### partial(fn, ...)

### partial_right(fn, ...)

### any_pass(predicate, ...)

### sort(comparator, tbl)
