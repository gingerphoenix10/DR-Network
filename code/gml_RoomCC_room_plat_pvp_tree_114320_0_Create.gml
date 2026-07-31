randomize();
var spawns = instance_number(obj_markerAny);
var rng = random(spawns - 0.01);
var spawnIndex = floor(rng);
var spawn = instance_find(obj_markerAny, spawnIndex);
x = spawn.x;
y = spawn.y;
