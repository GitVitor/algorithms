declare
[NthModule] = {Module.link ['../../queue/nth/nth.ozf']}
in
local
   Result
in
   {Show 'begining'}
   {Show {NthModule.nth [10 5 3 2] 2}}
end