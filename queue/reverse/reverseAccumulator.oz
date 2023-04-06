local
   
   fun {Reverse Xs}
      proc {ReverseD Xs ?Y1 Y}
         case Xs
         of nil then Y1=Y
         [] X|Xr then { ReverseD Xr Y1 X|Y }
         end
      end
      Y1
   in
      {ReverseD Xs Y1 nil}
      Y1
   end
in
   {Browse { Reverse [1 2 3] }}
end