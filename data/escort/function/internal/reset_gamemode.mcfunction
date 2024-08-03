execute unless entity @s[gamemode=spectator] unless score $previousGamemode escort.data matches 0..2 run return 1

execute if score $previousGamemode escort.data matches 0 run gamemode survival @s
execute if score $previousGamemode escort.data matches 1 run gamemode creative @s
execute if score $previousGamemode escort.data matches 2 run gamemode adventure @s

scoreboard players reset $previousGamemode escort.data
