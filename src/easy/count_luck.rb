class CountLuck
  def self.wands(matrix, cur_pos, dest, count)
    if (cur_pos[0] == dest[0] && cur_pos[1] == dest[1])
      count
    else
      matrix[cur_pos[0]][cur_pos[1]] = 'X'
      all_steps = steps(matrix, cur_pos)
      # puts(all_steps.join(' ') + '   cur - ' + cur_pos.join('-'))
      if (all_steps.length == 0) then 0
      elsif (all_steps.length == 1) then wands(matrix, all_steps[0], dest, count)
      else
        vals = all_steps.map { |a| wands(get_clone(matrix), a, dest, count + 1) }
        # puts('#### ' + vals.join(' '))
        num = vals.find { |a| a > 0 }
        if num.nil? then 0 else num end
      end
    end
  end

  def self.get_clone(matrix)
    matrix.map { |r| r.map { |c| c } }
  end

  def self.steps(matrix, cur_pos)
    positions = [[cur_pos[0] - 1, cur_pos[1]], [cur_pos[0], cur_pos[1] - 1], [cur_pos[0] + 1, cur_pos[1]], [cur_pos[0], cur_pos[1] + 1]]
    positions.find_all { |a| a[0] >= 0 && a[0] < matrix.length && a[1] >= 0 && a[1] < matrix[0].length && (matrix[a[0]][a[1]] == '.' || matrix[a[0]][a[1]] == '*')}
  end

  def self.ron_impressed?(matrix, start_pos, end_pos, num_magic)
    wands_used = wands(matrix, start_pos, end_pos, 0)
    # puts(wands_used)
    wands_used == num_magic
  end

  tests = gets.to_i
  (1..tests).each do |x|
    m_n = gets.split(' ').map(&:to_i)
    matrix = []
    start_pos = nil
    end_pos = nil
    (1..m_n[0]).each do |i|
      row = gets
      start_pos = [i - 1, row.index('M')] if (!row.index('M').nil?)
      end_pos = [i - 1, row.index('*')] if (!row.index('*').nil?)
      matrix.push(row.split(''))
    end
    num_magic = gets.to_i
    if ron_impressed?(matrix, start_pos, end_pos, num_magic) then puts('Impressed') else puts('Oops!') end
  end
end