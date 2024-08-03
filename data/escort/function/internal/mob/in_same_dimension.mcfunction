execute if entity @s[predicate=escort:in_overworld] if entity @e[tag=escort.ghost, predicate=escort:in_overworld] run return 1
execute if entity @s[predicate=escort:in_nether] if entity @e[tag=escort.ghost, predicate=escort:in_nether] run return 1
execute if entity @s[predicate=escort:in_end] if entity @e[tag=escort.ghost, predicate=escort:in_end] run return 1
return 0
