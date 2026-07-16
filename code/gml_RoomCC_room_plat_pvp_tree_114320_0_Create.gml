randomize();
var spawns = instance_number(1253);
var rng = random(spawns - 0.01);
var spawnIndex = floor(rng);
var spawn = instance_find(1253, spawnIndex);
x = spawn.x;
y = spawn.y;
