(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require HighOrd.
Require bool.Bool.
Require map.Map.

(* Why3 assumption *)
Definition set (a:Type) := a -> bool.

(* Why3 assumption *)
Definition mem {a:Type} {a_WT:WhyType a} (x:a) (s:a -> bool) : Prop :=
  ((s x) = true).

(* Why3 assumption *)
Definition empty {a:Type} {a_WT:WhyType a} : a -> bool :=
  fun (us:a) => false.

(* Why3 assumption *)
Definition is_empty {a:Type} {a_WT:WhyType a} (s:a -> bool) : Prop :=
  forall (x:a), ~ (mem x s).

Parameter union:
  forall {a:Type} {a_WT:WhyType a}, (a -> bool) -> (a -> bool) -> a -> bool.

Axiom Union_def :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:a -> bool) (s2:a -> bool), forall (x:a),
  (((union s1 s2) x) = (Init.Datatypes.orb (s1 x) (s2 x))).

Parameter inter:
  forall {a:Type} {a_WT:WhyType a}, (a -> bool) -> (a -> bool) -> a -> bool.

Axiom Inter_def :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:a -> bool) (s2:a -> bool), forall (x:a),
  (((inter s1 s2) x) = (Init.Datatypes.andb (s1 x) (s2 x))).

Parameter diff:
  forall {a:Type} {a_WT:WhyType a}, (a -> bool) -> (a -> bool) -> a -> bool.

Axiom Diff_def1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:a -> bool) (s2:a -> bool), forall (x:a),
  (((diff s1 s2) x) =
   (Init.Datatypes.andb (s1 x) (Init.Datatypes.negb (s2 x)))).

(* Why3 assumption *)
Definition equal {a:Type} {a_WT:WhyType a} (s1:a -> bool) (s2:a -> bool) :
    Prop :=
  forall (x:a), ((s1 x) = (s2 x)).

Axiom Equal_is_eq :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:a -> bool) (s2:a -> bool), (equal s1 s2) -> (s1 = s2).

(* Why3 assumption *)
Definition subset {a:Type} {a_WT:WhyType a} (s1:a -> bool) (s2:a -> bool) :
    Prop :=
  forall (x:a), (mem x s1) -> mem x s2.

Parameter complement:
  forall {a:Type} {a_WT:WhyType a}, (a -> bool) -> a -> bool.

Axiom Complement_def :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:a -> bool), forall (x:a),
  (((complement s) x) = (Init.Datatypes.negb (s x))).

