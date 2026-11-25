# Intro
This notes are being made by me (aangulog) in order to have a quick look-up to things I'll learn through the book: https://lean-lang.org/functional_programming_in_lean

Some important thing to take into account are:
- `elan` manages the Lean compiler,m
- `lake` builds Lean packages and the dependancies,
- Lean type checks and compiles individual Lean files.

Similar to $\LaTeX$ we can use backslash `\` to write certain characters.

```Lean
\rightarrow 
\alpha  
\beta
-- Why is not working??
```

## Evaluating expressions

In lean the `#eval` word reports the result of a calculation

```Lean
#eval 1+3
-- 4
#eval String.append "Hello " "World"
-- "Hello World"
```

We can note that functions do not use parenthesis, only when it is needed for nested functions or arguments

```Lean
#eval String.append "great " (String.append "oak " "tree")
NestedStringAppends
-- "Nested String Appends"
```

One important thing to take into account is that Lean is not mutable, thus, two expressions leading the same value will be equal.
```Lean

#eval String.append "A" (String.append "B" "C") == String.append (String.append "A" "B") "C"
-- true
```

### Using Conditionals

Lean is an _expression-oriented functional language_, thus, there is no conditionals statements, only conditionals expressions. In other words: in Lean the `if`, `else`, `then`, words evaluate to a **value**, not to an action or code block directly.

```Lean
def sign (x : Int) : Int :=
  if x > 0 then 1 else -1
```

## Type (shi)

Lean has a type system that allows _strong_ types: where the function has been specified what to recive and what to return exactly, or _flexible_ ones, where depending on the input the function knows what output to give.  
Every expression in Lean must have a type before being evaluated. 

```Lean
-- In this example, Lean is able to infer the type. so it is unnecery
#eval (1+2 : Nat)
-- 3
```

Let us see what happens when we specify in other situation

```Lean
-- In the following example, this expression yields 0, not -1. CRAZY
#eval 1-2
-- 0
```

This is from the fact that `1-2` is returning a Nat type, in Lean there is not underflow or overflow for this type, so it handles it just by giving the value of `0` to everything that is less than `1`. 
To correct this we need to specify the type Int in the operation

```Lean
#eval (1-2 : Int)
-- -1
``` 

- Use `#check` insted of `#eval` to see the type insted of the result of the evaluation.

```Lean
#eval 1-2
-- 0
#check 1-2
-- 1 - 2 : Nat
```

## Functions and Definitions

We have already usted definitions and functions at the beginning, if we are familiarized with other programming languages, this is only an extrapolation of suchs.

```Lean
-- Simple enough for Lean to infer the type
def hello := "Hello"
-- To make the type explicit use:
def hello : String := "Hello"
-- Now we can use it
#eval hello
-- "Hello"
```

An important note is that `def`(used as above) is not a zero-argument function (unlike python), here is a name refering DIRECTLY to a value. Let us now see how to define a function. There are multiple ways to do it, the most simple one is the following

```Lean
def add1 (n : Nat) : Nat := n+1

#eval add1 7
-- 8
```

We can see that the same keyword is used, arguments go inside parenthesis. Let us see a more complicated example:

```Lean
def maximum (n : Nat) (k : Nat) : Nat := if n<k then k else 

--we can also define it in a more readable way:
def maximum (n : Nat) (k : Nat) : Nat :=
    if n<k then
        k
    else
        n
```

- When a function is called, Lean first replaces the values in the arguments and then calls the function

Let us see how `#check` works for definitions, given the previous examples

Suppouse we have a function `F` that accepts $n$ arguments $x_1 :X_1,x_2: X_2, \dots,x_n: X_n$ and returns a type $Y$.  then

```Lean
#check F
-- F(x_1 : X_1) (x_2 : X_2) \dots (x_n : X_n) : Y

-- We can also type the function in parenthesis to treated as an ordinary expression, thus
#check (F)
-- F : X_1 -> X_2 -> \cdots -> X_n -> Y 
```

We can use the keyword `example`to verify  that an expression has a particular type

```Lean
example : Nat := 0
example : X_1 -> X_2 -> \cdots -> X_n -> Y := F
```

In theory, ALL functions accept only one argument. Multiple argument functions in reality return functions that take one argument at a time, in a cascade way. For example,  the function `maximum` takes an integer and return another function that takes one integers and returns another integers.
This way we have that the type of `maximum`(strictly speaking) is not `Int -> Int -> Int` but `Int -> (Int -> Int)`.

