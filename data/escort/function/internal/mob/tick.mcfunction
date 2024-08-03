data modify entity @e[tag=escort.mob, limit=1] PortalCooldown set value 300
data modify entity @e[tag=escort.ghost, limit=1] PortalCooldown set value 300
execute if score $inPortal.current escort.data matches 1 run return 1

execute at @e[tag=escort.mob] run tp @e[tag=escort.ghost] ~ ~-1 ~

execute store result score $mobHealth escort.data run data get entity @e[tag=escort.mob, limit=1] Health
execute if score $mobHealth escort.data > $healthThreshold.medium escort.settings run team leave @e[tag=escort.mob]
execute if score $mobHealth escort.data <= $healthThreshold.medium escort.settings run team join escort.mediumHealth @e[tag=escort.mob]
execute if score $mobHealth escort.data <= $healthThreshold.low escort.settings run team join escort.lowHealth @e[tag=escort.mob]
execute if score $mobHealth escort.data <= $healthThreshold.critical escort.settings run team join escort.criticalHealth @e[tag=escort.mob]

execute store result storage escort:set_max_health_args maxHealth int 1.0 run scoreboard players get $mobHealth escort.data
execute as @a unless score $mobHealth escort.data matches 0 run function escort:internal/set_max_health with storage escort:set_max_health_args

execute store result score $playerHealth.current escort.data run data get entity @a[limit=1] Health
execute store result score $playerHealth.max escort.data run attribute @a[limit=1] minecraft:generic.max_health base get
execute if score $playerHealth.current escort.data > $playerHealth.max escort.data run function escort:internal/update_player_health

$execute at @e[tag=escort.mob] if entity @a[distance=..$(escortRange)] run scoreboard players operation $damageTimer escort.data = $damageInterval escort.settings
$execute at @e[tag=escort.mob] if entity @a[distance=..$(escortRange)] run scoreboard players operation $outOfRangeTimer escort.data = $outOfRangeBuffer escort.settings

execute if score $outOfRangeTimer escort.data matches 0 unless score $damageTimer escort.data matches 0 run scoreboard players remove $damageTimer escort.data 1
$execute at @e[tag=escort.mob] unless entity @a[distance=..$(escortRange)] unless score $outOfRangeTimer escort.data matches 0 run scoreboard players remove $outOfRangeTimer escort.data 1

execute if score $outOfRangeTimer escort.data matches 0 if score $previousOutOfRange escort.data matches 0 run function escort:internal/notify

execute if score $damageTimer escort.data matches 0 run function escort:internal/mob/damage

execute unless score $outOfRangeTimer escort.data matches 0 run scoreboard players set $previousOutOfRange escort.data 0
execute if score $outOfRangeTimer escort.data matches 0 run scoreboard players set $previousOutOfRange escort.data 1
