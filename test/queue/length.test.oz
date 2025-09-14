declare
[LengthModule] = {Module.link ['../../queue/length/length.ozf']}
in
local
   Result
in
{Show {LengthModule.length [10 20 30 40 50]}}
end