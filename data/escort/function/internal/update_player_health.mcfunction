scoreboard players operation $playerHealth.delta escort.data = $playerHealth.current escort.data
scoreboard players operation $playerHealth.delta escort.data -= $playerHealth.max escort.data

execute store result storage escort:damage_args damage int 1.0 run scoreboard players get $playerHealth.delta escort.data
execute as @a run escort:internal/damage with storage escort:damage_args

scoreboard players reset $playerHealth.delta escort.data
