#! /usr/bin/env ruby
#

def gcf(a, b)
  tmp, gcd = a, b
  while tmp != 0
    gcd, tmp = tmp, gcd % tmp
  end
  gcd
end

def lcm(a,b)
  smallest, largest = a > b ? [b, a] : [a, b]
  smallest * (largest / gcf(a,b))
end

def lcm3(a,b,c)
   a,b,largest = [a,b,c].sort
   (largest..a*b*c).step(largest).each{|i| return i if i % b == 0 && i % a == 0}
end

def lcmM(arr)
  arr.reduce(:lcm)
end

def test_gcf(a, b, expected)
  puts "gcf(#{a},#{b}) = #{gcf(a,b)}; expected : #{expected}"
end

def test_lcm(a, b, expected)
  puts "lcm(#{a},#{b}) = #{lcm(a,b)}; expected : #{expected}"
end

def test_lcmM(l, expected)
  puts "lcm(#{l.map{|i|i.to_s}.join(', ')}) = #{lcmM(l)}; expected : #{expected}"
end

def test_lcm3(l)
  puts "lcm3(#{l.map{|i|i.to_s}.join(', ')}) = #{lcm3(*l)}; expected : #{lcmM(l)}"
end


test_gcf(1,2,1)
test_gcf(2,8,2)
test_gcf(12,18,6)
test_gcf(20,30,10)
test_gcf(30,20,10)

puts

test_lcm(1,2,2)
test_lcm(2,8,8)
test_lcm(12,18,36)
test_lcm(20,30,60)
test_lcm(30,20,60)

puts

test_lcmM([1,2,3],6)
test_lcmM([2,8],8)
test_lcmM([12,18,6],36)
test_lcmM([20,30],60)
test_lcmM([30,20,40,60],120)

puts

test_lcm3([1,2,3])
test_lcm3([2,8,12])
test_lcm3([12,18,6])
test_lcm3([20,30,17])
test_lcm3([30,20,40])
