# encoding: utf-8
require 'fileutils'
require_relative 'lib/translit'

puts "Положите нужный текст в файл source.txt"

if File.file?('source.txt')
  puts "Найден файл-источник"
else
  puts "Файл-источник не найден, создаем новый"
  FileUtils.touch 'source.txt'
  puts "Файл-источник создан, добавьте туда данные и перезапустите программу"
  exit
end

output = File.open( 'output.txt', 'w' )

source = File.open( 'source.txt', 'r' )

source.each_line do |line|
  tline = Translit.convert(line, :english)
  fline = tline.strip.gsub(/[^0-9a-z ]/i,'').gsub(' ','_').downcase
  output.puts fline
end

output.close

puts "Обработка закончена"

exit
