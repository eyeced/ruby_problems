module RubyProblems
  module PrologList
    # 1.01 - Last element of the list
    def self.my_last(list)
      element_at list, list.length
    end

    # 1.02 - Second last element of the list
    def self.second_last(list)
      element_at list, list.length - 1
    end

    # 1.03 - get element at index in list
    def self.element_at(list, index)
      list.each_with_index do |x, i|
        break x if i == index - 1
      end
    end

    # 1.04 number of elments in the list
    def self.num_elements(list)
      list.length
    end


    # 1.05 reverse a list
    def self.reverse(list)
      if list.length == 0
        []
      else
        head, *tail = list
        reverse(tail) + [head]
      end
    end

    # 1.06 check whether the list is plaindrome or not
    def self.palindrome?(list)
      reverse(list) == list
    end

    # 1.07 flatten a nested list
    def self.my_flatten(list)
      new_list = []
      list.each do |x|
        new_list = new_list + if x.is_a? Array then my_flatten(x) else [x] end
      end
      new_list
    end

    # 1.08 - Eliminate consecutive duplicates of list elements
    def self.compress(list)
      return list if list.empty?
      head, *tail = list
      foo = compress(tail)
      (!foo.empty? and foo.first == head) ? foo : ([head] + foo)
    end

    # 1.09 - Pack consecutive duplicates of list elements into sublists.
    def self.pack(list)
      new_list = []
      list.each do |elem|
        if new_list.empty?
          new_list = [[elem]]
        else
          (new_list.last.last == elem) ? (new_list.last << elem) : (new_list << [elem])
        end
      end
      new_list
    end

    # 1.10 - Run-length encoding of a list.
    def self.encode(list)
      pack(list).map {|x| [x.length, x.first]}
    end

    # 1.11 - Modified run-length encoding.
    def self.encode_modified(list)
      pack(list).map {|x| if x.length == 1 then x.first else [x.length, x.first] end}
    end

    # 1.12 Decode a run-length encoded list.
    def self.decode(list)
      packed_list = list.map {|x| if (x.is_a? Array) then (1..(x.first)).map {x.last} else [x] end }
      my_flatten(packed_list)
    end

    # 1.13 - Run-length encoding of a list (direct solution).
    def self.encode_direct(list)
      new_list = []
      list.each do |elem|
        if new_list.empty?
          new_list = [[1, elem]]
        else
          (new_list.last.last == elem) ? (new_list.last[0] = new_list.last.first + 1) : (new_list << [1, elem])
        end
      end
      new_list.map {|x| if x.first == 1 then x.last else x end}
    end
  end
end
