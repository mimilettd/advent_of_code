file = File.open(File.join(File.dirname(__FILE__), 'input.txt'))

sonar_data = file.readlines.map { |line| line.chomp.to_i }
measurements = { increased: 0, decreased: 0, same: 0 }

sonar_data[0..-1].each_index do |i|
  next if i == 0
  if sonar_data[i-1..i+1].sum < sonar_data[i..i+2].sum
    measurements[:increased] += 1
  elsif sonar_data[i-1..i+1].sum > sonar_data[i..i+2].sum
    measurements[:decreased] += 1
  else
    measurements[:same] += 1
  end
end

puts measurements
