# Ruby

- [https://www.ruby-lang.org](https://www.ruby-lang.org)
- 마츠모토 유키히로가 1993년에 만듬.
- 스크립트 언어에 속하는 인터프리트되고, 객체지향적이며, 동적 타이핑 시스템을 사용하는 언어.



# Install

macOS의 경우 xcode를 설치했다면 루비가 이미 포함 됨.

```shell
$ ruby -version
$ irb
```

Interactive Ruby의 약자인 irb를 통해 루비 코드를 작성하고 바로 실행해보는 것이 가능.



# Hello, World

```ruby
puts "Hello, World"
puts "Hello, World\n" * 10
greeting = "Hello"
puts "#{greeting}, World"

for i in 1..10
  puts "Hello, World"
end
```



# Features

## 모든 것이 객체

```ruby
4.class # => Fixnum
(4.0).class # => Float
(0..2).class # => Range
true.class # => TrueClass
4.methods # => [:%, :&, :*, :+, :-, :/, :<, :>, :^, :|, :~, :-@, :**, :<=>, :<<, :>>, :<=, :>=, :==, :===, :[], :inspect, :size, :succ, :to_s, :to_f, :div, :divmod, :fdiv, :modulo, :abs, :magnitude, :zero?, :odd?, :even?, :bit_length, :to_int, :to_i, :next, :upto, :chr, :ord, :integer?, :floor, :ceil, :round, :truncate, :downto, :times, :pred, :to_r, :numerator, :denominator, :rationalize, :gcd, :lcm, :gcdlcm, :+@, :eql?, :singleton_method_added, :coerce, :i, :remainder, :real?, :nonzero?, :step, :positive?, :negative?, :quo, :arg, :rectangular, :rect, :polar, :real, :imaginary, :imag, :abs2, :angle, :phase, :conjugate, :conj, :to_c, :between?, :instance_of?, :public_send, :instance_variable_get, :instance_variable_set, :instance_variable_defined?, :remove_instance_variable, :private_methods, :kind_of?, :instance_variables, :tap, :is_a?, :extend, :define_singleton_method, :to_enum, :enum_for, :=~, :!~, :respond_to?, :freeze, :display, :send, :object_id, :method, :public_method, :singleton_method, :nil?, :hash, :class, :singleton_class, :clone, :dup, :itself, :taint, :tainted?, :untaint, :untrust, :trust, :untrusted?, :methods, :protected_methods, :frozen?, :public_methods, :singleton_methods, :!, :!=, :__send__, :equal?, :instance_eval, :instance_exec, :__id__]
```

개별적인 숫자를 포함한 거의 모든 것이 객체.

```ruby
4.class # => Fixnum
4.class.superclass # => Integer
4.class.superclass.superclass # => Numeric
4.class.superclass.superclass.superclass # => Object
4.class.superclass.superclass.superclass.superclass # => nil
```

- 객체는 클래스로부터 도출.
- 최상위 클래스는 `Object`. 클래스는 모듈을 상속, 모듈은 오브젝트를 상속.
- 위 예제에서 4는 Fixnum의 인스턴스, Fixnum 은 클래스의 인스턴스.



## 덕(Duck) 타이핑

> 만약 어떤 새가 오리처럼 걷고, 헤엄치고, 꽥꽥거리는 소리를 낸다면 나는 그 새를 오리라고 부를 것이다.

```ruby
def add_them_up
  4 + 'four'
end

add_them_up # Type 에러 발생
```

- 루비는 엄격한 의미에서 강한 타이핑 시스템을 사용하는 언어는 아니지만 대체적으로 강한 타이핑 시스템을 사용하는 언어처럼 동작(51페이지. 무슨 말일까..).
- 어떤 코드를 실제로 실행하기 전까지는 형 검사를 수행하지 않음(동적 타이핑).

```ruby
i = 0
a = ['100', 100.0]
while i<2
  puts a[i].to_i
  i=i+1
end
```

`'100'` 은 String 클래스이고, `(100.0)` 은 Float 클래스이지만 두 요소 모두 `to_i` 라는 메서드를 가졌기 때문에 정상적으로 동작. 객체가 어떤 타입인지 보다는 무엇을 할 수 있는지를 판단.



## 믹스인(Mixin)

```ruby
module ToFile
  def filename
    "sample.txt"
  end
  def to_f
    File.open(filename, 'w') {|f| f.write(to_s)}
  end
end

class Person
  include ToFile
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  def to_s
    name
  end
end

Person.new('matz').to_f
```

- Person 클래스는 ToFile 모듈을 포함하는 것만으로 `to_f` 메서드를 사용.
- ToFile 모듈 안에서 `to_s` 메서드가 사용되고 있지만, 이는 Person 클래스에서 구현 됨.



## 함수정의

```ruby
def tell_the_truth
  true
end
```

클래스 같은 것을 정의할 때 코드 블록에 중괄호를 넣는 대신, 선언 뒤에 end 키워드를 사용.



## 배열

```ruby
animals =['lion', 'tiger', 'bear']
puts animals
# => lion tiger bear

animals[1] # => tiger
animals[-1] # => bear
animals[0..1] # => ["lion", "tiger"]
```

- 정의되지 않은 배열 요소에 접근하면 `nil` 을 반환.
- 배열은 다른 자료형을 포함하는 것도 가능.



## 코드블럭

```ruby
def call_block(&block)
  block.call
end

def pass_block(&block)
  call_block(&block)
end

pass_block {puts "Hello, Block"}

# => Hello, Block
```

어떤 함수나 메서드에 매개 변수로 코드 블럭(이름 없는 함수)를 전달하는 것이 가능.



## 오픈클래스

```ruby
"".blank? # => NoMethod 에러
 class String
   def blank?
     self.size == 0
   end
 end
  
"".blank? # => true
```

이미 정의되어 있는 클래스에도 메서드를 추가 하거나 수정할 수 있음.



## method_missing

```ruby
def method_missing(id, *arguments)
  puts "Method #{id} was called, but not found. It has " +
       "these arguments: #{arguments.join(", ")}"
end
```

`method_missing` 을 오버라이드 하여 특정 메소드가 존재하지 않을 때 작동할 코드를 정의할 수도 있다.



## 메타프로그래밍

TODO: 74페이지 다시 보기