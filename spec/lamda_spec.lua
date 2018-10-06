local lamda = require('lamda')

describe('lamda', function()
  local function add(a, b)
    return a + b
  end

  describe('flip', function()
    local function div(a, b)
      return a / b
    end

    it('should flip the first two arguments of a function', function()
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
