local lamda = require('lamda')

describe('lamda', function()
  local function add(a, b)
    return a + b
  end

  describe('split', function()
    for i, pair in ipairs({
      {{':', 'a:b:c'}, {'a', 'b', 'c'}},
      {{':', ':abc'}, {'abc'}},
      {{':', 'abc:'}, {'abc'}},
      {{'%s', 'a b c'}, {'a', 'b', 'c'}},
      {{'', 'abc'}, {'a', 'b', 'c'}}
    }) do
      local passed_in, expected = table.unpack(pair)

      it('should split the string into an array of strings' .. '[' .. i .. ']', function()
        assert.is_same(expected, lamda.split(table.unpack(passed_in)))
      end)  
    end
  end)

  describe('reduce', function()
    it('should reduce an array of elements to a single value', function()
      assert.is_equal(6, lamda.reduce(function(acc, value) return acc + value end, 0, {1, 2, 3}))
    end)
  end)

  describe('map', function()
    it('should return a new array with the result of applying the function to all elements of the original array', function()
      assert.is_same({1, 4, 9}, lamda.map(function(x) return x ^ 2 end, {1, 2, 3}))
    end)
  end)

  describe('flip', function()
    local function div(a, b)
      return a / b
    end

    it('should return a new function with the order of the first two arguments reversed', function()
      assert.is_equal(div(2, 1), lamda.flip(div)(1, 2))
    end)
  end)

  describe('join', function()
    it('should concatenate all elements into a single string', function()
      assert.is_equal('1, 2, 3', lamda.join(', ', {1, 2, 3}))
    end)
  end)

  describe('concat', function()
    it('should return a new table consisting of the elements of the first table ' ..
      'followed by the elements of the second table', function()
      assert.is_same({1, 2, 3}, lamda.concat({1, 2}, {3}))
    end)
  end)

  describe('pipe', function()
    it('should compose functions from left to right', function()
      assert.is_equal(10, lamda.pipe(add, function(x) return x * 2 end)(2, 3))
    end)
  end)

  describe('partial', function()
    it('should partially apply the provided arguments', function()
      assert.is_equal(5, lamda.partial(add, 2)(3))
    end)
  end)

  describe('partial_right', function()
    it('TODO', function()
      assert.is_equal(5, lamda.partial_right(add, 3)(2))
    end)
  end)

  describe('any_pass', function()
    it('should return a new predicate that returns true for a given argument ' ..
      'if at least one of the provided predicates is satisfied by the argument', function()
      local function is_string(x) return type(x) == 'string' end
      local function is_number(x) return type(x) == 'number' end

      assert.is_true(lamda.any_pass(is_string, is_number)(2))
    end)
  end)

  describe('sort', function()
    it('should return a copy of the list, sorted according to the comparator function', function()
      assert.is_same({1, 2, 3}, lamda.sort(function(a, b) return a < b end, {2, 1, 3}))
    end)
  end)
end)
