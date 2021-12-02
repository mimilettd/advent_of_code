file = File.open(File.join(File.dirname(__FILE__), 'input.txt'))

command_data = file.readlines.map(&:chomp)
course = { horizontal_position: 0, depth: 0, aim: 0 }

command_data.each do |command|
  command = command.split(" ")
  direction, units = command[0], command[1].to_i

  case direction
  when "forward"
    course[:horizontal_position] += units
    course[:depth] += (course[:aim] * units)
  when "down"
    course[:aim] += units
  when "up"
    course[:aim] -= units
  end
end

puts course[:horizontal_position] * course[:depth]
