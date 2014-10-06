class UriSame
  require 'open-uri'
  File.open(ARGV[0]).each_line do |line|
    arr = line.split(';')
    if (URI.decode(arr[0].strip).downcase == URI.decode(arr[1].strip).downcase) then puts('True') else puts('False') end
  end
end