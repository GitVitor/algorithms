declare MergeModule in
local
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
in
   MergeModule = 'export'(
		    merge: Merge
		    )

end