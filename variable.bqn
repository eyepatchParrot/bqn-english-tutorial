#!/usr/local/bin/BQN
⟨ JoinTo, Exponential, Display, pi, Times, Couple, DividedBy, Reciprocal, _scan ⟩ ← ⟨
  ∾,      ⋆,           •Show,   π,  ×,     ≍,      ÷,         ÷,          ` ⟩
⟨ SquareRoot, Root, _swap, _self, _undo, _constant, _atop_, nul, infinity, Power ⟩ ← ⟨
  √,          √,    ˜,     ˜,     ⁼,     ˙,         ∘,      @,   ∞,        ⋆ ⟩
⟨ IdentityL, Identity, Left, Right, Max, Min, Floor, Ceiling ⟩ ← ⟨
  ⊣,         ⊢,        ⊣,    ⊢,     ⌈,   ⌊,   ⌊,     ⌈ ⟩
⟨ _fold, Solo, Reverse, Rotate, _each, Join, Range, _bind_l_, _after_, ⟩ ← ⟨
  ´,     ≍,    ⌽,       ⌽,      ¨,     ∾,    ↕,     ⊸,        ⟜,        ⟩
⟨ _bind_r_, Not, _before_, Negate, _over_, Depth, Rank, Length, NotEquals, NotMatch, Absolute, Match,  ⟩ ← ⟨
  ⟜,        ¬,   ⊸,        -,      ○,      ≡,     =,    ≠,      ≠,         ≢,        |,        ≡,     ⟩
⟨ Drop, Take, _under_, Pick,  ⟩ ← ⟨
  ↓,    ↑,    ⌾,       ⊑,     ⟩
# Gets ListBegin ListEnd Strand StatementEnd Negative nothing Set
# ←    ⟨         ⟩       ‿      ⋄            ¯        ·       ↩

Display _each ⟨
        hey ← "Hi there"
        hey ∾ ", World!"

        pi2‿e‿ten ← ⟨ π, Exponential 1, 10 ⟩
        ten Times pi2
        three Couple ten - three ← 3

        # three ← 4 # ERROR Redefinition
        three ↩ 4
        three = 3   # Wait why did I do that
        3 = three ↩ 3
        # four ↩ 3    # ERROR four isn't defined yet

        three
        thrEe
        ThReE
        thr_EE
        __three
        _T_H_R_E_E_

        - Three
        # - _three # Error: Interpreting non-1-modifier as 1-modifier

        1_000_000

        Base2 ← + _after_ (2 _bind_l_ Times) _fold _atop_ Reverse
        Base2 1‿0‿1‿0
        Base2 "01010001"-'0'
        nul + Base2 _each '0' - _swap "01000010"‿"01010001"‿"01001110"

        Base2
        base2 ↩ 16   # Change it to a number
        Base2
        Base2 6

        "BQN"            # A list of characters
        - _bind_r_ 1 _under_ (2 _bind_l_ Pick) "BQN" # Wait why did I do that

        (Range 3) Couple _each "BQN"
        1 Pick "BQN"

        8 _under_ Pick "BQN"        # Change the first element to 8

        Range 7
        4 Take Range 7                              # The first four elements
        Reverse _under_ (4 _bind_l_ Take) Range 7   # And reverse them
        Reverse _under_ (¯4 _bind_l_ Take) Range 7  # Or reverse the last four

        2 _bind_l_ Reverse _under_ (1 _bind_l_ Pick)  "xyz"‿"ABCDE"‿"wxyz"‿"yz"
        2 _bind_l_ Reverse _under_ (2 _bind_l_ Drop)  "XYabcde"

        ¯3 Drop "abcdefgh"
        2 Take 4 Drop "abcdefgh"

        ('A'-'a')_bind_l_ + _under_ (2 Take 4 _bind_l_ Drop)  "abcdefgh"

        Identity "only"
        IdentityL "only"
        "left" Right "right"
        "left" Left "right"

        a ← 4            # First it's a number
        a ↩ 4‿5‿6        # Now it's a list!
        a ↩ a - 1

        a -↩ 1
        a JoinTo _swap ↩ 0‿1

        "abcd" Reverse _atop_ Left "wxyz"
        a Reverse _atop_ Left ↩ @ 

        - _bind_r_ 4 _under_ (¯2 _bind_l_ Take) a
        a                # It hasn't changed, of course

        a - _bind_r_ 4 _under_ (¯2 _bind_l_ Take) _atop_ Left ↩ nul
        - _bind_r_ 4 _under_ (¯2 _bind_l_ Take) _atop_ Left
⟩
