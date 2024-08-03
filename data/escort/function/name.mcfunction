execute unless entity @e[tag=escort.mob] run return 1

$execute as @e[tag=escort.entity] run data modify entity @s CustomName set value "$(name)"
