execute unless function escort:internal/installed run return 1
execute unless score $enabled escort.data matches 1 run return 1

# TEMPORARY
execute unless entity @e[tag=escort.mob] run return 1

execute at @e[tag=escort.mob] run tp @e[tag=escort.ghost] ~ ~2 ~

execute store result score $mobHealth escort.data run data get entity @e[tag=escort.mob, limit=1] Health
execute if score $mobHealth escort.data > $mediumHealthThreshold escort.settings run team leave @e[tag=escort.mob]
execute if score $mobHealth escort.data <= $mediumHealthThreshold escort.settings run team join escort.mediumHealth @e[tag=escort.mob]
execute if score $mobHealth escort.data <= $lowHealthThreshold escort.settings run team join escort.lowHealth @e[tag=escort.mob]
execute if score $mobHealth escort.data <= $criticalHealthThreshold escort.settings run team join escort.criticalHealth @e[tag=escort.mob]

# TODO: variable range
execute at @e[tag=escort.mob] if entity @a[distance=..16] run scoreboard players operation $damageTimer escort.data = $damageInterval escort.settings
execute at @e[tag=escort.mob] if entity @a[distance=..16] run scoreboard players operation $outOfRangeTimer escort.data = $outOfRangeBuffer escort.settings

execute if score $outOfRangeTimer escort.data matches 0 unless score $damageTimer escort.data matches 0 run scoreboard players remove $damageTimer escort.data 1
execute at @e[tag=escort.mob] unless entity @a[distance=..16] unless score $outOfRangeTimer escort.data matches 0 run scoreboard players remove $outOfRangeTimer escort.data 1

execute if score $outOfRangeTimer escort.data matches 0 if score $previouslyOutOfRange escort.data matches 0 run function escort:internal/notify

execute if score $damageTimer escort.data matches 0 run function escort:internal/mob/damage

execute unless score $outOfRangeTimer escort.data matches 0 run scoreboard players set $previouslyOutOfRange escort.data 0
execute if score $outOfRangeTimer escort.data matches 0 run scoreboard players set $previouslyOutOfRange escort.data 1

# TODO: portal logic and win/lose logic
