def sum(array)
  total = 0
  i = 0

  while i < array.length
    total = total + array[i]
    i = i + 1
  end

  total
end

# turn local variables into default arguments (chop off head)

def sum(array, total = 0, i = 0)
  while i < array.length
    total = total + array[i]
    i = i + 1
  end

  total
end

# turn loop condition into a conditional return (chop off tail)

def sum(array, total = 0, i = 0)
  loop do
    if i < array.length
      total = total + array[i]
      i = i + 1
    else
      return total
    end
  end
end

# replace next loop iteration with recursive call

def sum(array, total = 0, i = 0)
  if i < array.length
    total = total + array[i]
    i = i + 1
    return sum(array, total, i)
  else
    return total
  end
end

# *general refactoring noises*

def sum(array, total = 0, i = 0)
  if i < array.length
    sum(array, total + array[i], i + 1)
  else
    total
  end
end
