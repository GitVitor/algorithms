functor
export
   newQueue:NewQueue
   check:Check
   insert:Insert
   delete:Delete
   isEmpty:IsEmpty
define
   fun {NewQueue} q(nil nil) end

   fun {Check Q}
      case Q
      of q(nil R) then N in
         q({Reverse nil R} nil)
      else
         Q
      end
   end

   fun {Insert Q X}
      case Q of q(F R) then {Check q(F X|R)} end
   end

   fun {Delete Q X}
      case Q
      of q(F R) then F1 in
         F=X|F1
         {Check q(F1 R)}
      end
   end

   fun {IsEmpty Q}
      case Q of q(F R) then F==nil end
   end
   
   
   fun {Reverse Rs Ys}
      case Ys
      of nil then Rs
      [] [X] then X|Rs
      [] X|Xr then
         {Reverse X|Rs Xr}
      end
   end
end
