% An ordered binary tree is a tree where one non leaf node contains two values: OValue and Value.
% OValue is any subset of Value, and the OValue is they key used to order the tree.
% OValue must be greather than any other OValue present in he nodes below the Value.
local
   fun {Lookup X T}
      case T
      of leaf then notfound
      [] tree(Y V T1 T2) andthen X < Y then
         {Lookup X T1}
      [] tree(Y V T1 T2) andthen X > Y then
         {Lookup X T2}
      [] tree(Y V T1 T2) andthen X == Y then
         found(V)
      end
   end

   fun {Insert X V T}
      case T
      of leaf then tree(X V leaf leaf)
      [] tree(Y W T1 T2) andthen X==Y then
         tree(X V T1 T2)
      [] tree(Y W T1 T2) andthen X<Y then
         tree(Y W {Insert X V T1} T2)
      [] tree(Y W T1 T2) andthen X>Y then
         tree(Y W T1 {Insert X V T2})
      end
   end

   fun {Delete X T}
      case T
      of leaf then leaf
      [] tree(Y W T1 T2) andthen X == Y then
         case {RemoveSmallest T2}
         of none then T1
         [] Yp#Wp#Tp then
            tree(Yp, Wp, T1, Tp)
         end
      [] tree(Y W T1 T2) andthen X < Y then
         tree(Y W { Delete X T1 } T2)
      [] tree(Y W T1 T2) andthen X > Y then
         tree(Y W T1 { Delete X T2 })
      end
   end

   fun {RemoveSmallest T}
      case T
      of leaf then none
      [] tree(Y W T1 T2) andthen
         case { RemoveSmallest T1 }
         of none then
            Y#W#T2
         [] Yp#Wp#Tp
            Yp#Wp#tree(Y W Tp T2)
         end
      end
   end
in
   {Browse X}
end