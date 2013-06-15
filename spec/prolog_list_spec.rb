require 'spec_helper'

describe "Lists" do
  before :each do
    @list = ['a', 'b', 'c', 'd', 'e', 'f']
    @dup_list = ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']
  end

  describe "1.01 - my_last" do
    it "should return the last element of the array" do
      RubyProblems::PrologList.my_last(@list).should == @list.last
    end
  end

  describe "1.02 - second last element" do
    it "should return the second last element of the array" do
      RubyProblems::PrologList.second_last(@list).should == @list[@list.size - 2]
    end
  end

  describe "1.03 - element at index" do
    it "should return the asked element at the index" do
      RubyProblems::PrologList.element_at(@list, 2) == @list[1]
    end
  end

  describe "1.05 - reverse a list" do
    it "should reverse the list" do
      RubyProblems::PrologList.reverse(@list) == @list.reverse
    end
  end

  describe "1.06 - is a list palidrome" do
    it "it should return true for list [x, a, m, a, x]" do
      RubyProblems::PrologList.palindrome?(['x', 'a', 'm', 'a', 'x']).should be_true
    end

    it "should return false for [a, b, c, d]" do
      RubyProblems::PrologList.palindrome?(@list).should_not be_true
    end
  end

  describe "should flatten list [a, [b, [c, d], e]]" do
    it "should be equal tp [a, b, c, d, e]" do
      RubyProblems::PrologList.my_flatten(['a', ['b', ['c', 'd'], 'e'], 'f']).should == @list
    end
  end

  describe "1.08 - remove consecutive duplicates in list - [a,a,a,a,b,c,c,a,a,d,e,e,e,e]" do
    it "should return [a, b, c, a, d, e]" do
      RubyProblems::PrologList.compress(@dup_list).should == ['a', 'b', 'c', 'a', 'd', 'e']
    end
  end

  describe "1.09 - Pack consecutive duplicates of list elements [a,a,a,a,b,c,c,a,a,d,e,e,e,e] into sublists." do
    it "should return [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]" do
      RubyProblems::PrologList.pack(@dup_list).should == [['a', 'a', 'a', 'a'], ['b'], ['c', 'c'], ['a', 'a'], ['d'], ['e', 'e', 'e', 'e']]
    end
  end

  describe "Run length encodeing of  dup_list" do
    it "should return [[4,a],[1,b],[2,c],[2,a],[1,d][4,e]]" do
      RubyProblems::PrologList.encode(@dup_list).should == [[4, 'a'], [1, 'b'], [2, 'c'], [2, 'a'], [1, 'd'], [4, 'e']]
    end
  end

  describe "Run length modified encodeing of  dup_list" do
    it "should return [[4,a],b,[2,c],[2,a],d,[4,e]]" do
      RubyProblems::PrologList.encode_modified(@dup_list).should == [[4, 'a'], 'b', [2, 'c'], [2, 'a'], 'd', [4, 'e']]
    end
  end

  describe "Decode a run length encoded list [[4,a],b,[2,c],[2,a],d,[4,e]]" do
    it "should return [a,a,a,a,b,c,c,a,a,d,e,e,e,e]" do
      RubyProblems::PrologList.decode([[4, 'a'], 'b', [2, 'c'], [2, 'a'], 'd', [4, 'e']]).should == @dup_list
    end
  end

  describe "Run length direct encoding of  dup_list" do
    it "should return [[4,a],b,[2,c],[2,a],d,[4,e]]" do
      RubyProblems::PrologList.encode_direct(@dup_list).should == [[4, 'a'], 'b', [2, 'c'], [2, 'a'], 'd', [4, 'e']]
    end
  end

  describe "Duplicate elements" do
    it "should return [a,a,b,b,c,c,d,d,e,e,f,f]" do
      RubyProblems::PrologList.dupli(@list).should == ['a', 'a', 'b', 'b', 'c', 'c', 'd', 'd', 'e', 'e', 'f', 'f']
    end
  end

  describe "Duplicate elements" do
    it "should return [a,a,b,b,c,c,d,d,e,e,f,f]" do
      RubyProblems::PrologList.dupli_num(@list, 2).should == ['a', 'a', 'b', 'b', 'c', 'c', 'd', 'd', 'e', 'e', 'f', 'f']
    end
  end

  describe "Drop every Nth element" do
    it "should return [a, b, d, e]" do
      RubyProblems::PrologList.drop_every(@list, 3).should == %w{a b d e}
    end
  end

  describe "Split list on the given index" do
    it "should return [a, b, c] [d, e, f]" do
      RubyProblems::PrologList.split(@list, 3).should == [%w{a b c}, %w{d e f}]
    end
  end

  describe "Slice a list with max and min indexes" do
    it "should return [b, c, d]" do
      RubyProblems::PrologList.slice(@list, 2, 5).should == %w{b c d}
    end
  end

  describe "Rotate list" do
    it "should return [c d e f a b]" do
      RubyProblems::PrologList.rotate(@list, 2).should == %w{c d e f a b}
    end
  end

  describe "Rotate list with negative num" do
    it "should return [e f a b c d]" do
      RubyProblems::PrologList.rotate(@list, -2).should == %w{e f a b c d}
    end
  end

  describe "Remove item at position" do 
    it "should return [a b c e f]" do
      RubyProblems::PrologList.remove_at(@list, 4).should == ['d', %w{a b c e f}]
    end
  end

  describe "Insert element z after b" do
    it "should return [a b c d z e f]" do
      RubyProblems::PrologList.insert_at(@list, 4, 'z').should == %w{a b c d z e f}
    end
  end

  describe "Random select" do
    it "should return unique array everytime" do
      (1..100).each do |i|
        RubyProblems::PrologList.random_select((1..10).to_a, 5).uniq.size.should == 5
      end
    end
  end

  describe "Get all possible combinations from list for a given number, list of 12 with combinations for 3" do
    it "should return 220 distinct combinations" do
      RubyProblems::PrologList.combinations(3, %w{a b c d e f g h i j k l}).size.should == 220
    end
  end
end
