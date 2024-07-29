function escort:stop

title @a times 10 40 10
title @a title ["", {"text": "Game over!", "color": "red"}]
title @a times 10 70 20

execute as @e[tag=escort.ghost] at @s run tp ~ ~2 ~
effect give @e[tag=escort.ghost] minecraft:glowing infinite 0 true
effect clear @e[tag=escort.ghost] minecraft:invisibility

gamemode spectator @a
