
class StrangeNumbers
  require 'set'

  @@arr = SortedSet.new [0, 1, 2, 3, 4]

  class Queue
    def initialize
      @elements = []
    end

    def push(x)
      @elements.push(x)
      self
    end

    def pop
      head, *tail = @elements
      @elements = tail
      head
    end

    def peek
      @elements[0]
    end

    def empty?
      @elements.size == 0
    end
  end

  def self.strange_nums
    queue = Queue.new
    queue.push(5).push(6).push(7).push(8).push(9)
    ele = 5
    max = 10**19
    while (ele < max && !queue.empty?) do
      ele = queue.pop
      @@arr.add(ele)
      foo = ele.to_s.length
      (2..(foo + 2)).each do |x|
        queue.push(ele * x) if (ele * x).to_s.length == x
      end
    end
  end

  def self.strange?(x)
    @@arr.member?(x)
  end

  def self.count_strange(l, r)
    @@arr.to_a.find_all { |x| (x >= l && x <= r) }
  end

  strange_nums
  p @@arr.to_a
  puts(count_strange(0, 10**18).length)
  # tests = gets.to_i
  # (1..tests).each do |i|
  #   a = gets.split(' ').map(&:to_i)
  #   puts(count_strange(a[0], a[1]))
  # end
end