class EmailValidation

  File.open(ARGV[0]).each_line do |line|
    # Do something with line, ignore empty lines
    #...
    if (line =~ /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i)
      puts('true')
    else
      puts('false')
    end
  end

end