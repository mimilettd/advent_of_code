file = File.open(File.join(File.dirname(__FILE__), 'input.txt'))

sonar_data = file.readlines.map { |line| line.chomp.to_i }
measurements = { increased: 0, decreased: 0 }

sonar_data[0..-1].each_index do |i|
  next if i == 0
  sonar_data[i-1] < sonar_data[i] ? measurements[:increased] += 1 : measurements[:decreased] += 1
end

puts measurements
