file = File.open(File.join(File.dirname(__FILE__), 'input.txt'))

command_data = file.readlines.map(&:chomp)
course = { horizontal_position: 0, depth: 0 }

command_data[0..-1].each_index do |i|
  command = command_data[i].split(" ")
  direction, units = command[0], command[1].to_i

  case direction
  when "forward"
    course[:horizontal_position] += units
  when "down"
    course[:depth] += units
  when "up"
    course[:depth] -= units
  end
end

puts course[:horizontal_position]*course[:depth]
