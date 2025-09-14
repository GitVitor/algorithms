functor
export
   Nth
define
   fun {Nth Xs N}
      if N==1 then Xs.1
      elseif N>1 then {Nth Xs.2 N-1}
      end
   end
end