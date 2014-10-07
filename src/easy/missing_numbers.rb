class MissingNumbers
  def self.missing(arr1, arr2)
    foo = Array.new(100, 0)
    bar = Array.new(100, 0)

    min = arr2.min

    arr1.each { |x| foo[x - min] += 1 }
    arr2.each { |x| bar[x - min] += 1 }

    (0..99).each { |i| bar[i] = bar[i] - foo[i] }
    (0..99).find_all { |i| bar[i] > 0 }.map { |x| x + min }.join(' ')
  end

  gets
  arr1 = gets.split(' ').map(&:to_i)
  gets
  arr2 = gets.split(' ').map(&:to_i)

  puts(missing(arr1, arr2))
end