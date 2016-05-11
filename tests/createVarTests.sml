use "../main.sml";

val ht : (string, int) HashTable.hash_table = 
                           HashTable.mkTable (HashString.hashString, 
                           (fn (x : string, y : string) => x = y)) 
                           (42, Fail "not found")

val test_createVar1 = 
  let
    val tmp = createVar "var1" (Constant(5)) ht
  in
    ((eval (Variable("var1")) ht) = 5)
  end
