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

local shout = lamda.pipe(string.upper, function(s) return s .. '!' end)

shout('lamda rocks') -- returns 'LAMDA ROCKS!'
```

## API

### flip(fn)

Creates a new function with the order of the first two arguments reversed.

```lua
local join = lamda.flip(table.concat)

join(',', {1, 2, 3}) -- returns '1,2,3'
```

### join(separator, tbl)

Creates a new string by concatenating all elemements and putting a separator in between.

```lua
lamda.join(',', {1, 2, 3}) -- returns '1,2,3'
```

### concat(first_table, second_table)

Creates a new list by concatenating the given arrays.

```lua
lamda.concat({1, 2, 3}, {4, 5, 6}) -- returns {1, 2, 3, 4, 5, 6}
```

### pipe(fn, ...)

Creates a new function by composing the given functions from left to right. The first function may have any arity while the remaining functions must be unary.

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

Creates a new array by sorting the given array according to a comparator function. The comparator function receives two arguments and must return `true` if the first argument should come first in the sorted array.

```lua
local numbers = {2, 1, 3}
lamda.sort(function(a, b) return a < b end, numbers) -- returns {1, 2, 3}
```
