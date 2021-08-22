#!/usr/local/bin/BQN
⟨ JoinTo, Exponential, Display, pi, Times, Couple, DividedBy, Reciprocal ⟩ ← ⟨
  ∾,      ⋆,           •Show,   π,  ×,     ≍,      ÷,         ÷ ⟩
⟨ SquareRoot, Root, _swap, _self, _undo, _constant, _atop_, nul, infinity, Power ⟩ ← ⟨
  √,          √,    ˜,     ˜,     ⁼,     ˙,         ∘,      @,   ∞,        ⋆ ⟩

Display 2 + 3
Display 6-   5
Display - 1.5

Display 2 Times π
Display 9 DividedBy 2
Display Reciprocal infinity

Display 2 Power 3
Display 3 Power 2
Display Exponential 1   # e isn't built in but you can get it this way
Display Exponential 2.3

Display SquareRoot 2
Display 3 Root 27

Display 2 Times 3 - 5
Display (2 Times 3) - 5
Display (4 DividedBy 3) Times pi Times 2 Power 3

Display SquareRoot 3 + 2 Times SquareRoot 2
Display 1 + SquareRoot 2

Display (SquareRoot 3 + 2 Times SquareRoot 2) - 1 + SquareRoot 2

Display 'c'
Display 'c' + 1
Display 'h' - 'a'

Display 'K' + 'a'-'A'
Display '4' - '0'

Display '*' - nul
Display nul + 97


Display 2 -_swap 'd'  # Subtract from

Display +_self 3      # Add to itself

Display Times _self 4
Display 2 Power _swap 4


Display SquareRoot _undo 4

Display Power _undo 10
Display 2 Power _undo 32    # Log base 2
Display 2 Power 2 Power _undo 32
Display 10 Power _undo 1e4  # Log base 10 of a number in scientific notation

Display 2 3 _constant 4

Display 3 Times _self _atop_ + 4  # Square of 3 plus 4
Display - _atop_ (Times _self) 5  # Negative square of 5
