execute store result score $inSameDimension escort.data run function escort:internal/mob/in_same_dimension

execute if score $inSameDimension escort.data matches 0 run tp @e[tag=escort.entity] @s

execute in minecraft:overworld run forceload remove all
execute in minecraft:the_nether run forceload remove all
execute in minecraft:the_end run forceload remove all

execute unless score $inSameDimension escort.data matches 0 run function escort:internal/mob/start
execute if score $inSameDimension escort.data matches 0 run schedule function escort:internal/mob/start 3s

scoreboard players reset $inSameDimension escort.data

tag @s remove escort.portalController
scoreboard players set $inPortal.current escort.data 0
