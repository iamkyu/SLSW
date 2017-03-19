musician(john, guitar).
musician(kim, piano).
musician(ahn, guitar).
musician(trump, trumpet).
musician(moon, base).
musician(lion, base).

genre(john, folk).
genre(kim, jazz).
genre(ahn, jazz).
genre(trump, electro).
genre(moon, classic).
genre(lion, folk).

find_musician(X, Y, Z) :- musician(Z, X), genre(Z, Y).
%% e.g. find_musician(guitar, jazz, What).

