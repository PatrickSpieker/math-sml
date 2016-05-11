

datatype exp = Constant of int | Variable of string | Add of exp * exp 
               | Mult of exp * exp | Div of exp * exp | Sub of exp * exp
exception DivByZero

val ht : (string, int) HashTable.hash_table = 
                           HashTable.mkTable (HashString.hashString, 
                           (fn (x : string, y : string) => x = y)) 
                           (42, Fail "not found")

fun eval exp env =
  case exp of
       Constant x => x
     | Variable s => HashTable.lookup env s
     | Add(x, y) => (eval x env) + (eval y env)
     | Sub(x, y) => (eval x env) - (eval y env)
     | Mult(x, y) => (eval x env) * (eval y env)
     | Div(x, y) => if ((eval y env) = 0)
                    then (eval x env) div (eval y env)
                    else raise DivByZero               
     




