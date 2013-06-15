require 'spec_helper'

describe 'Arithmetic' do
  before :each do
  end

  describe "2.01 test is prime" do
    it "should return true" do
      RubyProblems::Arithmetic.is_prime?(7).should be_true
      RubyProblems::Arithmetic.is_prime?(3).should be_true
      RubyProblems::Arithmetic.is_prime?(31).should be_true
      RubyProblems::Arithmetic.is_prime?(32).should_not be_true
      RubyProblems::Arithmetic.is_prime?(99).should_not be_true
    end
  end

  describe "2.02 get prime factors" do
    it "should get prime factors" do
      RubyProblems::Arithmetic.prime_factors(315).should == [3, 3, 5, 7]
    end
  end

  describe "2.04 all prime numbers" do
    it "should return all prime numbers" do
      RubyProblems::Arithmetic.all_primes(10).should == [2, 3, 5, 7]
    end
  end
end
