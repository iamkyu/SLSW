# day 01

macOS의 경우 xcode를 설치할 때, 루비가 설치된다고 한다.

```shell
$ ruby -version
$ irb
```

Interactive Ruby의 약자인 irb를 통해 루비 코드를 작성하고 바로 실행해보는 것이 가능.



## 1."Hello, World" 문자 출력하기

```ruby
puts "Hello, World"
```



## 2."Hello, Ruby" 문자열에서 "Ruby" 단어의 인덱스 찾기

```ruby
"Hello, Ruby".index("Ruby")
# => 7
```

- 인덱스는 0부터 시작하며, 찾지 못하면 `nil` 을 반환한다. 
  - 루비에서의 nil은 절대적으로 아무것도 없는(absolutely-positively-nothing) 값이라고 한다.
- 대소문자를 구분하지 않고 찾기 위해, 문자열을 대문자 또는 소문자로 변경하였다.

```ruby
"Hello, Ruby".index("ruby")
# => nil
"Hello, Ruby".downcase.index("ruby")
# => 7
"Hello, Ruby".upcase.index("RUBY")
# => 7
```



## 3.자신의 이름을 열 번 출력하라

```ruby
puts "iamkyu\n" * 10
```

문자열에 곱하기 연산을 하면 해당 문자열을 곱하는 수만큼 반복한다. 전통적인 방법대로 반복문을 활용할 수 도 있다.

```ruby
for i in 1..10
  puts "iamkyu"
end
```



## 4.숫자 1부터 10까지를 대상으로 "This is sentence number 1" 이라는 문자열을 출력하라

문제를 명확히 이해하지 못했다. 같은 문장에 숫자 인덱스가 변하면서 출력하도록 하라는 말인가?

```ruby
for i in 1..10
  puts "This is sentence number #{i}"
end
```

루비에서는 `#{}` 문법을 통해 문자열 중간에 변수 값을 삽입할 수 있다.



## 5.파일에서  읽은 루비 프로그램을 실행하라.

이 역시 문제를 명확히 이해하지 못했다. 이전 문제들은 모두 `irb` 상에서 인터랙티브하게 실행했는데 ruby 파일을 만들고 그걸 실행해보라는 의미인가?

```shell
$ vim hello.rb

#!/usr/bin/env ruby

puts "Hello, World!"

$ ruby hello.rb
```

