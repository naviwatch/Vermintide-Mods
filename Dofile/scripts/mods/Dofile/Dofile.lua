-- luacheck: ignore get_mod Keyboard GameStateMachine loadstring
local mod = get_mod("Dofile")

local pl = require'pl.import_into'()

mod.do_exec = function()
	if not mod:is_enabled() then
		return
	end

	mod:pcall(function()
		loadstring(pl.utils.readfile("../mods/exec.lua"))()
	end)
end

mod:hook_safe(GameStateMachine, "pre_update", function()
	if Keyboard.pressed(Keyboard.button_id("f1"))
	and mod:get(mod.SETTING_NAMES.F1_EXEC) then
		mod.do_exec()
	end
end)

mod:dofile("scripts/mods/"..mod:get_name().."/ddraw")
