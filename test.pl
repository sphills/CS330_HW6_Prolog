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
    eat(Y, X).  % Base case: Y directly eats X.
inTheFoodChain(X, Y) :-
    eat(Y, Z),  % Recursive case: Y eats Z...
    inTheFoodChain(X, Z).  % ...and X is in the food chain of Z.
