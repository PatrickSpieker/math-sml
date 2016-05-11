use "../main.sml";

val ht : (string, int) HashTable.hash_table = 
                           HashTable.mkTable (HashString.hashString, 
                           (fn (x : string, y : string) => x = y)) 
                           (42, Fail "not found")

val test_Set_Constant = 
    let
      val temp = (eval (Set("hi", Constant 5)) ht)
    in
      (eval (Variable "hi") ht) = 5
    end

