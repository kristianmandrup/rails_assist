require 'sugar-high/file'
pattern = Regexp.escape('::Application.initialize!')
puts pattern
file = File.new('sandbox/test.txt')
puts "BEFORE"
puts file.read
puts file.insert 'hello', :after => /\w+#{pattern}/

puts file.path

File.insert_into file.path, :after => /\w+#{pattern}/ do
  'hello'
end

puts "AFTER"
puts File.new('sandbox/test.txt').read