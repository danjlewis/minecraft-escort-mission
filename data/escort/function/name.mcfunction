execute unless entity @e[tag=escort.mob] run return 1

$data modify entity @e[tag=escort.mob, limit=1] CustomName set value "$(name)"
$data modify entity @e[tag=escort.ghost, limit=1] CustomName set value "$(name)"
