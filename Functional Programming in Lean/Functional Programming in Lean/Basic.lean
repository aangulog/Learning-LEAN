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
