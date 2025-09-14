declare
MergeSortTest
[MergeSortModule] = {Module.link ['../../queue/mergeSort/mergeSort.ozf']}
[SplitModule] = {Module.link ['../../queue/split/split.ozf']}
[MergeModule] = {Module.link ['../../queue/merge/merge.ozf']}
in
local
   Result
   Ys
   Xs
in
   {Show 'begining'}
   {Show {MergeSortModule.mergeSort [1 3 4 2] }}
end