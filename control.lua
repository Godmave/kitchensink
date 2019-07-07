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

script.on_init(function()
    for _, player in pairs(game.players) do
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
    end

end)