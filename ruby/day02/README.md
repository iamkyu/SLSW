# day 02
## 1. 코드 블록을 이용하거나 혹은 이용하지 않으면서 파일에 접근

```ruby
def print(&block)
    block.call(&block)
end

print { File.open('object_70322900857600.txt', 'r') {|f|
    puts f.read} 
}
```

## 2. 해시를 배열로 / 배열을 해시로

```ruby
h = { "a" => 100, "b" => 200 }
h.values
# =>  [100, 200, 300]
```

## 3. 해시를 순차적으로 방문

```ruby
h = { "a" => 100, "b" => 200 }
h.each {|k, v| puts "#{k}: #{v}" }
```
## A. 16개의 수를 담고 있는 배열을 `each` 만 사용해서 한번에 네 개 씩 출력. 

```ruby
queue = []
(1..16).each do |v|
    queue.push(v) # or queue << v
    if v%4 == 0
        puts queue.to_s
        queue = []
    end
end

# with each_slice
puts 
(1..16).each_slice(4) { |v|
    puts v.inspect
}
```

## B. initializer가 해시 내부에 포함된 구조를 받아들이도록 구현

```ruby

```

### C. grep 도구 작성

```ruby

```

