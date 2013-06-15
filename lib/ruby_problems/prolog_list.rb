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

    # 1.14 duplicate elements
    def self.dupli(list)
      my_flatten(list.map {|x| [x, x]})
    end

    # 1.15 duplicate elements of a list for given times
    def self.dupli_num(list, num)
      my_flatten(list.map {|x| (1..num).map {x}})
    end

    # 1.16 Drop every N'th element from a list
    def self.drop_every(list, n)
      i = 0
      list.select {i += 1; (i % 3) != 0 }
    end

    # 1.17 split into two lists
    def self.split(list, num)
      return list if num > list.size or num < 0
      i = j = 0
      l1 = list.take_while {i += 1; i <= num}
      l2 = list.drop_while {j += 1; j <= num}
      [l1, l2]
    end

    # 1.18 extract a slice from a list
    def self.slice (list, i, j)
      return [] if i < 0 or i > j or j > list.size
      ix = 0
      list.select {ix += 1; ix >= i and ix < j}
    end

    # 1.19 rotate list
    def self.rotate(list, n)
      return list if n == 0
      if n < 0
        last = list.delete_at(list.size - 1)
        rotate([last] + list, n + 1)
      else
        head, *tail = list
        rotate(tail << head, n - 1)
      end
    end

    # 1.20 remove element at the given index
    def self.remove_at(list, i)
      idx = 0
      [list[i - 1], list.select {idx += 1; idx != i}]
    end

    # 1.21 insert element at the given index
    def self.insert_at(list, i, elem)
      idx = 0
      split_list = split(list, i)
      split_list.first + [elem] + split_list.last
    end

    # 1.22 get an array within the given range
    def self.range(from, to)
      (from..to).to_a
    end

    # 1.23 Extract a given number of randomly selected elements from a list
    def self.random_select(list, num)
      return [] if num == 0
      rem_idx = Random.rand(list.size - 1)
      elem, new_list = remove_at(list, rem_idx + 1)
      [elem] + random_select(new_list, num - 1)
    end

    # 1.24 Lotto: Draw N different random numbers from the set 1..M
    def self.random_range(to, n)
      random_select(range(1, to), n)
    end

    # 1.25 Generate a random permutation of the elements of a list
    def self.random_permute(list)
      random_select(list, list.size)
    end

    # 1.26 Generate the combinations of K distinct objects chosen from the N elements of a list
    def self.combinations(num, list)
      return list.map {|l| [l]} if num == 1
      return [list] if num == list.size

      head, *tail = list
      combs = combinations(num - 1, tail)
      new_combs = combs.map {|c| [head] + c}
      new_combs + combinations(num, tail)
    end

    # 1.27 Group the elements of a set into disjoint subsets
    def self.group3(list, x, y, z)
      group_combs = []
      x_combs = combinations(x, list)
      x_combs.each do |x_combo|
        y_combos = combinations(y, list - x_combo)
        y_combos.each do |y_combo|
          z_combos = combinations(z, list - x_combo - y_combo)
          z_combos.each do |z_combo|
            group_combs << [x_combo, y_combo, z_combo]
          end
        end
      end
      group_combs
    end

    # 1.28a sort list by length of list
    def self.lsort(list)
      list.sort_by {|l| l.size}
    end

    def self.lfsort(list)
      bar = {}
      list.each do |x|
        bar[x.size] ||= []
        bar[x.size] << x
      end
      a = []
      ((bar.to_a.sort_by {|x| -x.last.size}).map {|x| x.last}).each {|x| x.each {|y| a << y}}
      a
    end
  end
end
