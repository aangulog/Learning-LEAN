def π : Float := 3.14159265359

structure Cartesian where
  x : Float
  y : Float

structure Polar where
  r : Float
  θ : Float

structure LineSegment where
  p1 : Cartesian
  p2 : Cartesian

def origin : Cartesian := {x:=0.0, y:=0.0}
def i_unit : Cartesian := {x:=0.0 , y:= 1.0}
def one : Cartesian := {x:=1.0,y:=0.0}

def addPoints (p1 p2 : Cartesian) : Cartesian :=
  {x := p1.x + p2.x, y:= p1.x +p2.x}
def distance (p1 p2 : Cartesian) : Float:=
  Float.sqrt (((p2.x - p1.x) ^ 2.0) + ((p2.y - p1.y) ^ 2.0))

def radius (p: Cartesian) : Float :=
  distance origin p
def angle (p : Cartesian) : Float :=
  if p.x > 0 ∧ p.y ≥ 0 then
    Float.atan (p.y / p.x)
  else if p.x < 0 then
    Float.atan (p.y / p.x) + π
  else if p.x > 0 ∧ p.y < 0 then
    Float.atan (p.y / p.x) + 2 * π
  else if p.y > 0 then
    π / 2
  else if p.y < 0 then
    3 * π / 2
  else
    0.0

def CartesianToPolar (p : Cartesian) : Polar :=
  {r := radius p, θ:=angle p}
def PolarToCartesian (p : Polar) : Cartesian :=
  {x := p.r*Float.cos p.θ, y:= p.r*Float.sin p.θ}

def LineSegment.lenghtOfLineSegment (line : LineSegment) : Float :=
  distance line.p1 line.p2

def ImaginaryPartWithMatch (p : Cartesian) : Float :=
  match p with
  | {x:=_, y:= img_part} => img_part
def ImaginaryPartWithoutMatch (p : Cartesian) : Float :=
  p.y

#eval ({p1:=one, p2:=i_unit} : LineSegment).lenghtOfLineSegment
#eval LineSegment.lenghtOfLineSegment ({p1:=one, p2:=i_unit} : LineSegment)

#eval ImaginaryPartWithMatch ({x := 1, y:= 2} : Cartesian)
-- 2.0
#eval ImaginaryPartWithoutMatch ({x := 1, y:= 2} : Cartesian)
-- 2.0
