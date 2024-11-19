eat(shark, fish).  % shark eat fish,
eat(bear, fish).  
eat(fish, algae).	
eat(fox, rabbit).
eat(rabbit, grass).
eat(horse, grass).
eat(human, fish). 
eat(wolf, bear). 
eat(bird, worm).
eat(cat, bird).
eat(coyote, cat).

animal(shark).
animal(fish).
animal(bear).
animal(fox).
animal(rabbit).
animal(horse).
animal(human).
animal(wolf).
animal(bird).
animal(cat).
animal(coyote).
animal(worm).

plant(algae).
plant(grass).

predator(X, Y) :- 
    eat(X, Y), 
    animal(X), 
    animal(Y).

prey(X, Y) :-
	eat(Y, X),
	animal(Y),
	animal(X).
	
inTheFoodChain(X, Y) :-
    eat(Y, X).  % Base case
inTheFoodChain(X, Y) :-
    eat(Y, Z),  % Recursive case
    inTheFoodChain(X, Z).

commonPrey(X, Y, Z) :-
	inTheFoodChain(Z, X), inTheFoodChain(Z, Y).

compete(X, Y) :-
	animal(X),
	animal(Y),
	X \= Y,
	commonPrey(X, Y, Z),
	\+inTheFoodChain(Y, X).

count([], 0). % Base case: an empty list has 0 elements.
count([H|T], Count) :- % Recursive case: if the head is a list, count its elements recursively.
    is_list(H),
    count(H, CountH),
    count(T, CountT),
    Count is CountH + CountT.
count([H|T], Count) :- % Recursive case: if the head is not a list, count it as 1.
    \+ is_list(H),
    count(T, CountT),
    Count is 1 + CountT.

raise([], []). % Base case: empty list means empty output list
raise([H|T], [NewH|L2]) :- % Recursive case: process each number in the list.
    NewH is round(H + (H * (201 / 10000))),            % Apply the percentage increase to H.
    raise(T, L2).                        % Recursively process the tail.

insert(E, L1, L2) :- !.

delete(E, L1, L2) :- !.