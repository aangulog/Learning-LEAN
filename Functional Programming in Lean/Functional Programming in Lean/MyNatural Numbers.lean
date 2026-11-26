-- First let us see a quick example of a sum datatype, cuz Why not:

inductive TrafficLight where
  | red
  | yellow
  | green

def light : TrafficLight := TrafficLight.red

#eval (light)
-- TrafficLight.red

def InfoAboutTrafficLight (light : TrafficLight) : String :=
  match light with
  | .red => "Stop"
  | .yellow => "Start engine"
  | .green => "GO!"

#eval InfoAboutTrafficLight light
-- "Stop"

-- Now we want to caonstruct the natural numbers by hand.

inductive N where
  | zero : N
  | succ (n : N) : N --An alternative way would be `succ : N -> N`
  deriving BEq, Repr -- This allows to compare objects with == and use #eval

-- Let's make a couple of numbers by hand
def one : N := .succ .zero
def two : N := .succ one
def three : N := .succ two
def four : N := .succ three
def five : N := .succ four

-- Let's also make a function that tells us which natural number this numbers of succ is, this will we used for the sake of checking
-- We will NOT use this inside any definition, since we want to MAKE the natural numbers.
def whatNumberIs (n : N) : Nat :=
  match n with
  | N.zero => 0
  | N.succ k => whatNumberIs k + 1


#eval two
-- N.succ (N.succ (N.zero))
#check two
-- two : N
#eval whatNumberIs two
-- 2

def isZero (n : N) : Bool :=
  match n with
  | .zero => true
  | .succ _ => false

#eval isZero one
--flase
#eval isZero N.zero
--true

def pred (n : N) : N :=
  match n with
  | .zero => N.zero
  | .succ k => k

#eval pred N.zero
-- N.zero
#eval pred three
-- N.succ (N.succ (N.zero))


#eval (pred three == two)
-- true

-- Let us make a recursive function that determines whenever a number is even or odd
def isEven (n : N) : Bool :=
  match n with
  | N.zero => true
  | N.succ k => not (isEven k)

#eval isEven four
-- true

def plus (n m : N) : N :=
  match m with
  | N.zero => n
  | N.succ k => N.succ (plus n k)

def minus (n m : N) : N :=
  match m with
  | N.zero => n
  | N.succ k => pred (minus n k)

def mult (n m : N) : N :=
  match m with
  | N.zero => N.zero
  | N.succ N.zero => n
  | N.succ k => plus (mult n k) n


#eval whatNumberIs (plus five four)
-- 9
#eval whatNumberIs (minus five two)
-- 3
#eval whatNumberIs (mult five three)
-- 15
#eval whatNumberIs (mult N.zero two)
-- 0
