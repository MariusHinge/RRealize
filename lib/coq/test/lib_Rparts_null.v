(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require HighOrd.
Require set.Set.
Require map.Map.
Require map.Const.

Axiom rreal : Type.
Parameter rreal_WhyType : WhyType rreal.
Existing Instance rreal_WhyType.

Parameter setrreal: rreal -> bool.

Parameter rzero: rreal.

Parameter rone: rreal.

Parameter rtwo: rreal.

Axiom oneIsNotZero : ~ (rone = rzero).

Axiom twoIsNotOne : ~ (rtwo = rone).

Axiom twoIsNotZero : ~ (rtwo = rzero).

(* Why3 assumption *)
Definition rel (a:Type) (b:Type) := (a* b)%type -> bool.

Parameter power:
  forall {a:Type} {a_WT:WhyType a}, (a -> bool) -> (a -> bool) -> bool.

Axiom mem_power :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a -> bool) (y:a -> bool),
  (set.Set.mem x (power y)) <-> (set.Set.subset x y).

Parameter leq: rreal -> rreal -> Prop.

Parameter lt: rreal -> rreal -> Prop.

Parameter gt: rreal -> rreal -> Prop.

Axiom Refl : forall (x:rreal), leq x x.

Axiom Trans :
  forall (x:rreal) (y:rreal) (z:rreal), (leq x y) -> (leq y z) -> leq x z.

Axiom Antisymm :
  forall (x:rreal) (y:rreal), (leq x y) -> (leq y x) -> (x = y).

Axiom Total : forall (x:rreal) (y:rreal), (leq x y) \/ (leq y x).

Axiom zeroLtOne : lt rzero rone.

Axiom oneLtTwo : lt rone rtwo.

Parameter rrealStar: rreal -> bool.

Parameter rrealPlus: rreal -> bool.

Parameter rrealMinus: rreal -> bool.

Parameter rrealPlusStar: rreal -> bool.

Parameter rrealMinusStar: rreal -> bool.

(* Why3 assumption *)
Definition notRzero (x:rreal) : Prop := ~ (x = rzero).

