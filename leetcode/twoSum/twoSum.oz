functor
import
   LengthModule at '../../queue/length/length.ozf'
   NthModule at '../../queue/nth/nth.ozf'
   System(show:Show)
export
   TwoSum
define
   fun {TwoSum Xs Target}
      local
         MaxLength = {LengthModule.length Xs}
      in
         {TwoSumInner Xs Target 1 2 MaxLength}
      end
   end

   fun {TwoSumInner Xs Target J Y MaxLength}
      local
         JResult = {NthModule.nth Xs J}
         YResult = {NthModule.nth Xs Y}
      in
         if (JResult + YResult == Target)
         then [J Y]
         elseif (Y == MaxLength) andthen (J == MaxLength) then
            [nil nil]
         elseif (Y < MaxLength) then
            {TwoSumInner Xs Target J Y+1 MaxLength}
         else
            {TwoSumInner Xs Target J+1 1 MaxLength}
         end
      end
   end
end
