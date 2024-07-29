function escort:internal/notify

damage @e[tag=escort.mob, limit=1] 1

scoreboard players operation $damageTimer escort.data = $damageInterval escort.settings
