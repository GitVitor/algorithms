functor
export
   split:Split
define
   proc {Split Xs ?Ys ?Zs}
      case Xs
      of nil then Ys = nil Zs = nil
      [] [X] then
         Ys = [X]
         Zs = nil
      [] X1|X2|Xr then Yr Zr in
         Ys = X1|Yr
         Zs = X2|Zr
         {Split Xr Yr Zr}
      end
   end
end

local
   Xs
   Ys
in
   Xs = [ 1 2 ]
   { Browse Xs }
end
