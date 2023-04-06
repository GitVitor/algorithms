local
   fun {Flatten Xs}
      proc {FlattenD Xs ?S E}
         case Xs
         of nil then S=E
         [] X|Xr andthen {IsList X} then Y2 in
            {FlattenD X S Y2}
            {FlattenD Xr Y2 E}
         [] X|Xr then Y1 in
            S = X|Y1
            {FlattenD Xr Y1 E}
         end
         Ys
      in
         {FlattenD Xs Ys nill}
         Ys
      end
   end
in
   {Browse {Flatten [ 1 2 3 ]} }
end
  