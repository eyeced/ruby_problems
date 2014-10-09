class TreePuring

  class Node
    attr_accessor :value, :children, :sum, :parent, :weight
    def initialize(value, weight)
      @value = value
      @weight = weight
      @children = []
    end

    def add_child(child)
      @children.push(child)
      child.parent = self
    end
  end

  def self.add_sum_to_node(root)
    root.sum = root.value + root.children.reduce { |sum, n| sum + add_sum_to_node(n) }
    root.sum
  end

  def self.remove(node)
    par = node.parent
    while (!par.nil?) do
      par.sum = par.sum - node.sum
      par = par.parent
    end
  end

  n_k = gets.split(' ').map(&:to_i)
  n = n_k[0]
  k = n_k[1]
  @@arr = gets.split(' ').map(&:to_i)

  @@par_hash = Hash.new
  @@par_hash[1] = Node.new(1, @@arr[0])

  def self.add_node(n, parent)
    node = Node.new(n, @@arr[n - 1])
    @@par_hash[parent].add_child(node)
    @@par_hash[n] = node
  end

  # add the sum of child nodes to the parent node recursively
  add_sum_to_node(@@par_hash[1])

  (1..(n - 1)).each do |i|
    a = gets.split(' ').map(&:to_i)
    if @@par_hash.key?(a[0]) then add_node(a[1], a[0]) else add_node(a[0], a[1]) end
  end

end