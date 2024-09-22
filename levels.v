Require Import String def.

Open Scope string_scope.

(* Between HERE and THERE - A word game in Rocq *)

Goal ("here" <-- 1 --> "there").
  There.
Qed.

(*
  Carve a path of English words
    from the beginning to the end
      under a cost budget
 *)

Goal ("start" <-- 6 --> "goal").
  Next "star" 1.
  Next "soar" 1.
  Next "goal" 4.
  There.
Qed.

(* Basic move: pay the cost of
   (# different letters) ^ 2
   to cast a word into another
*)

Goal ("devil" <-- 16 --> "angel").
  Next "angel" 16.
  There.
Qed.

(* Prefix / Suffix : pay
   # added or removed letters
   to add/remove a prefix/suffix
*)

Goal ("impossible" <-- 2 --> "possible").
  Next "possible" 2.
  There.
Qed.

Goal ("undergraduate" <-- 5 --> "graduate").
  There.
Qed.

Goal ("here" <-- 1 --> "where").
  There.
Qed.

(* Anagram : Pay 1
   to reshuffle the letters
 *)

Goal ("listen" <-- 1 --> "silent").
  There.
Qed.

Goal ("save" <-- 1 --> "vase").
  There.
Qed.

(* Using non-words will fail
   Dictionary size: 20k
 *)

Goal ("human" <-- 13 --> "robot").
  Fail (Next "hubot" 9).
  Fail (Next "humat" 1).
  Next "roman" 4.
  Next "robot" 9.
  There.
Qed.

(* Now, your journey begins! *)

Goal ("north" <-- 4 --> "south").
Admitted.

Goal ("lead" <-- 8 --> "gold").
Admitted.

Goal ("war" <-- 8 --> "peace").
Admitted.

Goal ("idea" <-- 10 --> "paper").
Admitted.

Goal ("fire" <-- 10 --> "water").
Admitted.

Goal ("black" <-- 10 --> "white").
Admitted.

Goal ("dream" <-- 20 --> "reality").
Admitted.

Goal ("puzzle" <-- 20 --> "solution").
Admitted.

Goal ("reject" <-- 20 --> "accept").
Admitted.

Goal ("sword" <-- 20 --> "ploughshare").
Admitted.
