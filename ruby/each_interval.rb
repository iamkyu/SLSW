# each 만을 사용해서 한번에 네개씩 출력하고, each_slice 를 사용해서 동일한 작업
queue = []
(1..16).each do |v|
    queue.push(v) # or queue << v
    if v%4 == 0
        puts queue.to_s
        queue = []
    end
end

puts 
# with each_slice
(1..16).each_slice(4) { |v|
    puts v.inspect
}
