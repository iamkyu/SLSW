# 파일안에서 특정 표현을 포함하고 있는 행(row)를 행번호와 함께 출력하는 프로그램 작성.
# e.g) grep-tool.rb serachtext filename.txt
File.open(ARGV[1],'r') do |f|
  line_no = 0
  while line = f.gets
    line_no += 1
    puts "#{line_no}: #{line}\n" if /#{ARGV[0]}/ =~ line
  end
end

