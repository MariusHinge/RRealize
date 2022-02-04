(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require HighOrd.
Require set.Set.
Require map.Map.
Require map.Const.

(* Why3 assumption *)
Definition rel (a:Type) (b:Type) := (a* b)%type -> bool.

Parameter power:
  forall {a:Type} {a_WT:WhyType a}, (a -> bool) -> (a -> bool) -> bool.

Axiom mem_power :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a -> bool) (y:a -> bool),
  (set.Set.mem x (power y)) <-> (set.Set.subset x y).

Parameter times:
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b}, (a -> bool) ->
  (b -> bool) -> (a* b)%type -> bool.

Axiom times_def :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a -> bool) (b1:b -> bool) (x:a) (y:b),
  (set.Set.mem (x, y) (times a1 b1)) <->
  ((set.Set.mem x a1) /\ (set.Set.mem y b1)).

(* Why3 assumption *)
Definition relations {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b}
    (u:a -> bool) (v:b -> bool) : ((a* b)%type -> bool) -> bool :=
  power (times u v).

Axiom break_mem_in_add :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (c:(a* b)%type) (s:(a* b)%type -> bool) (x:a) (y:b),
  (set.Set.mem c (map.Map.set s (x, y) true)) <->
  ((c = (x, y)) \/ (set.Set.mem c s)).

Axiom break_power_times :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (r:(a* b)%type -> bool) (u:a -> bool) (v:b -> bool),
  (set.Set.mem r (power (times u v))) <-> (set.Set.subset r (times u v)).

Axiom subset_of_times :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (r:(a* b)%type -> bool) (u:a -> bool) (v:b -> bool),
  (set.Set.subset r (times u v)) <->
  forall (x:a) (y:b), (set.Set.mem (x, y) r) ->
  (set.Set.mem x u) /\ (set.Set.mem y v).
