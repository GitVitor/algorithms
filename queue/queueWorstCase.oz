functor
export
   newQueue:NewQueue
   insert:Insert
   delete:Delete
define
   fun {NewQueue}
      X
   in
      q(0 X X)
   end

   fun {Insert Q X}
      case Q of q(N S E) then
         E1
      in
         E=X|E1
         q(N+1 S E1)
      end
   end

   fun {Delete Q X}
      case Q of q(N S E) then
         S1
      in
         S = X|S1
         q(N-1 S1 E)
      end
   end
end