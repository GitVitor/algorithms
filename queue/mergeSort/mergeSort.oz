functor
import
   MergeModule at '../merge/merge.ozf'
   SplitModule at '../split/split.ozf'
export
   MergeSort
define
   fun {MergeSort Xs}
      case Xs
      of nil then nil
      [] [X] then [X]
      else Ys Zs in
         {SplitModule.split Xs Ys Zs}
         {MergeModule.merge {MergeSort Ys} {MergeSort Zs}}
      end
   end
end

