declare
[LCSModule] = {Module.link ['../../leetcode/longestConsecutiveSequence/longestConsecutiveSequence.ozf']}
in
local
   Result
in
   {Show {LCSModule.lCS [1 2 2 1 3 3 3 4 1 10 11 13 12 14]}} %5
   {Show {LCSModule.lCS [10 1 1 2 40 3 11 4 12 41 13 42 14 15]}} %5
   {Show {LCSModule.lCS [1 2 3 11 12 12 13 14 14 15]}} %5
end


