execute unless function escort:internal/installed run return 1
execute unless score $enabled escort.data matches 1 run return 1

title @a reset

function escort:internal/mob/stop

scoreboard players set $enabled escort.data 0
