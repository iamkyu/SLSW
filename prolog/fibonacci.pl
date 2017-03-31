fib(0,0).
fib(1,1).
fib(X,Y) :-
    X>1,
    X2 is X-2, fib(X2, Y2),
    X1 is X-1, fib(X1, Y1),
    Y is Y1+Y2.

%% e.g fib(5, What). 피보나치의  6번째 숫자(0번  인덱스 부터 시작)
