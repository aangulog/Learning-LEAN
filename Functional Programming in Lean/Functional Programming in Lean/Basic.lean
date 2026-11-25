def hello := "world"

def maximum (n : Int) (k : Int) : Int :=
  if n < k then
    k
  else
    n

def joinStringsWith (word1 word2 word3 : String) : String := (word2.append word1).append word3

def volume (height width depth : Nat) : Nat := height*width*depth

def Str : Type := String
def aStr : Str := "This is a string"
def bStr : String := "This is another string"
