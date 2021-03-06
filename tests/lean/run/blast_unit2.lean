variables {A₁ A₂ A₃ A₄ B₁ B₂ B₃ B₄ : Prop}

meta def blast : tactic unit :=
using_smt $ smt_tactic.intros >> return ()

constants (a b c d e : nat)
constants (p : nat → Prop)
constants (q : nat → nat → Prop)
constants (f : nat → nat)

lemma lemma1  : a = d → b = e → p b → (p a → (¬ p e) ∧ p c) → ¬ p d := by blast
lemma lemma2a : ¬ p b → (p d → p b ∧ p c) → d = e → e = a → ¬ p a := by blast
lemma lemma2b : ¬ p (f b) → (p (f a) → p (f d) ∧ p (f c)) → b = d → ¬ p (f a) := by blast
lemma lemma3  : p (f (f b)) → (p (f a) → p (f c) ∧ (¬ p (f (f (f (f b)))))) → b = f b → ¬ p (f a) := by blast
lemma lemma4a : b = f b → ¬ p (f (f b)) → (p a → q c c ∧ p (f (f (f (f (f b)))))) → ¬ p a := by blast
lemma lemma4b : b = f b → ¬ p (f (f b)) → (p a → q c c ∧ q e c ∧ q d e ∧ p (f (f (f (f (f b))))) ∧ q e d) → ¬ p a :=
by blast
lemma lemma5 : p b → (p (f a) → (¬ p b) ∧ p e ∧ p c) → ¬ p (f a) := by blast
lemma lemma6 : ¬ (q b a) → d = a → (p a → p e ∧ (q b d) ∧ p c) → ¬ p a := by blast
