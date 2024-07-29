execute if function escort:internal/installed run return 1

scoreboard objectives add escort.data dummy
scoreboard objectives add escort.settings dummy "Escort Mission Settings"

scoreboard players set $damageInterval escort.settings 20
scoreboard players set $outOfRangeBuffer escort.settings 10
scoreboard players set $mediumHealthThreshold escort.settings 10
scoreboard players set $lowHealthThreshold escort.settings 5
scoreboard players set $criticalHealthThreshold escort.settings 1

scoreboard players set $installed escort.data 0
scoreboard players set $ready escort.data 0
scoreboard players set $enabled escort.data 0

team add escort.mediumHealth
team modify escort.mediumHealth color gold

team add escort.lowHealth
team modify escort.lowHealth color red

team add escort.criticalHealth
team modify escort.criticalHealth color dark_red

scoreboard players set $installed escort.data 1
