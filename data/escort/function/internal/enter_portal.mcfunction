function escort:internal/mob/stop

forceload add ~ ~

tag @s add escort.portalController
scoreboard players set $inPortal.current escort.data 1
