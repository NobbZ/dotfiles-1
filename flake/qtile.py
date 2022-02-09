# -*- coding: utf-8 -*-

from libqtile        import layout
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy   import lazy


# =============================================================================
# 1. Setting
# =============================================================================

layouts = [
	layout.Columns(
		border_width    = 0,

		grow_amount     = 1,
		insert_position = 1,
		margin          = 10,

		wrap_focus_columns = False,
		wrap_focus_rows    = False,
		wrap_focus_stacks  = False
	)
]

bring_front_click = "floating_only"
auto_minimize     = True


# =============================================================================
# 2. Interactive
# =============================================================================

keys = [
     Key(["shift", "mod"], "f",  lazy.window.toggle_floating()),

	Key(["mod"], "enter", lazy.spawn("alacritty")),
    Key(["mod"], "space", lazy.spawn("rofi")),
	Key(["mod"], "q",     lazy.window.kill()),
]
