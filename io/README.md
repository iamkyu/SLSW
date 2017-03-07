# Io Language
- [http://iolanguage.org](http://iolanguage.org)
- 스티브 디코트가 2002년 인터프리터 동작 방식을 이해하기 위해 취미로 만들기 시작한 언어.
- 프로토타입 프로그래밍 모델 (모든 객체가 다른 객체의 클론)

# Install

```shell
$ brew install io
$ io
```

brew를 통해  io 를 설치. 설치 후에는  커맨드라인 상에서 `io` 커맨드를 통해 인터렉티브 모드로 io 코드를 작성하고 실행 가능.



# Hello, World

```io
"Hello, World" print
Hello, World==> Hello, World
```

print 라는 메시지를 "Hello, World" 라는 문자열에 전달한 것. 수신자는 왼쪽에 나타나고 메시지는 오른쪽에 나타남. 메시지를 객체에 전달하는 것. 그것이 전부임.



# Features

## 객체

Object 가 최상위 객체이며 `clone` 이라는 메시지를 보내면 새로운 객체가 리턴 됨.

```Io
Vehicle := Object clone
```

여기서 Vehicle 은 객체를 생성하기 위한 템플릿 즉, 클래스가 아니라 Object 라는 객체에서 비롯 된 또 다른 객체일 뿐.

```io
Vehicle description = "Something to take you far away"
==> Slot decription not found 예외

Vehicle description := "Something to take you far away"

Vehicle slotNames
==> list(type, description)

Vehicle type
==> Vehicle
```

- 다른 객체를 복제해 객체를 생성.
- 객체는 슬롯의 컬렉션.
- 메시지를 보내서 슬롯에 담긴 값을 확인.
- 해당 이름을 가진 슬롯이 없으면 객체의 부모(즉, 프로토타입)에 메시지를 전달.



## 메서드

```io
Vehicle drive := method("Vroom~" println)

Vehicle slotNames
==> list(type, drive, description)

Vehicle drive
==> Vroom~
```

메서드 역시 다른 모든 객체와 마찬가지로 하나의 객체.

## 연산자

```io
OperatorTable
```

위와 같은 명령어로 정의되어 있는 연산자 목록을 조회할 수 있음.

```io
OperatorTable addOperator("xor", 11)
true xor := method(bool, if(bool, false, true))
false xor := method(bool, if(bool, true, false))
```

직접 연산자를 정의해서 추가하는 것이 가능.

## 메시지

Io 에서는 문법과 인수 사이에 존재하는 쉼표를 제외하면 거의 모든 것을 메시지로 취급.

- 메시지는 세 개의 컴포넌트를 가짐: 발신자(sender), 목표(target), 인수(arguments)

```io
myif := method(
    (call sender doMessage(call message argAt(0))) ifTrue( 
    call sender doMessage(call message argAt(1))) ifFalse( 
    call sender doMessage(call message argAt(2)))
)

myif(1 == 2, write("true\n"), write("false\n"))
```

Io 에서 `call` 메서드를 통해 모든 메시지에 대한 메타 정보에 접근.

## 리플렉션

### 객체 리플렉션

```io
Animal := Object clone
Animal speack := method("ambiguous animal noise" println)

Duck := Animal clone
Duck speack := method("quack" println)
Duck walk := method("waddle" println)

disco := Duck clone
disco ancestors
```

Io 에서 객체 리플렉션은 객체와 그러한 객체에 담긴 슬롯을 다루는 것을 의미함. 위 예에서 `disco` 의 프로토타입은 `Duck` 이지만 `Animal` 에도 접근 가능.

- 하나의 객체는 하나 이상의 프로토타입을 가질 수 있음.

