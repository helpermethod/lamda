local lamda = {}

function lamda.flip(fn)
  return function(a, b, ...)
    return fn(b, a, ...)
  end
end

lamda.join = lamda.flip(table.concat)

function lamda.concat(tbl1, tbl2)
  local copy = {table.unpack(tbl1)}

  for _, v in ipairs(tbl2) do
    table.insert(copy, v)
  end

  return copy
end

function lamda.pipe(fn, ...)
  local fns = {...}

  return function(...)
    return #fns == 0 and fn(...) or lamda.pipe(table.unpack(fns))(fn(...))
  end
end

function lamda.partial(fn, ...)
  local arguments = {...}

  return function(...)
    return fn(table.unpack(lamda.concat(arguments, {...})))
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
