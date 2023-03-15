functor
export
   appendD:AppendD
define
   fun {AppendD D1 D2}
      S1 S2 E1 E2
      S1#E1=D1
      S2#E2=D2
   in
      E1=S2
      S1#E2
   end
end
