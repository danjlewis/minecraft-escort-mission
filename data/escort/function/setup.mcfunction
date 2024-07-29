execute unless function escort:internal/installed run return 1
execute if score $ready escort.data matches 1 run return 1
execute if score $enabled escort.data matches 1 run return 1

function escort:internal/mob/spawn

scoreboard players reset @a escort.dragonsKilled

scoreboard players set $ready escort.data 1
