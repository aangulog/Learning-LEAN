import «Functional Programming in Lean»

def main : IO Unit :=
  IO.println s!"Hello, {hello}!"

def add1 (n : Nat) : Nat := n + 1
#eval add1 100 