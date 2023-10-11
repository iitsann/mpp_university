def cut(cake)
  height = cake.size
  width = cake[0].size

  #noinspection RubyResolve
  raisin_count = cake.flatten.count(RAISIN_CHAR)

  cuts = (1..height).flat_map { |h|
    (1..width).flat_map { |w|
      (0..height-h).flat_map { |y|
        (0..width-w).select { |x|
          count_raisins(cake, x, y, w, h) == 1
        }.map { |x| [x, y, w, h] }
      }
    }
  }

  cuts.sort_by! { |cut| -cut[2] }

  result = []
  covered = Array.new(height) { Array.new(width, false) }
  cuts.each do |cut|
    x, y, w, h = cut
    unless covered[y..y + h - 1].any? { |row| row[x..x + w - 1].any? }
      result << slice_cake(cake, x, y, w, h)
      covered[y..y + h - 1].each { |row| row[x..x + w - 1] = [true] * w }
      break if result.size == raisin_count
    end
  end

  result
end

def count_raisins(cake, x, y, w, h)
  #noinspection RubyResolve
  cake[y..y+h-1].map { |row| row[x..x+w-1].count(RAISIN_CHAR) }.sum
end

def slice_cake(cake, x, y, w, h)
  cake[y..y+h-1].map { |row| row[x..x+w-1] }
end

cake = %w[.0...... ......0. ....0... ..0.....]

result = cut(cake)
result.each_with_index { |piece, index| puts "#{index + 1}) #{piece.join(", ")} , " }
