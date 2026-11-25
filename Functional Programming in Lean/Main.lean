import «Functional Programming in Lean»

def main : IO Unit :=
  IO.println s!"Hello, {hello}!"



#eval maximum (-2) (-1)

#check maximum

def F (a : Nat) (b c : Int) : Nat := ((a : Int)*(b)*(c)).natAbs
#check (F)

example : Nat → Int → Int → Nat := F
example : Nat := 1

#eval joinStringsWith ", " "one" "and another"

#check joinStringsWith

#eval aStr
