data modify entity @e[tag=escort.mob, limit=1] Silent set value true
data modify entity @e[tag=escort.ghost, limit=1] Silent set value true

run kill @e[tag=escort.mob]
run kill @e[tag=escort.ghost]
