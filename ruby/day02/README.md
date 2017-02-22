# day 02
## 1.File Access with code blcok

```ruby
def print(&block)
    block.call(&block)
end

print { File.open('object_70322900857600.txt', 'r') {|f|
    puts f.read} 
}
```

## 2.Hash to Array

```ruby
h = { "a" => 100, "b" => 200 }
h.values
# =>  [100, 200, 300]
```

## 3.iterate Hash

```ruby
h = { "a" => 100, "b" => 200 }
h.each {|k, v| puts "#{k}: #{v}" }
```