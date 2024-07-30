title @a actionbar {"text": "Escort mob out of range!", "color": "red"}

execute at @e[tag=escort.mob] run playsound minecraft:entity.creeper.hurt master @a ~ ~ ~ 1.0 1.0 1.0
execute as @a at @s run playsound minecraft:block.note_block.harp master
