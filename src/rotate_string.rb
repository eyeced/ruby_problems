class RotateString

  def self.is_rotation(s1, s2, n)
    if (n == 0) then 'false'
    else
      if (s1 == s2) then 'true'
      else
        is_rotation(s1, s2.rotate(1), n - 1)
      end
    end
  end

  #File.open(ARGV[0]).each_line do |line|
    # Do something with line, ignore empty lines
    #...
    arr = 'Basefont,tBasefon'.split(',')
    puts(is_rotation(arr[0].split(''), arr[1].split(''), arr[0].length))
  # end
end