execute unless function escort:internal/installed run return 1

execute if score $ready escort.data matches 1 run function escort:reset

team remove escort.medium
team remove escort.low
team remove escort.critical

scoreboard objectives remove escort.data
scoreboard objectives remove escort.settings
scoreboard objectives remove escort.dragonsKilled
