functor
export
   merge:Merge
define
   fun {Merge Xs Ys}
      case Xs#Ys of nil#Y then Y
      [] X#nil then X
      [] (X|Xr)#(Y|Yr) then
         if X < Y then
            X | {Merge Xr Ys}
         else
            Y | {Merge Xs Yr}
         end
      end
   end
end
