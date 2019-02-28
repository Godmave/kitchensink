require("mod-gui")
require("style")
require("utility-sprites")


local function gui_kitchensink(player_index)
    if global.kitchensink == nil then
        global.kitchensink = {}
    end

    if global.kitchensink[player_index] then
        global.kitchensink[player_index].gui.destroy()
        global.kitchensink[player_index] = nil
        return
    end

    local player = game.players[player_index]

    global.kitchensink[player_index] = {}
    global.kitchensink[player_index].gui = player.gui.center.add{type = 'frame', name = 'kitchensink-gui', direction = 'vertical', caption = 'Kitchen-Sink'}
    local gui = global.kitchensink[player_index].gui


    local tightFrame = gui.add{type="table", column_count=1}
    tightFrame.style.horizontal_spacing = 0
    tightFrame.style.vertical_spacing = 0

    local tabFlow = tightFrame.add{type="table", column_count=6}
    tabFlow.style.horizontal_spacing = 0
    tabFlow.style.vertical_spacing = 0

    local tab

    global.kitchensink[player_index].labelTab = tabFlow.add{type="button", name="kitchensink-tab-labels", style="image_tab_slot", caption="Labels"}
    tab = global.kitchensink[player_index].labelTab
    tab.visible = false
    tab.style.height = 30
    tab.style.width = 120

    global.kitchensink[player_index].labelTabSelected = tabFlow.add{type="button", name="kitchensink-tab-labels-selected", style="image_tab_selected_slot", caption="Labels"}
    tab = global.kitchensink[player_index].labelTabSelected
    tab.style.height = 30
    tab.style.width = 120


    global.kitchensink[player_index].buttonTab = tabFlow.add{type="button", name="kitchensink-tab-buttons", style="image_tab_slot", caption="Buttons"}
    tab = global.kitchensink[player_index].buttonTab
    tab.style.height = 30
    tab.style.width = 120

    global.kitchensink[player_index].buttonTabSelected = tabFlow.add{type="button", name="kitchensink-tab-buttons-selected", style="image_tab_selected_slot", caption="Buttons"}
    tab = global.kitchensink[player_index].buttonTabSelected
    tab.visible = false
    tab.style.height = 30
    tab.style.width = 120

    global.kitchensink[player_index].textboxTab = tabFlow.add{type="button", name="kitchensink-tab-textbox", style="image_tab_slot", caption="Textbox"}
    tab = global.kitchensink[player_index].textboxTab
    tab.style.height = 30
    tab.style.width = 120

    global.kitchensink[player_index].textboxTabSelected = tabFlow.add{type="button", name="kitchensink-tab-textbox-selected", style="image_tab_selected_slot", caption="Textbox"}
    tab = global.kitchensink[player_index].textboxTabSelected
    tab.visible = false
    tab.style.height = 30
    tab.style.width = 120

    global.kitchensink[player_index].utilityspritesTab = tabFlow.add{type="button", name="kitchensink-tab-utilitysprites", style="image_tab_slot", caption="Utility-Sprites"}
    tab = global.kitchensink[player_index].utilityspritesTab
    tab.style.height = 30
    tab.style.width = 120

    global.kitchensink[player_index].utilityspritesTabSelected = tabFlow.add{type="button", name="kitchensink-tab-utilitysprites-selected", style="image_tab_selected_slot", caption="Utility-Sprites"}
    tab = global.kitchensink[player_index].utilityspritesTabSelected
    tab.visible = false
    tab.style.height = 30
    tab.style.width = 120


    global.kitchensink[player_index].labels = tightFrame.add{type="frame", name="kitchensink-labels"}

    local scrollpane = global.kitchensink[player_index].labels.add{type="scroll-pane"}
    scrollpane.style.maximal_height = 700
    scrollpane.style.minimal_height = 700

    local table = scrollpane.add{type="table", column_count=5}
    for _, item in pairs(data_styles) do
        if type(item) == "table" then
            if item.type == "label_style" then
                table.add{type="label", style=_, caption=_}
            end

        end
    end

    global.kitchensink[player_index].buttons = tightFrame.add{type="frame", name="kitchensink-buttons"}
    global.kitchensink[player_index].buttons.visible = false

    local scrollpane = global.kitchensink[player_index].buttons.add{type="scroll-pane"}
    scrollpane.style.maximal_height = 700
    scrollpane.style.minimal_height = 700

    local table = scrollpane.add{type="table", column_count=6}
    for _, item in pairs(data_styles) do
        if type(item) == "table" then
            if item.type == "button_style" then
                local flow = table.add{type="flow", direction="vertical"}
                flow.add{type="text-box", style="info_box_textbox", text=_}
                flow.add{type="button", style=_, caption=" ", tooltip=_}
            end

        end
    end

    global.kitchensink[player_index].textbox = tightFrame.add{type="frame", name="kitchensink-textbox"}
    global.kitchensink[player_index].textbox.visible = false

    local scrollpane = global.kitchensink[player_index].textbox.add{type="scroll-pane"}
    scrollpane.style.maximal_height = 700
    scrollpane.style.minimal_height = 700

    local table = scrollpane.add{type="table", column_count=2}
    for _, item in pairs(data_styles) do
        if type(item) == "table" then
            if item.type == "textbox_style" then
                local flow = table.add{type="flow", direction="vertical"}
                flow.add{type="text-box", style="info_box_textbox", text=_}
                flow.add{type="text-box", style=_, text = "TEXT"}
            end

        end
    end


    global.kitchensink[player_index].utilitysprites = tightFrame.add{type="frame", name="kitchensink-utilitysprites"}
    global.kitchensink[player_index].utilitysprites.visible = false

    local scrollpane = global.kitchensink[player_index].utilitysprites.add{type="scroll-pane"}
    scrollpane.style.maximal_height = 700
    scrollpane.style.minimal_height = 700

    local table = scrollpane.add{type="table", column_count=3}
    for _, item in pairs(data_utility_sprites) do
        if type(item) == "table" then
            local flow = table.add{type="flow", direction="vertical"}
            flow.add{type="text-box", style="info_box_textbox", text=_}
            if _ == "cursor_box" then
            elseif _ == "clouds" then
            elseif _ == "arrow_button" then
            elseif _ == "refresh_white" then
            elseif _ == "explosion_chart_visualization" then
            else
                flow.add{type="sprite", sprite= "utility/".._}
            end
        end
    end



end


script.on_event(defines.events.on_gui_click, function (event)
    local element_name = event.element.name

    if element_name == "kitchensink" then
        gui_kitchensink(event.player_index)
        return
    end

    if element_name == "kitchensink-tab-labels" then
        global.kitchensink[event.player_index].labels.visible = true
        global.kitchensink[event.player_index].labelTab.visible = false
        global.kitchensink[event.player_index].labelTabSelected.visible = true
        global.kitchensink[event.player_index].buttons.visible = false
        global.kitchensink[event.player_index].buttonTab.visible = true
        global.kitchensink[event.player_index].buttonTabSelected.visible = false
        global.kitchensink[event.player_index].textbox.visible = false
        global.kitchensink[event.player_index].textboxTab.visible = true
        global.kitchensink[event.player_index].textboxTabSelected.visible = false
        global.kitchensink[event.player_index].utilitysprites.visible = false
        global.kitchensink[event.player_index].utilityspritesTab.visible = true
        global.kitchensink[event.player_index].utilityspritesTabSelected.visible = false
    end

    if element_name == "kitchensink-tab-buttons" then
        global.kitchensink[event.player_index].labels.visible = false
        global.kitchensink[event.player_index].labelTab.visible = true
        global.kitchensink[event.player_index].labelTabSelected.visible = false
        global.kitchensink[event.player_index].buttons.visible = true
        global.kitchensink[event.player_index].buttonTab.visible = false
        global.kitchensink[event.player_index].buttonTabSelected.visible = true
        global.kitchensink[event.player_index].textbox.visible = false
        global.kitchensink[event.player_index].textboxTab.visible = true
        global.kitchensink[event.player_index].textboxTabSelected.visible = false
        global.kitchensink[event.player_index].utilitysprites.visible = false
        global.kitchensink[event.player_index].utilityspritesTab.visible = true
        global.kitchensink[event.player_index].utilityspritesTabSelected.visible = false
    end

    if element_name == "kitchensink-tab-textbox" then
        global.kitchensink[event.player_index].labels.visible = false
        global.kitchensink[event.player_index].labelTab.visible = true
        global.kitchensink[event.player_index].labelTabSelected.visible = false
        global.kitchensink[event.player_index].buttons.visible = false
        global.kitchensink[event.player_index].buttonTab.visible = true
        global.kitchensink[event.player_index].buttonTabSelected.visible = false
        global.kitchensink[event.player_index].textbox.visible = true
        global.kitchensink[event.player_index].textboxTab.visible = false
        global.kitchensink[event.player_index].textboxTabSelected.visible = true
        global.kitchensink[event.player_index].utilitysprites.visible = false
        global.kitchensink[event.player_index].utilityspritesTab.visible = true
        global.kitchensink[event.player_index].utilityspritesTabSelected.visible = false
    end

    if element_name == "kitchensink-tab-utilitysprites" then
        global.kitchensink[event.player_index].labels.visible = false
        global.kitchensink[event.player_index].labelTab.visible = true
        global.kitchensink[event.player_index].labelTabSelected.visible = false
        global.kitchensink[event.player_index].buttons.visible = false
        global.kitchensink[event.player_index].buttonTab.visible = true
        global.kitchensink[event.player_index].buttonTabSelected.visible = false
        global.kitchensink[event.player_index].textbox.visible = false
        global.kitchensink[event.player_index].textboxTab.visible = true
        global.kitchensink[event.player_index].textboxTabSelected.visible = false
        global.kitchensink[event.player_index].utilitysprites.visible = true
        global.kitchensink[event.player_index].utilityspritesTab.visible = false
        global.kitchensink[event.player_index].utilityspritesTabSelected.visible = true
    end
end)

script.on_event(defines.events.on_player_joined_game, function(e)
    local player = game.players[e.player_index]

    local anchorpoint = mod_gui.get_button_flow(player)
    local button = anchorpoint["kitchensink"]

    if button then
        button.destroy()
        button = nil
    end

    if not button then
        button = anchorpoint.add{
            type = "sprite-button",
            name = "kitchensink",
            sprite = "utility/brush_icon",
            style = mod_gui.button_style
        }
    end
end)


local inventory_types = {}
do
    local map = {}
    for _, inventory_type in pairs(defines.inventory) do
        map[inventory_type] = true
    end
    for t in pairs(map) do
        inventory_types[#inventory_types + 1] = t
    end
    table.sort(inventory_types)
end

local function serialize_equipment_grid(grid)
    local names, xs, ys = {}, {}, {}

    local position = {0,0}
    local width, height = grid.width, grid.height
    local processed = {}
    for y = 0, height - 1 do
        for x = 0, width - 1 do
            local base = (y + 1) * width + x + 1
            if not processed[base] then
                position[1], position[2] = x, y
                local equipment = grid.get(position)
                if equipment ~= nil then
                    local shape = equipment.shape
                    for j = 0, shape.height - 1 do
                        for i = 0, shape.width - 1 do
                            processed[base + j * width + i] = true
                        end
                    end

                    local idx = #names + 1
                    names[idx] = equipment.name
                    xs[idx] = x
                    ys[idx] = y
                end
            end
        end
    end
    return {
        names = names,
        xs = xs,
        ys = ys,
    }
end

local function serialize_inventory(inventory)
    local filters
    if inventory.supports_filters() then
        filters = {}
        for i = 1, #inventory do
            filters[i] = inventory.get_filter(i)
        end
    end
    local item_names, item_counts, item_durabilities,
    item_ammos, item_exports, item_labels, item_grids
    = {}, {}, {}, {}, {}, {}, {}

    for i = 1, #inventory do
        local slot = inventory[i]
        if slot.valid_for_read then
            if slot.is_item_with_inventory then
                print("sending items with inventory is not allowed")
            elseif slot.is_blueprint or slot.is_blueprint_book
                    or slot.is_deconstruction_item or slot.is_item_with_tags then
                local success, export = pcall(slot.export_stack)
                if not success then
                    print("failed to export item")
                else
                    item_exports[i] = export
                end
            else
                item_names[i] = slot.name
                item_counts[i] = slot.count
                local durability = slot.durability
                if durability ~= nil then
                    item_durabilities[i] = durability
                end
                if slot.type == "ammo" then
                    item_ammos[i] = slot.ammo
                end
                if slot.is_item_with_label then
                    item_labels[i] = {
                        label = slot.label,
                        label_color = slot.label_color,
                        allow_manual_label_change = slot.allow_manual_label_change,
                    }
                end

                local grid = slot.grid
                if grid then
                    item_grids[i] = serialize_equipment_grid(grid)
                end
            end
        end
    end

    return {
        filters = filters,
        item_names = item_names,
        item_counts = item_counts,
        item_durabilities = item_durabilities,
        item_ammos = item_ammos,
        item_exports = item_exports,
        item_labels = item_labels,
        item_grids = item_grids,
    }
end

local function deserialize_grid(grid, data)
    grid.clear()
    local names, xs, ys = data.names, data.xs, data.ys
    for i = 1, #names do
        grid.put({
            name = names[i],
            position = {xs[i], ys[i]}
        })
    end
end

local function deserialize_inventory(inventory, data)
    local item_names, item_counts, item_durabilities,
    item_ammos, item_exports, item_labels, item_grids
    = data.item_names, data.item_counts, data.item_durabilities,
    data.item_ammos, data.item_exports, data.item_labels, data.item_grids
    for idx, name in pairs(item_names) do
        local slot = inventory[idx]
        slot.set_stack({
            name = name,
            count = item_counts[idx]
        })
        if item_durabilities[idx] ~= nil then
            slot.durability = item_durabilities[idx]
        end
        if item_ammos[idx] ~= nil then
            slot.ammo =  item_ammos[idx]
        end
        local label = item_labels[idx]
        if label then
            slot.label = label.label
            slot.label_color = label.label_color
            slot.allow_manual_label_change = label.allow_manual_label_change
        end

        local grid = item_grids[idx]
        if grid then
            deserialize_grid(slot.grid, grid)
        end
    end
    for idx, str in pairs(item_exports) do
        inventory[idx].import_stack(str)
    end
    if data.filters then
        for idx, filter in pairs(data.filters) do
            inventory.set_filter(idx, filter)
        end
    end
end

global.trainsToObserve = global.trainsToObserve or {}
global.carriagesToCreate = global.carriagesToCreate or {}

-- todo: move the carriagesToCreate inside the trainToObserve
-- todo: check arty teleport

script.on_event(defines.events.on_tick, function(event)
    global.trainsToObserve = global.trainsToObserve or {}
    global.carriagesToCreate = global.carriagesToCreate or {}




    for _t, trainToObserve in pairs(global.trainsToObserve) do
        trainToObserve.carriagesToCreate = trainToObserve.carriagesToCreate or {}

        if #trainToObserve.carriagesToCreate > 0 then
            if trainToObserve.currentTrain ~= nil and trainToObserve.currentTrain.valid then
                trainToObserve.currentTrain.manual_mode = true
                trainToObserve.currentTrain.speed = math.min(math.abs(trainToObserve.speed), 1)
                trainToObserve.currentTrain.manual_mode = false
            end
        end

        for _, carriage in pairs(trainToObserve.carriagesToCreate) do
            if carriage.tick <= event.tick then
                local data = carriage.data
                local station = carriage.spawnStation

                local rotation
                if bit32.band(station.direction, 2) == 0 then
                    rotation = { 1, 0, 0, 1 }
                else
                    rotation = { 0, -1, 1, 0 }
                end
                if bit32.band(station.direction, 4) == 4 then
                    for i = 1, 4 do rotation[i] = -rotation[i] end
                end

                local ox, oy = -2, 7 - 4
                ox, oy = rotation[1] * ox + rotation[2] * oy, rotation[3] * ox + rotation[4] * oy

                local sp = station.position
                local entity = game.surfaces[1].create_entity({
                    name = data.name,
                    force = game.forces.player,
                    position = {x=sp.x + ox, y=sp.y + oy},
                    direction = (station.direction + data.is_flipped * 4) % 8
                })

                if entity ~= nil then
                    if data.color then
                        entity.color = data.color
                    end

                    if data.health then
                        entity.health = data.health
                    end

                    for inventory_id, inventory_data in pairs(data.inventories) do
                        deserialize_inventory(entity.get_inventory(inventory_id), inventory_data)
                    end

                    if data.fluids then
                        local fluidbox = entity.fluidbox
                        for i = 1, #data.fluids do
                            fluidbox[i] = data.fluids[i]
                        end
                    end

                    if data.energy > 0 then
                        entity.energy = data.energy
                        if entity.burner then
                            entity.burner.currently_burning = data.currently_burning
                            entity.burner.remaining_burning_fuel = data.remaining_burning_fuel
                        end
                    end

                    if carriage.index == 1 then
                        -- entity.train.speed = math.min(math.abs(carriage.speed), 0.6)
                    end

                    entity.train.schedule = carriage.schedule
                    entity.train.manual_mode = false


                    trainToObserve.carriagesToCreate[_] = nil
                    trainToObserve.currentTrain = entity.train
                end
            end

        end


        for _, carriage in pairs(trainToObserve.carriages) do
            if carriage.valid == false then
                trainToObserve.carriages[_] = nil
            else
                local station = trainToObserve.entryStation

                local distance = math.sqrt(math.pow(math.abs(carriage.position.x - station.position.x), 2) + math.pow(math.abs(carriage.position.y - station.position.y),2))
                if distance < 5 then
                    local is_flipped = math.floor(carriage.orientation * 4 + 0.5)
                    is_flipped = bit32.bxor(bit32.rshift(station.direction, 2), bit32.rshift(is_flipped, 1))

                    local inventories = {}
                    for _, inventory_type in pairs(inventory_types) do
                        local inventory = carriage.get_inventory(inventory_type)
                        if inventory then
                            inventories[inventory_type] = serialize_inventory(inventory)
                        end
                    end

                    local fluids
                    do
                        local fluidbox = carriage.fluidbox
                        if #fluidbox > 0 then
                            fluids = {}
                            for i = 1, #fluidbox do
                                fluids[i] = fluidbox[i]
                            end
                        end
                    end

                    local data = {
                        name = carriage.name,
                        color = carriage.color,
                        health = carriage.health,
                        is_flipped = is_flipped,
                        inventories = inventories,
                        fluids = fluids,
                        energy = carriage.energy,
                        currently_burning = carriage.burner and carriage.burner.currently_burning and carriage.burner.currently_burning.name,
                        remaining_burning_fuel = carriage.burner and carriage.burner.remaining_burning_fuel
                    }

                    if trainToObserve.spawnTick == nil then
                        distance = math.sqrt(math.pow(math.abs(trainToObserve.entryStation.position.x - trainToObserve.exitStation.position.x), 2) + math.pow(math.abs(trainToObserve.entryStation.position.y - trainToObserve.exitStation.position.y),2))
                        trainToObserve.tick = event.tick + math.floor(math.abs(distance / trainToObserve.speed))
                    else

                    end


                    trainToObserve.buffered = trainToObserve.buffered or 0
                    trainToObserve.buffered = trainToObserve.buffered + 1
                    table.insert(trainToObserve.carriagesToCreate, {
                        data = data,
                        spawnStation = trainToObserve.exitStation,
                        schedule = trainToObserve.schedule,
                        speed = trainToObserve.speed,
                        tick = trainToObserve.tick,
                        index = trainToObserve.buffered
                    })

                    carriage.destroy()
                    trainToObserve.carriages[_] = nil
                else
                    local train = carriage.train
                    if train.valid then
                        if train.speed < 0 then
                            train.speed=-math.abs(trainToObserve.speed)
                        else
                            train.speed=math.abs(trainToObserve.speed)
                        end
                    end

                end

            end
        end
    end
end)


script.on_event(defines.events.on_train_changed_state, function (event)
    local train = event.train
    local trainState = event.train.state

    if trainState == defines.train_state.arrive_station then
        local trainToObserve = {}
        trainToObserve.id = train.id
        trainToObserve.carriages = {}

        local entryStation = train.schedule.records[train.schedule.current].station
        local exitStation = train.schedule.records[train.schedule.current % #train.schedule.records + 1].station

        if string.find(entryStation, '<T',1, true) then
            local schedule = train.schedule
            local current_schedule = schedule.records[schedule.current]
            local wait_conditions = current_schedule.wait_conditions

            if wait_conditions and #wait_conditions>0 then
                if wait_conditions[1].type == "circuit"
                        and wait_conditions[1].condition
                        and wait_conditions[1].condition.first_signal and wait_conditions[1].condition.first_signal.name == "signal-T"
                        and wait_conditions[1].condition.second_signal and wait_conditions[1].condition.second_signal.name == "signal-T"
                then
                    for _, c in pairs(train.carriages) do
                        table.insert(trainToObserve.carriages, c)
                    end

                    local all_stops = game.surfaces[1].find_entities_filtered{type = "train-stop"};
                    for _, trainstop in ipairs(all_stops) do
                        if trainstop.backer_name == entryStation then
                            entryStation = trainstop
                        elseif trainstop.backer_name == exitStation then
                            exitStation = trainstop
                        end
                    end


                    schedule.current = (schedule.current + 2) % (#schedule.records + 1)
                    if schedule.current == 0 then schedule.current = 1 end

                    trainToObserve.entryStation = entryStation
                    trainToObserve.exitStation = exitStation
                    trainToObserve.schedule = schedule
                    trainToObserve.speed = train.speed

                    table.insert(global.trainsToObserve, trainToObserve)
                end
            end
        end
    else
        for _, t in pairs(global.trainsToObserve) do
            if t.id == train.id then
                global.trainsToObserve[_] = nil
            end
        end
    end

end)