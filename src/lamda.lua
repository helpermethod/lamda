local lamda = {}

function lamda.flip(fn)
  return function(a, b, ...)
    return fn(b, a, ...)
  end
end

function lamda.append(elem, tbl)
  local copy = {table.unpack(tbl)}

  table.insert(copy, elem)

  return copy
end

function lamda.reduce(fn, acc, tbl)
  return #tbl == 0 and acc or lamda.reduce(fn, fn(acc, tbl[1]), {table.unpack(tbl, 2)})
end

function lamda.map(fn, tbl)
  return lamda.reduce(function(acc, value) return lamda.append(fn(value), acc) end, {}, tbl)
end

function lamda.filter(predicate, tbl)
  return lamda.reduce(function(acc, value) return predicate(value) and lamda.append(fn(value), acc) or acc end, {}, tbl)
end

local function split(pattern, acc, str)
  if str == '' then return acc end
  if pattern == '' then return split(pattern, lamda.append(str:sub(1, 1), acc), str:sub(2)) end

  local from, to = str:find(pattern)

  return not from and lamda.append(str, acc) or split(pattern, from == 1 and acc or lamda.append(str:sub(1, from - 1), acc), str:sub(to + 1))
end

function lamda.split(pattern, str)
  return split(pattern, {}, str)
end

lamda.join = lamda.flip(table.concat)

function lamda.concat(first_table, second_table)
  return lamda.reduce(lamda.flip(lamda.append), first_table, second_table)
end

function lamda.pipe(fn, ...)
  local fns = {...}

  return function(...)
    return lamda.reduce(function(acc, value) return value(acc) end, fn(...), fns)
  end
end

function lamda.partial(fn, ...)
  local arguments = {...}

  return function(...)
    return fn(table.unpack(lamda.concat(arguments, {...})))
  end
end

function lamda.partial_right(fn, ...)
  local arguments = {...}

  return function(...)
    return fn(table.unpack(lamda.concat({...}, arguments)))
  end
end

function lamda.any_pass(predicate, ...)
  local rest = {...}

  return function(argument)
    if #rest == 0 then return predicate(argument) end

    return predicate(argument) or lamda.any_pass(table.unpack(rest))(argument)
  end
end

function lamda.sort(comparator, tbl)
  local copy = {table.unpack(tbl)}

  table.sort(copy, comparator)

  return copy
end

return lamda
