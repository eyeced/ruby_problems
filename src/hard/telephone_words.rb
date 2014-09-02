class TelephoneWords
  @@map = {
      0 => '0',
      1 => '1',
      2 => 'abc',
      3 => 'def',
      4 => 'ghi',
      5 => 'jkl',
      6 => 'mno',
      7 => 'pqrs',
      8 => 'tuv',
      9 => 'wxyz'
  }

  def self.permutations(arr)
    head, *tail = arr
    if (tail.empty?) then @@map[head].split('')
    else
      perms = permutations(tail)
      @@map[head].split('').flat_map { |s| perms.map { |p| s + p } }
    end
  end

  puts(permutations('4155230'.split('').map(&:to_i)).sort.join(','))
end