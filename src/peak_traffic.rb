begin
  class DiGraph
    # initialize with number of vertices and also create the adjacency list with these vertices
    def initialize
      # adjacency list for all vertices
      @adjacency_list = []
      # mapping of vertices to the index, index would be used as the vertex number, this is for performance only
      @vertices = []
    end

    # return the connected vertices to this vertex, return the adjacency list
    def adj(v)
      @adjacency_list[@vertices.find_index(v)]
    end

    # if the vertices are not set in the array then add them and then push w to the adjacency list of x
    def add_edge(v, w)
      if (!@vertices.include?(v))
        @vertices.push(v)
        @adjacency_list[@vertices.find_index(v)] = []
      end
      if (!@vertices.include?(w))
        @vertices.push(w)
        @adjacency_list[@vertices.find_index(w)] = []
      end
      if (!@adjacency_list[@vertices.find_index(v)].include?(w))
        @adjacency_list[@vertices.find_index(v)].push(w)
      end
    end

    # reverse the di graph this would be used in computing the strong components
    def reverse
      reverseDiGraph = DiGraph.new
      @vertices.each {|x| adj(x).each { |y| reverseDiGraph.add_edge(y, x) } }
      reverseDiGraph
    end

    # print the graph
    def print
      @vertices.each {|x| puts(x + ' -> ' + adj(x).to_s) }
    end

    def vertices
      @vertices
    end

    def index(v)
      @vertices.find_index(v)
    end

    def connected?(x, y)
      adj(x).include?(y) and adj(y).include?(x)
    end
  end

  # do the depth first on the graph
  class DepthFirstTraverse

    # initialize with the graph
    def initialize(graph)
      @graph = graph
      @reverse_post = []
      @marked = Array.new(graph.vertices.length).map { false }
      graph.vertices.each { |x| _dfs(x) }
    end

    # depth first search over the vertex v
    def _dfs(v)
      if (!@marked[@graph.index(v)])
        @marked[@graph.index(v)] = true
        @graph.adj(v).each { |x| if !@marked[@graph.index(x)] then _dfs(x) end}
        @reverse_post.push(v)
      end
    end

    # return the reverse post list
    def reverse_post
      @reverse_post.reverse
    end
  end

  # return the strongly connected components
  class StronglyConnectedComps
    # initialize with the graph object
    def initialize(graph)
      @graph = graph
      @marked = Array.new(@graph.vertices.length).map { false }
      @strong_comps = (0..(@graph.vertices.length - 1)).to_a
      @count = 0
      # now reverse this graph and get the reverse post order of the reversed graph
      reverse_graph = @graph.reverse

      DepthFirstTraverse.new(reverse_graph).reverse_post.each do |x|
        if (!@marked[@graph.index(x)])
          dfs(x)
          @count += 1
        end
      end
    end

    def dfs(v)
      @marked[@graph.index(v)] = true
      @strong_comps[@graph.index(v)] = @count
      @graph.adj(v).each { |x| if (!@marked[@graph.index(x)]) then dfs(x) end}
    end

    def strong_comps
      @strong_comps
    end
  end

  graph = DiGraph.new

  File.open(ARGV[0]).each_line do |line|
    # Do something with line, ignore empty lines
    #...
    arr = line.split("\t")
    graph.add_edge(arr[1].strip, arr[2].strip)
  end

  # initialize the strong component computations and
  # get the strong components array
  strong_comps = StronglyConnectedComps.new(graph).strong_comps
  # set the array into groups
  groups = graph.vertices.group_by { |x| strong_comps[graph.vertices.find_index(x)] }
  # filter out groups where group length is less than 3
  valid_groups = (0..(groups.length - 1)).map { |i| groups[i] }.reject { |x| x.length < 3 }

  # print the groups
  # valid_groups.each { |g| puts(g.sort.join(', ')) }

  # valid_groups.reverse.each { |g| g.each { |x| puts(x + ' -> ' + graph.adj(x).map { |s| s.gsub('@example.com', '') }.join(' ')) } }

  def split_groups(groups, graph)
    head, *tail = groups
    if (tail.empty?)
      [[head]]
    else
      connected = tail.reject { |x| !graph.connected?(head, x) }
      if (connected.length == tail.length)
        split_groups(tail, graph).map { |x| x.insert(0, head) }
      else
        split_groups(connected.insert(0, head), graph) + split_groups((tail - connected), graph)
      end
    end
  end

  split_g = []
  valid_groups.reverse.each { |g| split_groups(g.sort_by { |x| -graph.adj(x).length }, graph).each { |y| split_g.push(y) } }
  split_g.map { |g| if (g.length > 2) then g.sort.join(', ') end }.sort.each { |x| puts(x) }
end