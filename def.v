Require Import String Lia dict func.

Definition IsWord (s : string) : Prop := isWord s = true.

Inductive Step : string -> string -> nat -> Prop :=
| CHEAT : forall s s' l, Step s s' l
| Diff : forall s s', Step s s' (char_diff_sqr s s')
| Perm : forall s s', is_anagram s s' = true -> Step s s' 1
| PreSuf : forall s s', presuf s s' = true -> Step s s' (presuf_cost s s').

Inductive Path : string -> string -> nat -> Prop :=
| Win : forall s l, Path s s l
| Move :  forall s s' t l l' d, Step s s' d -> IsWord s' -> Path s' t l' -> d <= l -> l' = l - d -> Path s t l.

Ltac Next s' d :=
  match goal with
  | |- (Path ?s ?t ?l) =>
      refine (Move s s' t l _ d _ (eq_refl _) _ (ltac:(lia)) (ltac:(auto)));
      try assumption;
      auto;
      simpl;
      try (apply Diff; reflexivity);
      try (apply Perm; reflexivity);
      try (apply PreSuf; reflexivity)
  end.

Ltac There :=
  try (
      match goal with
      | |- (Path ?s ?t ?l) =>
          Next t l;
          apply Win
      end);
  match goal with
  | |- (Path ?s ?s ?l) =>
      apply Win
  end.

Notation "( x <-- l --> y )" := (Path x y l) (at level 70).

