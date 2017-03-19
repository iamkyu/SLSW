# Prolog Language
- [http://www.gprolog.org/](http://www.gprolog.org/)
- 알랭 콜메르와 필리프 루세이가 1972년 개발.
- 선언형 언어 => 사실과 추론을 정의하고, 생각은 프롤로그가 함.

# Install

```shell
$ brew install swi-prolog
$ swipl
```



# Features

## 선언형 언어

- (1)사실을 선언하고 - (2)규칙을 정하고 - (3)질의

```prolog
%% 원자로 구성 된 사실을 구성.
likes(wallace, cheese).
likes(grommit, chesse).
likes(wendolene, sheep).

%% :- 기호의 우측 내용들은 부목표(sub goal)라 함.
%% \+(X=Y) 는 논리적 부정을 수행. X와 Y가 같지 않음을 뜻함.
friends(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).

%% friends(grommit, wallace). 실행 시 True 출력.
%% X와 Y가 같지 않고, X가 Z를 좋아하고, Y도 Z를 좋아한다면 둘이 친구라 할 수 있다.
```

