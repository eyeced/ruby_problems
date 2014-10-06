class HexToDec
  @@map = {'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15}
  def self.hex_to_dec(str)
    str.split('').map { |s| @@map.has_key?(s) ? @@map[s] : s.to_i }.reverse.map.with_index { |x, i| x * (16 ** i) }.reduce(:+)
  end

  puts(hex_to_dec('f6ca'))
end