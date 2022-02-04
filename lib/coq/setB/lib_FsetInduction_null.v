(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require int.Int.

Axiom set : forall (a:Type), Type.
Parameter set_WhyType : forall (a:Type) {a_WT:WhyType a}, WhyType (set a).
Existing Instance set_WhyType.

Parameter mem: forall {a:Type} {a_WT:WhyType a}, a -> (set a) -> Prop.

(* Why3 assumption *)
Definition infix_eqeq {a:Type} {a_WT:WhyType a} (s1:set a) (s2:set a) : Prop :=
  forall (x:a), (mem x s1) <-> (mem x s2).

Axiom extensionality :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), (infix_eqeq s1 s2) -> (s1 = s2).

(* Why3 assumption *)
Definition subset {a:Type} {a_WT:WhyType a} (s1:set a) (s2:set a) : Prop :=
  forall (x:a), (mem x s1) -> mem x s2.

Axiom subset_refl :
  forall {a:Type} {a_WT:WhyType a}, forall (s:set a), subset s s.

Axiom subset_trans :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a) (s3:set a), (subset s1 s2) ->
  (subset s2 s3) -> subset s1 s3.

Parameter empty: forall {a:Type} {a_WT:WhyType a}, set a.

(* Why3 assumption *)
Definition is_empty {a:Type} {a_WT:WhyType a} (s:set a) : Prop :=
  forall (x:a), ~ (mem x s).

Axiom empty_def1 :
  forall {a:Type} {a_WT:WhyType a}, is_empty (empty : set a).

Parameter add: forall {a:Type} {a_WT:WhyType a}, a -> (set a) -> set a.

Axiom add_def1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (y:a), forall (s:set a),
  (mem x (add y s)) <-> ((x = y) \/ (mem x s)).

Parameter remove: forall {a:Type} {a_WT:WhyType a}, a -> (set a) -> set a.

Axiom remove_def1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (y:a) (s:set a),
  (mem x (remove y s)) <-> (~ (x = y) /\ (mem x s)).

Axiom subset_remove :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (s:set a), subset (remove x s) s.

Parameter union:
  forall {a:Type} {a_WT:WhyType a}, (set a) -> (set a) -> set a.

Axiom union_def1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a) (x:a),
  (mem x (union s1 s2)) <-> ((mem x s1) \/ (mem x s2)).

Parameter inter:
  forall {a:Type} {a_WT:WhyType a}, (set a) -> (set a) -> set a.

Axiom inter_def1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a) (x:a),
  (mem x (inter s1 s2)) <-> ((mem x s1) /\ (mem x s2)).

Parameter diff:
  forall {a:Type} {a_WT:WhyType a}, (set a) -> (set a) -> set a.

Axiom diff_def1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a) (x:a),
  (mem x (diff s1 s2)) <-> ((mem x s1) /\ ~ (mem x s2)).

Axiom subset_diff :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), subset (diff s1 s2) s1.

Parameter choose: forall {a:Type} {a_WT:WhyType a}, (set a) -> a.

Axiom choose_def :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), ~ (is_empty s) -> mem (choose s) s.

Parameter cardinal: forall {a:Type} {a_WT:WhyType a}, (set a) -> Z.

Axiom cardinal_nonneg :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), (0%Z <= (cardinal s))%Z.

Axiom cardinal_empty :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), ((cardinal s) = 0%Z) <-> (is_empty s).

Axiom cardinal_add :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a), forall (s:set a), ~ (mem x s) ->
  ((cardinal (add x s)) = (1%Z + (cardinal s))%Z).

Axiom cardinal_remove :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a), forall (s:set a), (mem x s) ->
  ((cardinal s) = (1%Z + (cardinal (remove x s)))%Z).

Axiom cardinal_subset :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), (subset s1 s2) ->
  ((cardinal s1) <= (cardinal s2))%Z.

Axiom cardinal1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), ((cardinal s) = 1%Z) -> forall (x:a), (mem x s) ->
  (x = (choose s)).

Axiom t : Type.
Parameter t_WhyType : WhyType t.
Existing Instance t_WhyType.

Parameter p: (set t) -> Prop.

Axiom Induction :
  (forall (s:set t), (is_empty s) -> p s) ->
  (forall (s:set t), (p s) -> forall (t1:t), ~ (mem t1 s) -> p (add t1 s)) ->
  forall (s:set t), p s.

