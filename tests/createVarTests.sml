use "../main.sml";

val ht : (string, int) HashTable.hash_table = 
                           HashTable.mkTable (HashString.hashString, 
                           (fn (x : string, y : string) => x = y)) 
                           (42, Fail "not found")

val test_createVar_Constant = 
  let
    val tmp = createVar "var1" (Constant 5) ht
  in
    ((eval (Variable("var1")) ht) = 5)
  end

val test_createVar_Variable = 
  let
    val tmp1 = createVar "var1" (Constant 5) ht
    val tmp2 = createVar "var2" (Variable "var1") ht
  in
    ((eval (Variable("var2")) ht) = 5)
  end
