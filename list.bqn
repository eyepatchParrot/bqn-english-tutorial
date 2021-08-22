#!/usr/local/bin/BQN
⟨ JoinTo, Exponential, Display, pi, Times, Couple, DividedBy, Reciprocal, _scan ⟩ ← ⟨
  ∾,      ⋆,           •Show,   π,  ×,     ≍,      ÷,         ÷,          ` ⟩
⟨ SquareRoot, Root, _swap, _self, _undo, _constant, _atop_, nul, infinity, Power ⟩ ← ⟨
  √,          √,    ˜,     ˜,     ⁼,     ˙,         ∘,      @,   ∞,        ⋆ ⟩
⟨ IdentityL, Identity, Left, Right, Max, Min, Floor, Ceiling ⟩ ← ⟨
  ⊣,         ⊢,        ⊣,    ⊢,     ⌈,   ⌊,   ⌊,     ⌈ ⟩
⟨ _fold, Solo, Reverse, Rotate, _each, Join, Range, _bind_, _after_, ⟩ ← ⟨
  ´,     ≍,    ⌽,       ⌽,      ¨,     ∾,    ↕,     ⊸,      ⟜,        ⟩
# Gets ListBegin ListEnd Strand StatementEnd Negative
# ←    ⟨         ⟩       ‿      ⋄            ¯


Display ⟨1, 2, 3⟩
Display ⟨1, 2, 3⟩ + 1
Display "Text!"
Display ⟨ pi, ∘, "element" ⋄ ⟨'l',1,5,'t'⟩ ⟩
Display ⟨
          "putting"         # This is a comment
          "a",              # That , wasn't needed
          "list"
                            # An extra newline won't hurt anything
          "on","multiple"   # Two elements here
          "lines"
        ⟩

Display ⟨2,+,-⟩
Display 2‿+‿-
Display 0‿1‿2
Display (0‿1)‿2
Display 0‿(1‿2)

Display Reciprocal ⟨2,3,4⟩
Display "APL" + 1
Display "31415" - '0'
Display 4‿3‿2‿1 Power 1‿2‿3‿4
Display 2 Times ⟨0‿2 ⋄ 1‿3‿5⟩
Display ⟨ 10, 20‿30 ⟩ + ⟨ 1‿2, 3 ⟩

Display Solo 4
Display 2 Couple 4

Display ⟨1,2,3⟩ JoinTo "abc"
Display 0 JoinTo ⟨1,2,3⟩
Display "plural" JoinTo 's'

Display Reverse "drawer"
Display 2 Rotate ⟨0,1,2,3,4⟩
Display ¯1 Rotate "bcdea"

Display Reverse _each "abcd"‿"ABCDEF"‿"01"
Display "string"‿"list"‿"array" JoinTo _each 's'
Display "abc" Couple _each Reverse "abc"

Display + _fold 2‿3‿4
Display Times _fold 2‿3‿4

Display - _fold 1‿2‿3‿4‿5
Display 1-2-3-4-5

Display JoinTo _fold ⟨ "con", "cat", "enat", "e" ⟩
Display Join ⟨ "con", "cat", "enat", "e" ⟩
Display Range 8

Display 8‿4‿2‿1 Couple _each 1‿0‿0‿1
Display + _fold 8‿4‿2‿1 Times 1‿0‿0‿1

Display 2 Power Range 4
Display Reverse 2 Power Range 4
Display (Reverse 2 Power Range 4) Times "1001"-'0'
Display + _fold (Reverse 2 Power Range 4) Times "1001"-'0'

Display '0' - _swap "01001110"‿"01100101"‿"01110010"‿"01100100"‿"00100001"
Display + _fold _each '0' - _swap "01001110"‿"01100101"‿"01110010"‿"01100100"‿"00100001"
# (Reverse 2 Power Range 8) Times '0' -˜ "01001110"‿"01100101"‿"01110010"‿"01100100"‿"00100001"
# Error: Left list has length 8, but right list has length 5

Display "ab" JoinTo _each ⟨ "cd", "ut" ⟩
Display "ab" _bind_ JoinTo _each ⟨ "cd", "ut" ⟩

Display nul + + _fold _each (Reverse 2 Power Range 8) _bind_ Times _each '0' - _swap "01001110"‿"01100101"‿"01110010"‿"01100100"‿"00100001"

Display + _fold (Reverse 2 Power Range 4) Times "1001"-'0'
Display + _after_ (+ _swap) _fold Reverse "1001"-'0'
