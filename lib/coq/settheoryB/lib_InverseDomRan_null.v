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

Parameter inverse:
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  ((a* b)%type -> bool) -> (b* a)%type -> bool.

Axiom Inverse_def :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (r:(a* b)%type -> bool), forall (x:a) (y:b),
  (set.Set.mem (y, x) (inverse r)) <-> (set.Set.mem (x, y) r).

Parameter dom:
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  ((a* b)%type -> bool) -> a -> bool.

Axiom dom_def :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (r:(a* b)%type -> bool), forall (x:a),
  (set.Set.mem x (dom r)) <-> exists y:b, set.Set.mem (x, y) r.

Parameter ran:
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  ((a* b)%type -> bool) -> b -> bool.

Axiom ran_def :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (r:(a* b)%type -> bool), forall (y:b),
  (set.Set.mem y (ran r)) <-> exists x:a, set.Set.mem (x, y) r.

