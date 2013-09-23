class Array
  def tail
    self[1..-1]
  end

  def merge_sort
    return self if self.length <= 1

    middle = (self.length - 1) / 2
    left = self.slice(0..middle)
    right = self.slice(middle + 1..-1)

    return merge(left.merge_sort, right.merge_sort)
  end
end

def merge(left, right)
  result = []
  while(left.length > 0 || right.length > 0)
    if(left.length > 0 && right.length > 0)
      if left.first <= right.first
        result.push(left.first)
        left = left.tail
      else
        result.push(right.first)
        right = right.tail
      end
    else
      if left.length > 0
        result.push(left.first)
        left = left.tail
      else
        result.push(right.first)
        right = right.tail
      end
    end
  end

  return result
end

def compare(arr_size)
  a = Array.new(arr_size){|x| rand * 1000000000 - 500000000}

  t1 = Time.now
  b = a.merge_sort
  t2 = Time.now
  c = a.sort
  t3 = Time.now

  puts "number of elements: #{arr_size}"
  puts "arrays are equal: #{b == c}"
  puts "default sort time: #{t3 - t2}"
  puts "merge_sort sort time: #{t2 - t1}"
  puts "merge_sort / sort time: #{(t2 - t1) / (t3 - t2)}"
  puts "\n"
end

compare 10
compare 100
compare 1000
compare 10000
compare 100000
compare 1000000
compare 10000000

# number of elements: 10
# arrays are equal: true
# default sort time: 9.228e-06
# merge_sort sort time: 0.000153253
# merge_sort / sort time: 16.607390550498483
#
# number of elements: 100
# arrays are equal: true
# default sort time: 3.928e-05
# merge_sort sort time: 0.000364811
# merge_sort / sort time: 9.287449083503056
#
# number of elements: 1000
# arrays are equal: true
# default sort time: 0.000562329
# merge_sort sort time: 0.006090531
# merge_sort / sort time: 10.830903261258088
#
# number of elements: 10000
# arrays are equal: true
# default sort time: 0.007436122
# merge_sort sort time: 0.065687837
# merge_sort / sort time: 8.833614752420683
#
# number of elements: 100000
# arrays are equal: true
# default sort time: 0.106579168
# merge_sort sort time: 0.885046856
# merge_sort / sort time: 8.304126149680583
#
# number of elements: 1000000
# arrays are equal: true
# default sort time: 1.794288246
# merge_sort sort time: 14.14441553
# merge_sort / sort time: 7.8830230101167365
#
# number of elements: 10000000
# arrays are equal: true
# default sort time: 27.662070618
# merge_sort sort time: 159.217639828
# merge_sort / sort time: 5.755810619773177
