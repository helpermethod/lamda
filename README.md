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

join(',', {1, 2, 3}) -- returns '1,2,3'
```

### join(separator, tbl)

```lua
lamda.join(',', {1, 2, 3}) -- returns '1,2,3'
```

### concat(tbl1, tbl2)

### pipe(fn, ...)

Returns a new function by composing the passed in functions from left to right. The first function can have any arity, while the remaining functions must be unary.

```lua
local function add(a, b)
  return a + b
end

local function square(n)
  return n * n
end

local add_and_square = lamda.pipe(add, square)

add_and_square(2, 3) -- returns 25
```

### partial(fn, ...)

### partial_right(fn, ...)

### any_pass(predicate, ...)

### sort(comparator, tbl)
