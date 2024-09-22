Require Import String Strings.Ascii.

Fixpoint char_diff (s1 s2 : string) :=
  match s1, s2 with
  | EmptyString, EmptyString => 0
  | EmptyString, _ => length s2
  | _, EmptyString => length s1
  | String c1 s1', String c2 s2' =>
      if Ascii.eqb c1 c2 then char_diff s1' s2' else 1 + (char_diff s1' s2')
  end.                                                    
                                                    
Definition char_diff_sqr s1 s2 :=
  let x := char_diff s1 s2 in
  x * x.

Fixpoint elim_char s c :=
  match s with
  | EmptyString => None
  | String c' s' =>
      if (Ascii.eqb c c') then
        Some s'
      else
        match (elim_char s' c) with
        | None => None
        | Some s'' => Some (String c' s'')
        end
  end.

Fixpoint is_anagram (s1 s2 : string) :=
  match s1 with
  | EmptyString =>
      match s2 with
      | EmptyString => true
      | _ => false
      end
  | String c s1' =>
      let res := elim_char s2 c in
      match res with
      | None => false
      | Some s2' => is_anagram s1' s2'
      end
  end.

Fixpoint is_suffix (s1 s2 : string) :=
  if (String.eqb s1 s2) then
    true
  else match s1 with
       | EmptyString => false
       | String _ s1' => is_suffix s1' s2
       end.

Fixpoint is_prefix (s1 s2 : string) :=
  match s1 with
  | EmptyString => true
  | String c1 s1' =>
      match s2 with
      | EmptyString => false
      | String c2 s2' =>
          if (Ascii.eqb c1 c2) then
            is_prefix s1' s2'
          else
            false
      end
  end.

Definition presuf s1 s2 :=
  orb 
    (orb (is_prefix s1 s2) (is_prefix s2 s1))
    (orb (is_suffix s1 s2) (is_suffix s2 s1)).

Definition presuf_cost s1 s2 :=
  if (is_prefix s1 s2) then
    length s2 - length s1
  else if (is_prefix s2 s1) then
         length s1 - length s2
       else if (is_suffix s1 s2) then
              length s1 - length s2
            else if (is_suffix s2 s1) then
                   length s2 - length s1
                 else
                   0.
              
                            
