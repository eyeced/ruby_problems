class JosephusNumbers

  def rotate(arr, seq, n)
    head, *tail = arr
    if (tail.empty?) then seq.push(head)
    else
      arr.rotate!(n)
      x = arr.pop
      rotate(arr, seq.push(x), n)
    end
  end

  File.open(ARGV[0]).each_line do |line|
    # Do something with line, ignore empty lines
    #...
    arr = line.split(',')
    puts(rotate((0..(arr[0].to_i - 1)).to_a, [], arr[1].to_i).join(' '))
  end

end