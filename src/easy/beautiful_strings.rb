class BeautifulStrings
  @@letters = %w{a b c d e f g h i j k l m n o p q r s t u v w x y z}
  def self.beauty(str)
    c = 27
    map = {}
    str.downcase.split('').keep_if { |s| @@letters.index(s) != nil }.sort.chunk { |x| x }.to_a.map { |x, a| [x, a.length]}.sort_by { |y| -y[1] }.map { |x| c -= 1; [x[0], c] }.each { |x| map[x[0]] = x[1] }
    str.downcase.split('').keep_if { |s| @@letters.index(s) != nil }.map { |s| map[s] }.reduce(:+)
  end

  puts(beauty('Good luck in the Facebook Hacker Cup this year!'))
end