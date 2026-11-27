structure RectangularPrism where
  height : Float
  widht : Float
  depth : Float

def volume (RectPrism : RectangularPrism) : Float :=
  RectPrism.height*RectPrism.widht*RectPrism.depth

structure Segment where


def a_prism : RectangularPrism := {height := 3, widht := 3, depth := 3}
#eval volume a_prism

def hello := "world"

def maximum (n : Int) (k : Int) : Int :=
  if n < k then
    k
  else
    n

def joinStringsWith (word1 word2 word3 : String) : String := (word2.append word1).append word3

def Str : Type := String
def aStr : Str := "This is a string"
def bStr : String := "This is another string"

structure PolySmthing (α : Type) where
  x : α
  y : α

def natOrigin : PolySmthing Nat := {x := Nat.zero, y:= Nat.zero}
def stringOrigin : PolySmthing String := {x := "0", y:= "0"}

#check (stringOrigin)
-- PolySmthing String
-- stringOrigin : PolySmthing String
#check (natOrigin)
-- PolySmthing Nat
-- natOrigin : PolySmthing Nat

inductive Sign where
  | pos
  | neg

def posOrNegThree (s : Sign) :
  match s with | Sign.pos => Nat | Sign.neg => Int :=
  match s with
    | Sign.pos => (3 : Nat)
    | Sign.neg => (-3 : Int)
