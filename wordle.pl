:-["wordlist.txt"].
delete(X,[X|T],T).
delete(X,[Y|T],[Y|R]):-delete(X,T,R).

choose([H|T],H).

append([],L,L).
append([H|T],L,[H|R]):-append(T,L,R).

subtract2(X,Y,Z):-subtract(Y,X,Z).

look_for_letter(_,[],[]).
look_for_letter(X,[H|T],R) :- look_for_letter(X,T,T1),
  (member(X,H) ->  R = [H|T1]; R = T1).

insert_end(H,[],[H]).
insert_end(H,[X|T],[X|R]):- insert_end(H,T,R).

letter_check(gray,A,B,W,W3):-look_for_letter(A,W,W2),subtract2(W2,W,W3).
letter_check(yellow,A,1,W,W3):-findall(D, (member(D, W), member(A, D), \+nth1(1, D, A)), W3).
letter_check(yellow,A,2,W,W3):-findall(D, (member(D, W), member(A, D), \+nth1(2, D, A)), W3).
letter_check(yellow,A,3,W,W3):-findall(D, (member(D, W), member(A, D), \+nth1(3, D, A)), W3).
letter_check(yellow,A,4,W,W3):-findall(D, (member(D, W), member(A, D), \+nth1(4, D, A)), W3).
letter_check(yellow,A,5,W,W3):-findall(D, (member(D, W), member(A, D), \+nth1(5, D, A)), W3).
letter_check(green,A,1,W,W3):-findall(D,(member(D,W),member(A,D),nth1(1,D,A)),W3).
letter_check(green,A,2,W,W3):-findall(D,(member(D,W),member(A,D),nth1(2,D,A)),W3).
letter_check(green,A,3,W,W3):-findall(D,(member(D,W),member(A,D),nth1(3,D,A)),W3).
letter_check(green,A,4,W,W3):-findall(D,(member(D,W),member(A,D),nth1(4,D,A)),W3).
letter_check(green,A,5,W,W3):-findall(D,(member(D,W),member(A,D),nth1(5,D,A)),W3).


entire_word(A,B,W,W6):-nth1(1,B,L11),nth1(1,A,L12),letter_check(L11,L12,1,W,W2),nth1(2,B,L21),nth1(2,A,L22),letter_check(L21,L22,2,W2,W3),nth1(3,B,L31),nth1(3,A,L32),letter_check(L31,L32,3,W3,W4),nth1(4,B,L41),nth1(4,A,L42),letter_check(L41,L42,4,W4,W5),nth1(5,B,L51),nth1(5,A,L52),letter_check(L51,L52,5,W5,W6).

wordle(W13):-word_list(W),nth1(1,W,A),delete(A,W,W2),write(A),nl,read(B),entire_word(A,B,W2,W3),choose(W3,A2),delete(A2,W3,W4),write(A2),nl,read(B2),entire_word(A2,B2,W4,W5),choose(W5,A3),delete(A3,W5,W6),write(A3),nl,read(B3),entire_word(A3,B3,W6,W7),choose(W7,A4),delete(A4,W7,W8),write(A4),nl,read(B4),entire_word(A4,B4,W8,W9),choose(W9,A5),delete(A5,W9,W10),write(A5),nl,read(B5),entire_word(A5,B5,W10,W11),choose(W11,A6),delete(A6,W11,W12),write(A6),nl,read(B6),entire_word(A6,B6,W12,W13).