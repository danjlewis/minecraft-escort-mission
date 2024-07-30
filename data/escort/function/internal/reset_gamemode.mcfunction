execute unless entity @s[gamemode=spectator] run return 1

execute store result score @s escort.previousGamemode run data get entity @s previousPlayerGameType
execute if score @s escort.previousGamemode matches 0 run gamemode survival @s
execute if score @s escort.previousGamemode matches 1 run gamemode creative @s
execute if score @s escort.previousGamemode matches 2 run gamemode adventure @s
scoreboard players reset @s escort.previousGamemode
