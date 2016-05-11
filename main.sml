datatype exp = Constant of int | Variable of string | Add of exp * exp 
               | Mult of exp * exp | Div of exp * exp | Sub of exp * exp

exception DivByZero


fun eval exp env =
  case exp of
       Constant x => x
     | Variable s => (HashTable.lookup env s)
     | Add(x, y) => (eval x env) + (eval y env)
     | Sub(x, y) => (eval x env) - (eval y env)
     | Mult(x, y) => (eval x env) * (eval y env)
     | Div(x, y) => if ((eval y env) = 0)
                    then (eval x env) div (eval y env)
                    else raise DivByZero               


fun createVar (name : string) (exp : exp)  
              (env : ((string, int) HashTable.hash_table)) =
    (HashTable.insert env (name, eval exp env)) 

