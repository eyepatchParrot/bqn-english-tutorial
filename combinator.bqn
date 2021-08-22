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
# Gets ListBegin ListEnd Strand StatementEnd Negative nothing
# ←    ⟨         ⟩       ‿      ⋄            ¯        ·

Display _each ⟨
        Absolute _atop_ - 6

        14‿8 Absolute _atop_ - 19‿6
        14‿8 + _fold _atop_ Absolute _atop_ - 19‿6 # +´∘|∘-
        3 < 4
        4 > infinity
        infinity < nul
        nul < infinity

        'e' = "George Boole"
        + _fold 'e' = "George Boole"
        'e' + _fold _atop_ = "George Boole"  # With a combinator

        "abcd" Times _fold _atop_ = "abdd"

        "abcd" Match "abdd"
        "abc"‿"de" Match "abc"‿"de"

        2‿3‿4‿2 NotEquals 3‿3‿2‿2
        2‿3‿4‿2 NotMatch 3‿3‿2‿2

        Length "testing"
        Length ⟨⟩
        Length ⟨ pi, ∘, "element" ⋄ ⟨'l',1,5,'t'⟩ ⟩
        Length 4

        Rank 0.5
        Rank Range 3
        Rank 'a'
        Rank "a"

        Depth "dream"                  # An ordinary dream
        Depth "d"‿"r"‿"e"‿"a"‿"m"      # What if the letters were strings?
        Depth ⟨ "d"‿"r"‿"e"‿"a"‿"m" ⟩  # We have to go deeper

        (Length "string") = Length "sting"
        = _fold Length _each ⟨"string","sting"⟩
        "string" = _over_ Length "sting"

        "string" Couple _over_ Length "sting"
        Solo _over_ Length "sting"

        2 Power _after_ Negate 3
        2 Exponential _before_ - 3
        4 - _before_ Rotate " before"  # Rotate to the right by four
        4 Rotate _undo  " before"  # Okay this time Undo is better

        Not _before_ Times 0.5

        Range _before_ DividedBy 8
        Not _before_ Times Range _before_ DividedBy 8

        1 _bind_l_ + 5
        + _bind_r_ 1  5

        "const" _self 5
        nul "const" _self 6

        + _before_ 1  5

        Range _before_ DividedBy 8
        (Range 8) DividedBy 7
        Negate _bind_r_ 1 8
        Range _before_ DividedBy _after_ (- _bind_r_ 1) 8
        (Range DividedBy - _bind_r_ 1) 8

        nul + + _fold _each (Reverse 2 Power Range 8) _bind_l_ Times _each '0' -˜ "01000010"‿"01010001"‿"01001110"

        nul _bind_l_ + + _fold _each (Reverse 2 Power Range 8) _bind_l_ Times _each - _bind_r_ '0' "01000010"‿"01010001"‿"01001110"
        (nul _bind_l_ +) _atop_ (+ _fold _each) _atop_ ((Reverse 2 Power Range 8) _bind_l_ Times _each) _atop_ (- _bind_r_ '0') "01000010"‿"01010001"‿"01001110"

        nul _bind_l_ + _atop_ (+ _fold _atop_ ((Reverse 2 Power Range 8) _bind_l_ Times) _each) _atop_ (- _bind_r_ '0') "01000010"‿"01010001"‿"01001110"

        nul _bind_l_ + _atop_ (+ _fold _atop_ Times _bind_r_ (Reverse 2 Power Range 8) _each) _atop_ (- _bind_r_ '0') "01000010"‿"01010001"‿"01001110"


        (((((1 Times 10)+2) Times 10)+3) Times 10)+4

        # Make the combining step a function
        ((1 Times _bind_r_ 10 _before_ + 2) Times _bind_r_ 10 _before_ + 3) Times _bind_r_ 10 _before_ + 4 

        # Flip the combining function around
        4 + _after_  (10 _bind_l_ Times) 3 + _after_ (10 _bind_l_ Times) 2 + _after_ (10 _bind_l_ Times) 1

        # Now it's a BQN fold
        + _after_ (10 _bind_l_ Times) _fold 4‿3‿2‿1

        # To fold in reverse, reverse then fold
        + _after_ (10 _bind_l_ Times) _fold Reverse 1‿2‿3‿4

        + _fold _atop_ Times _after_ (Reverse 2 Power Range 8) "01010001"-'0'
        + _after_ (2 _bind_l_ Times) _fold _atop_ Reverse "01010001"-'0'

        nul _bind_l_ + _atop_ (+ _after_ (2 _bind_l_ Times) _fold _atop_ Reverse _each) _atop_ (- _bind_r_ '0')  "01000010"‿"01010001"‿"01001110"
        (nul + · + _after_ (2 _bind_l_ Times) _fold _atop_ Reverse _each - _bind_r_ '0') "01000010"‿"01010001"‿"01001110"
⟩
