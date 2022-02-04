(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
(* Require Import BuiltIn.
Require BuiltIn.
Require HighOrd.
Require set.Set.
Require map.Map.
Require map.Const. *)

Require Import Reals.

(* Axiom rreal : Type. *)
Definition rreal := R.

(* Parameter rreal_WhyType : WhyType rreal. *)
(* Existing Instance rreal_WhyType. *)

Parameter setrreal: rreal -> bool.

Definition rzero:= 0%R.
Definition rone:= 1%R.
Definition rtwo:= 2%R.

Lemma oneIsNotZero : ~ (rone = rzero).
Proof. exact R1_neq_R0. Qed.

Lemma twoIsNotOne : ~ (rtwo = rone).
Proof. apply (not_1_INR 2). auto. Qed.

Lemma twoIsNotZero : ~ (rtwo = rzero).
Proof. apply (not_0_INR 2). auto. Qed.

(* Why3 assumption *)
Definition rel (a:Type) (b:Type) := (a* b)%type -> bool.

Parameter power:
  forall {a:Type} {a_WT:WhyType a}, (a -> bool) -> (a -> bool) -> bool.

Axiom mem_power :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a -> bool) (y:a -> bool),
  (set.Set.mem x (power y)) <-> (set.Set.subset x y).

(* Parameter leq: (rreal* rreal)%type -> bool. *)
Definition leq (z:rreal*rreal) : Prop:= 
  match z with 
    | (x,y) => (x<=y)%R
  end.
Definition lt (z:rreal*rreal) : Prop:= 
  match z with 
    | (x,y) => (x<y)%R
  end.
Definition geq (z:rreal*rreal) : Prop:= 
  match z with 
    | (x,y) => (x>y)%R
  end.
Definition gt (z:rreal*rreal) : Prop:= 
  match z with 
    | (x,y) => (x>=y)%R
  end.

Lemma zeroLtOne : set.Set.mem (rzero, rone) lt.
Proof. exact Rlt_0_1. Qed.

Lemma oneLtTwo : set.Set.mem (rone, rtwo) lt.
Proof. apply (lt_1_INR 2). apply (le_n 2). Qed.

Parameter rrealStar: rreal -> bool.
Parameter rrealPlus: rreal -> bool.
Parameter rrealMinus: rreal -> bool.
Parameter rrealPlusStar: rreal -> bool.
Parameter rrealMinusStar: rreal -> bool.

(* Why3 assumption *)
Definition notRzero : Prop := forall (x:rreal), ~ (x = rzero).

(* Why3 assumption *)
Definition isPos : Prop := forall (x:rreal), set.Set.mem (rzero, x) leq.

(* Why3 assumption *)
Definition isNeg : Prop := forall (x:rreal), set.Set.mem (x, rzero) leq.

(* Why3 assumption *)
Definition isStrictPos : Prop := forall (x:rreal), set.Set.mem (rzero, x) lt.

(* Why3 assumption *)
Definition isStrictNeg : Prop := forall (x:rreal), set.Set.mem (x, rzero) lt.

Parameter infix_plmngt:
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b}, (a -> bool) ->
  (b -> bool) -> ((a* b)%type -> bool) -> bool.

Axiom mem_function :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (f:(a* b)%type -> bool) (s:a -> bool) (t:b -> bool),
  (set.Set.mem f (infix_plmngt s t)) <->
  ((forall (x:a) (y:b), (set.Set.mem (x, y) f) ->
    (set.Set.mem x s) /\ (set.Set.mem y t)) /\
   forall (x:a) (y1:b) (y2:b),
   ((set.Set.mem (x, y1) f) /\ (set.Set.mem (x, y2) f)) -> (y1 = y2)).

Axiom domain_function :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (f:(a* b)%type -> bool) (s:a -> bool) (t:b -> bool) (x:a) (y:b),
  (set.Set.mem f (infix_plmngt s t)) -> (set.Set.mem (x, y) f) ->
  set.Set.mem x s.

Axiom range_function :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (f:(a* b)%type -> bool) (s:a -> bool) (t:b -> bool) (x:a) (y:b),
  (set.Set.mem f (infix_plmngt s t)) -> (set.Set.mem (x, y) f) ->
  set.Set.mem y t.

Axiom function_extend_range :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (f:(a* b)%type -> bool) (s:a -> bool) (t:b -> bool) (u:b -> bool),
  (set.Set.subset t u) -> (set.Set.mem f (infix_plmngt s t)) ->
  set.Set.mem f (infix_plmngt s u).

Axiom function_reduce_range :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (f:(a* b)%type -> bool) (s:a -> bool) (t:b -> bool) (u:b -> bool),
  (set.Set.subset u t) -> (set.Set.mem f (infix_plmngt s t)) ->
  (forall (x:a) (y:b), (set.Set.mem (x, y) f) -> set.Set.mem y u) ->
  set.Set.mem f (infix_plmngt s u).

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

Parameter infix_mnmngt:
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b}, (a -> bool) ->
  (b -> bool) -> ((a* b)%type -> bool) -> bool.

Axiom mem_total_functions :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (f:(a* b)%type -> bool) (s:a -> bool) (t:b -> bool),
  (set.Set.mem f (infix_mnmngt s t)) <->
  ((set.Set.mem f (infix_plmngt s t)) /\ (set.Set.infix_eqeq (dom f) s)).

Axiom total_function_is_function :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (f:(a* b)%type -> bool) (s:a -> bool) (t:b -> bool),
  (set.Set.mem f (infix_mnmngt s t)) -> set.Set.mem f (infix_plmngt s t).

Parameter apply:
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  ((a* b)%type -> bool) -> a -> b.

Axiom apply_def1 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (f:(a* b)%type -> bool) (s:a -> bool) (t:b -> bool) (a1:a),
  ((set.Set.mem a1 s) /\ (set.Set.mem f (infix_mnmngt s t))) ->
  set.Set.mem (a1, apply f a1) f.

Axiom apply_def2 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (f:(a* b)%type -> bool) (s:a -> bool) (t:b -> bool) (a1:a) (b1:b),
  ((set.Set.mem f (infix_mnmngt s t)) /\ (set.Set.mem (a1, b1) f)) ->
  (b1 = (apply f a1)).

Axiom injection :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (f:(a* b)%type -> bool) (s:a -> bool) (t:b -> bool),
  forall (x:a) (y:a), (set.Set.mem f (infix_mnmngt s t)) ->
  (set.Set.mem (inverse f) (infix_plmngt t s)) -> (set.Set.mem x s) ->
  (set.Set.mem y s) -> ((apply f x) = (apply f y)) -> (x = y).

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

Definition plus (z:rreal*rreal) : rreal:= 
  match z with 
    | (x,y) => (x+y)%R
  end.

Definition times1 (z:rreal*rreal) : rreal:= 
  match z with
    | (x,y) => (x*y)%R
  end.

Definition uminus (z:rreal) : rreal:= (-z)%R.

Definition inverse1 (z:rreal) : rreal:= (/z)%R.

Definition minus (z:rreal*rreal) : rreal:= 
  match z with
    | (x,y) => (x-y)%R
  end.

Definition divide (z:rreal*rreal) : rreal:= 
  match z with
    | (x,y) => (x/y)%R
  end.

Definition abs (z:rreal) : rreal:= (Rabs z).

Definition sqrt (z:rreal) : rreal:= (sqrt z).

Lemma minusDef :
  forall (x:rreal) (y:rreal), ((minus (x, y)) = (plus (x, uminus y))).
Proof. intros; exact eq_refl. Qed.

Lemma inverseDef :
  forall (x:rreal), ~ (x = rzero) -> ((times1 (x, inverse1 x)) = rone).
Proof. intros; apply Rinv_r; auto. Qed.

Lemma divideDef :
  forall (x:rreal) (y:rreal), ~ (y = rzero) ->
  ((divide (x, y)) = (times1 (x, inverse1 y))).
Proof. intros; exact eq_refl. Qed.

Lemma absPos : forall (x:rreal), set.Set.mem (rzero, abs x) leq.
Proof. intros; apply Rabs_pos. Admitted.

Lemma absZero : forall (x:rreal), (x = rzero) -> ((abs x) = rzero).
Proof. intros x H. rewrite H; exact Rabs_R0. Qed.

Lemma absDef :
  forall (x:rreal),
  ((set.Set.mem (x, rzero) lt) -> ((abs x) = (uminus x))) /\
  ((set.Set.mem (rzero, x) lt) -> ((abs x) = x)).
Proof.
intros x; split.
+ apply Rabs_left.
+ apply Rabs_right.
Admitted.

Lemma absTriangular :
  forall (x:rreal) (y:rreal),
  set.Set.mem (abs (plus (x, y)), plus (abs x, abs y)) leq.
Proof.
intros x y.
apply Rabs_triang.
Admitted.

Lemma absMinus : forall (x:rreal), ((abs (uminus x)) = (abs x)).
Proof. intros x; apply Rabs_Ropp. Qed.

Lemma absMult :
  forall (x:rreal) (y:rreal),
  ((abs (times1 (x, y))) = (times1 (abs x, abs y))).
Proof. intros x y; apply Rabs_mult. Qed.

Lemma sqrtDef :
  forall (x:rreal), (set.Set.mem x rrealPlus) ->
  ((times1 (sqrt x, sqrt x)) = x).
Proof. Admitted.

Lemma twoDef : (rtwo = (plus (rone, rone))).
Proof. apply eq_refl. Qed.

Lemma rzeroLtrtwo : set.Set.mem (rzero, rtwo) lt.
Proof. Admitted.

Lemma uminusOrderInversion :
  forall (x:rreal), (set.Set.mem (rzero, x) leq) ->
  set.Set.mem (uminus x, rzero) leq.
Proof. Admitted.

Lemma uminusInvolutive :
  forall (x:rreal), (set.Set.mem x setrreal) -> ((uminus (uminus x)) = x).
Proof. Admitted.

Lemma uminusNeutrality : ((uminus rzero) = rzero).
Proof. exact Ropp_0. Qed.
