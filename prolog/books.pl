book(siddhartha, hesse).
book(demian, hesse).
book(narcissus_and_goldmund, hesse).
book(anna_karenina, tolstoy).
book(war_and_peace, tolstoy).

%% e.g. author(What, hesse).
author(X, Y) :- book(X, Y).
