class Encryption
  def self.encode(str)
    # row = Math::sqrt(str.length).floor
    col = Math::sqrt(str.length).ceil

    str.split('').each_with_index.group_by { |s, i| i % col }.map { |k, v| v.map { |a, i| a }.join('') }.join(' ')
  end

  puts(encode(gets))
end