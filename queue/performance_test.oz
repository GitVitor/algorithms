declare
PerformanceTestQueue
[QueueModule] = {Module.link ['./main.ozf']}
[QueueWorstCaseModule] = {Module.link ['./queueWorstCase.ozf']}
in
local
   Q1
   Q2
   Q3
   Q4
   Q5
   Q6
   Q7
in
   Q1={QueueModule.newQueue}
   Q2={QueueModule.insert Q1 peter}
   Q3={QueueModule.insert Q2 paul}
   local X in Q4={QueueModule.delete Q3 X} {Browse X} end
   Q5={QueueModule.insert Q4 mary}
   local X in Q6={QueueModule.delete Q5 X} {Browse X} end
   local X in Q7={QueueModule.delete Q6 X} {Browse X} end
end
