class RepeatedString
  class Node
    attr_reader :edges
    def initialize
      @edges = []
    end

    def add_edge(edge)
      @edges.push(edge)
    end

    # check whether an edge is in the node edges
    def find_edge(c)
      edge = @edges.find { |x| x.label == c }
      edge.nil? ? nil : edge
    end

    # find edge whose label either shares prefix with str or is str
    def find_edge_s(str)
      edge = @edges.reject { |e| e.label[0] != str[0] }
      edge.nil? ? nil : edge
    end
  end

  class Edge
    attr_reader :node, :label

    def initialize(label)
      @label = label
      @node = Node.new
    end
  end

  class SuffixTree
    def initialize(str)
      @str = str
      @root = Node.new
      create_tree
    end

    def create_tree
      # create an arr from the string
      arr = @str.split('')
      # add $ to the last of the array
      arr.push('$')
      (0..(arr.length - 1)).each { |x| p arr.drop(x); add_to_tree(arr.drop(x), @root) }
    end

    # add the element to the current node
    def add_to_tree(s, node)
      head, *tail = s
      # check whether an edge is in the node with for the head element
      edge = node.find_edge(head)
      if (edge.nil?)
        edge = Edge.new(head)
        node.add_edge(edge)
      end
      if (!tail.empty?) then add_to_tree(tail, edge.node) end
    end

    def create
      arr = @str.split('').push('$')
      (0..(arr.length - 1)).map { |x| arr.drop(x).join('') }.each { |s| add(s, @root) }
    end

    # optimized tree creating where nodes are combined to make a string label instead of every character node
    def add(str, node)
      # iterate over the edges and find is there any edge starting with string s and find the common prefixes
      edges = node.edges
      edge = node.find_edge_s(str)
      if (edges.empty?)
        edge = Edge.new(str)
        node.add_edge(edge)
      else
        # get the common string between the label and to be inserted str
        common = common_str(edge.label, str)
        common_edge = Edge.new(common)

        # now change the searched edge label and add it to this common edge
        common_edge.add(edge)
        node.edges.remove(edge)

        # and add common edge to this node
        node.add_edge(common_edge)

        # recursively add the remaining string to the edge
        label2 = str[(common.length - 1)..(str.length - 1)]
        add(label2, common_edge.node)
      end
    end

    def common_str(str1, str2)
      i = 0
      while (str1[i] == str2[i]) do
        i += 1
      end
      str1[0..i]
    end

    def show
      print_tree(@root, 1)
    end

    # print the tree
    def print_tree(node, level)
      (1..level).each { |x| print('   ') }
      if (!node.edges.empty?)
        node.edges.each do |e|
          puts e.label
          print_tree(e.node, level + 1)
        end
      end
    end
  end

  suffix_tree = SuffixTree.new('abaaba')
  suffix_tree.show
end