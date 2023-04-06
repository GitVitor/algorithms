local
   fun {IterReverse Rs Ys} 
      case Ys 
      of nil then Rs
      [] Y|Yr then { IterReverse Y|Rs Yr }
      end
   end
in
   {Browse 'vitor'}
   {Browse {IterReverse nil [1 2 3]} }
end