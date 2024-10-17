bbbb
aaaaaa
--[[
    Author: hui.chen
    Date: 2024.10.17
    Desc: 素数取模
--]]

local node_count = 12

local instance_count_1 = 11
local node_instance_counter_map_1 = {}
for n=1, node_count do
    local instance_counter_map = {}
    node_instance_counter_map_1[n] = instance_counter_map
    for i=1, instance_count_1 do
        instance_counter_map[i] = 0
    end
end

local instance_count_2 = 13
local node_instance_counter_map_2 = {}
for n=1, node_count do
    local instance_counter_map = {}
    node_instance_counter_map_2[n] = instance_counter_map
    for i=1, instance_count_2 do
        instance_counter_map[i] = 0
    end
end

local dump_print = function (node_instance_counter_map)
    for node, map in pairs(node_instance_counter_map) do
        print("========== node", node, "==========")
        for ins, counter in pairs(map) do
            print(string.format("instance[%d] = %d", ins, counter))
        end
    end
end

local mod_func = function (node_instance_counter_map, instance_count, num)
    for i=1, num do
        local node = i % node_count
        if node == 0 then node = node_count end

        local ins_idx = i % instance_count
        if ins_idx == 0 then ins_idx = instance_count end
        local instance_counter_map = node_instance_counter_map[node]
        instance_counter_map[ins_idx] = instance_counter_map[ins_idx] + 1
    end

    dump_print(node_instance_counter_map)
end

print("========== instance count:", instance_count_1, "==========")
mod_func(node_instance_counter_map_1, instance_count_1, 1000000)


print("========== instance count:", instance_count_2, "==========")
mod_func(node_instance_counter_map_2, instance_count_2, 1000000)

