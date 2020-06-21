//inital values

melee_map = o_player.meleemap;
angle_offset = 0;

name = melee_map[? "Name"];
sprite = melee_map[? "Sprite"];
damage = melee_map[? "Damage"];
deflect = melee_map[? "Deflect"];
windup = melee_map[? "Windup Time"];
hitbox_active  = melee_map[? "Attack Time"];
cooldown  = melee_map[? "Cooldown Time"];
windup_angle = melee_map[? "Windup Angle"];
cooldown_angle = melee_map[? "Cooldown Angle"];
hitbox_active_angle = windup_angle + cooldown_angle;

sprite_index = sprite;


fps_scale = 60;
hitbox_check = 0;

wu = windup * fps_scale; //windup
ha = hitbox_active * fps_scale; //hitframes
cd = cooldown * fps_scale; //cooldown