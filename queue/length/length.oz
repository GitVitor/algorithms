functor
export
   Length
define
   fun {LengthIterative Xs N}
      case Xs
      of nil then N
      [] _|Xr then
         {LengthIterative Xr N+1}
      end
   end
   fun {Length Xs}
      {LengthIterative Xs 0}
   end
end