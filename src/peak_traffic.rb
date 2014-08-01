class PeakTraffic
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
      @adjacency_list[@vertices.find_index(v)].push(w)
    end

    # reverse the di graph this would be used in computing the strong components
    def reverse
      reverseDiGraph = DiGraph.new
      @vertices.each {|x| adj(x).each { |y| reverseDiGraph.add_edge(y, x) } }
      reverseDiGraph
    end

    def connected?(x, y)
      adj(x).include?(y) && adj(y).include?(x)
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
      puts('reverse post - ' + @reverse_post.join('-'))
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
  # read in the file and add edges to the graph

  graph.add_edge(v[4], v[2])
  graph.add_edge(v[2], v[3])
  graph.add_edge(v[3], v[2])
  graph.add_edge(v[6], v[0])
  graph.add_edge(v[0], v[1])
  graph.add_edge(v[2], v[0])
  graph.add_edge(v[11], v[12])
  graph.add_edge(v[12], v[9])
  graph.add_edge(v[9], v[10])
  graph.add_edge(v[9], v[11])
  graph.add_edge(v[8], v[9])
  graph.add_edge(v[10], v[12])
  graph.add_edge(v[11], v[4])
  graph.add_edge(v[4], v[3])
  graph.add_edge(v[3], v[5])
  graph.add_edge(v[7], v[8])
  graph.add_edge(v[8], v[7])
  graph.add_edge(v[5], v[4])
  graph.add_edge(v[0], v[5])
  graph.add_edge(v[6], v[4])
  graph.add_edge(v[6], v[9])
  graph.add_edge(v[7], v[6])

  # initialize the strong component computations and
  # get the strong components array
  strong_comps = StronglyConnectedComps.new(graph).strong_comps
  # set the array into groups
  groups = graph.vertices.group_by { |x| strong_comps[graph.vertices.find_index(x)] }
  # filter out groups where group length is less than 3
  valid_groups = (0..(groups.length - 1)).map { |i| groups[i] }.reject { |x| x.length < 3 }
  # print the groups
  valid_groups.each { |g| puts(g.join(', ')) }

  def split_groups(groups, graph, acc)
    head, *tail = groups
    if (tail.empty?) then acc.map {|a| a.push(head)}
    else
      connected = tail.reject { |x| graph.connected?(head, x) }
      if (connected.length == tail.length)
        split_groups(tail, graph, acc.map { |a| a.push(head) })
      else
        split_groups(connected.insert(0, head), graph, acc) + split_groups(tail.reject { |x| !connected.include?(x) }, graph, acc)
      end
    end
  end
end