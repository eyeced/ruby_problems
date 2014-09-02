class InCircle
  def self.in_circle?(c, p, r)
    # compute distance from center and if it is less than the radius then it lies inside the circle
    distance(c, p) <= r
  end

  def self.distance(p1, p2)
    (((p1[0] - p2[0]) ** 2) + ((p1[1] - p2[1]) ** 2)) ** 0.5
  end

  def self.point_in_circle(s)
    a = s.split('; ')
    center = a[0][(a[0].index('(') + 1)..(a[0].index(')') - 1)].split(', ').map { |x| x.to_f }
    point = a[2][(a[2].index('(') + 1)..(a[2].index(')') - 1)].split(', ').map { |x| x.to_f }
    radius = a[1].split(': ')[1].to_f
    puts(in_circle?(center, point, radius))
  end

  puts(point_in_circle('Center: (5.05, -11); Radius: 21.2; Point: (-31, -45)'))

end