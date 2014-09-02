class BalancedParentheses

  def self.balanced?(str)
    true if str.empty? || str == ':)' || str == ':(' || str == ':'
    if (!str.index('(').nil?)
      false if (str.index)
    else
      true
    end
  end

  s = ''..gsub(/\w/, '').gsub(' ', '')
  if (balanced? s) then puts('YES') else puts('NO') end

end