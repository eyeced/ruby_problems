class MinHeap < Array
  attr_accessor :size

  def heapify(i)
    l = left(i)
    r = right(i)

    # find the min from the 3 element tree
    if l < @size && self[l] < self[i]
      min = l
    else
      min = i
    end

    if r < @size && self[r] < self[min]
      min = r
    end

    if min != i
      exchange(i, min)
      heapify(min)
    end
  end

  def get_min
    if @size != 0
      value = self[0]
      self[0] = self[@size - 1]
      @size -= 1
      heapify(0)
    else
      nil
    end
  end

  # Builds a heap from an array
  def self.build(array)
    heap = self.new(array)
    heap.size = array.size

    if heap.size > 0
      ((heap.size / 2) - 1).downto(0) do |i|
        heap.heapify(i)
      end
    end

    return heap
  end

  def parent(i)
    return ((i + 1) / 2) - 1
  end

  def left(i)
    return (2 * i) + 1
  end

  def right(i)
    return (2 * i) + 2
  end

  def exchange(i, j)
    tmp = self[i]
    self[i] = self[j]
    self[j] = tmp
  end
end

heap = MinHeap.build([8, 4, 1, 2, 3, 7, 6, 5, 9])
p heap