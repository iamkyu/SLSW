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