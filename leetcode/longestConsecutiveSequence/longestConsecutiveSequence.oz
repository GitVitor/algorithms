functor
export
   LCS
define
   fun {HasValue Xs X}
      case Xs
      of nil then false
      [] Y|Xr then
         if (X == Y) then
            true
         else
            {HasValue Xr X}
         end
      end
   end
   
   fun {UniqueValues Xs Ys}
      case Xs
      of nil then Ys
      [] X|Xr then
         if ({HasValue Ys X}) then
            {UniqueValues Xr Ys}
         else
            {UniqueValues Xr X|Ys}
         end
      end
   end

   
   fun {GetLongestInner Xs Y L}
      if(Xs == nil) then
         L
      else
         if({HasValue Xs Y+L}) then
            {GetLongestInner Xs Y L+1}
         else
            L
         end
      end
   end

   fun {GetLongest Xs Ys L}
      case Xs
      of nil then
         L
      [] X|Xr andthen ({HasValue Ys X-1} == false) then
         local
            L2 = {GetLongestInner Ys X L}
            L3 = {GetLongest Xr Ys L}
         in
            {Max L3 L2}
         end
      [] _|Xr then
         {Max L {GetLongest Xr Ys L}}
      end
   end
  
   fun {LCS Xs}
      local
         D = {UniqueValues Xs nil}
      in
         {GetLongest D D 0}
      end
   end
end