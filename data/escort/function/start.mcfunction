execute unless function escort:internal/installed run return 1
execute unless score $ready escort.data matches 1 run return 1
execute if score $enabled escort.data matches 1 run return 1

function escort:internal/mob/start

scoreboard players set $enabled escort.data 1
