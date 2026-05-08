# VGUI

A lightweight immediate-mode GUI library for the Vector Lua Engine.

---

<img width="608" height="774" alt="image" src="https://github.com/user-attachments/assets/8bd9e396-df38-4d29-a963-48f51563cc87" />


# Installation

You can load the library directly from GitHub:

```lua
utility.load_url("https://raw.githubusercontent.com/HungryKelvin123/VGui/refs/heads/main/vgui.lua")
```

---

# Features

- Immediate-mode GUI
- Draggable windows
- Resizable windows
- Scrollbars
- Window collapsing
- Keyboard toggle binds
- Built-in theming system
- Persistent widget values
- Lightweight and dependency-free

---

# Basic Usage

```lua
function on_frame()
    vgui.new_frame()

    if vgui.begin_window("main", "Example Window", 100, 100, 300) then

        vgui.label("Hello world")

        local enabled = vgui.checkbox(
            "enabled",
            "Enable Feature",
            false
        )

        local speed = vgui.slider_int(
            "speed",
            "Speed",
            1,
            100,
            50
        )

        if vgui.button("apply", "Apply") then
            print("Applied")
        end
    end

    vgui.end_window()

    vgui.render()
end
```

---

# Frame Lifecycle

Every frame should follow this order:

```lua
vgui.new_frame()

-- windows/widgets

vgui.render()
```

---

# Global Offset

`vgui.offset_x` and `vgui.offset_y` shift the internal mouse cursor used for all hit-testing and interaction. Set these once before your first `vgui.new_frame()` call, or update them at any time to account for a render surface that is offset from the raw mouse position.

```lua
vgui.offset_x = 20
vgui.offset_y = 40
```

| Field | Type | Default | Description |
|---|---|---|---|
| `vgui.offset_x` | number | `0` | Horizontal offset added to the raw mouse X position |
| `vgui.offset_y` | number | `0` | Vertical offset added to the raw mouse Y position |

### Example

```lua
-- Render surface starts 50px from the left edge of the screen
vgui.offset_x = 50
vgui.offset_y = 0
```

---

# Window API

---

## `vgui.begin_window(id, title, x, y, width, options)`

Creates or begins a window.

Returns `true` if the window is open.

```lua
if vgui.begin_window("main", "Main Window", 100, 100, 300) then
    -- widgets
end
```

### Parameters

| Parameter | Type | Description |
|---|---|---|
| `id` | string | Unique window identifier |
| `title` | string | Window title |
| `x` | number | Initial X position |
| `y` | number | Initial Y position |
| `width` | number | Initial width |
| `options` | table | Optional settings |

---

## Window Options

```lua
{
    max_height = 400,
    min_width = 120,
    min_height = 60,

    no_close = false,
    no_collapse = false,
    no_drag = false,
    no_resize = false,
    no_scroll = false
}
```

| Option | Description |
|---|---|
| `max_height` | Maximum visible content height |
| `min_width` | Minimum resize width |
| `min_height` | Minimum resize height |
| `no_close` | Removes close button |
| `no_collapse` | Disables collapsing |
| `no_drag` | Disables dragging |
| `no_resize` | Disables resizing |
| `no_scroll` | Disables scrollbar |

---

## `vgui.end_window()`

Ends the current window.

```lua
vgui.end_window()
```

---

# Widgets

---

## `vgui.label(text, color)`

Draws text.

```lua
vgui.label("Hello world")
```

Custom color:

```lua
vgui.label(
    "Warning",
    {1, 0, 0, 1}
)
```

### Arguments

| Argument | Type | Description |
|---|---|---|
| `text` | string | Text to display |
| `color` | table/nil | Optional RGBA color `{r, g, b, a}` |

### Example Colors

```lua
{1, 0, 0, 1} -- red
{0, 1, 0, 1} -- green
{0, 0, 1, 1} -- blue
```

---

## `vgui.separator()`

Draws a horizontal separator line.

```lua
vgui.separator()
```

This function takes no arguments.

---

## `vgui.spacing(amount)`

Adds vertical spacing between widgets.

```lua
vgui.spacing(10)
```

### Arguments

| Argument | Type | Description |
|---|---|---|
| `amount` | number | Amount of vertical spacing in pixels |

---

## `vgui.checkbox(id, label, default)`

Creates a checkbox.

```lua
local enabled = vgui.checkbox(
    "esp_enabled",
    "Enable ESP",
    false
)
```

### Arguments

| Argument | Type | Description |
|---|---|---|
| `id` | string | Unique internal ID used for storing the value |
| `label` | string | Text shown next to the checkbox |
| `default` | boolean | Starting value (`true` or `false`) |

### Returns

```lua
boolean
```

Returns the current checkbox state.

### Example

```lua
local enabled = vgui.checkbox(
    "aimbot_enabled",
    "Enable Aimbot",
    true
)

if enabled then
    print("Aimbot enabled")
end
```

---

## `vgui.slider_int(id, label, min, max, default)`

Creates an integer slider.

```lua
local value = vgui.slider_int(
    "speed",
    "Speed",
    0,
    100,
    50
)
```

### Arguments

| Argument | Type | Description |
|---|---|---|
| `id` | string | Unique internal ID |
| `label` | string | Text displayed above the slider |
| `min` | number | Minimum value |
| `max` | number | Maximum value |
| `default` | number | Starting value |

### Returns

```lua
number
```

Returns the current integer value.

### Example

```lua
local fov = vgui.slider_int(
    "aim_fov",
    "Aim FOV",
    1,
    180,
    90
)
```

---

## `vgui.slider_float(id, label, min, max, default, format)`

Creates a float slider.

```lua
local value = vgui.slider_float(
    "volume",
    "Volume",
    0.0,
    1.0,
    0.5,
    "%.2f"
)
```

### Arguments

| Argument | Type | Description |
|---|---|---|
| `id` | string | Unique internal ID |
| `label` | string | Text displayed above the slider |
| `min` | number | Minimum value |
| `max` | number | Maximum value |
| `default` | number | Starting value |
| `format` | string/nil | Lua number format string |

### Returns

```lua
number
```

Returns the current float value.

### Common Formats

```lua
"%.1f" -- 0.5
"%.2f" -- 0.50
"%.3f" -- 0.500
```

---

## `vgui.button(id, label)`

Creates a button.

```lua
if vgui.button("save_btn", "Save Config") then
    print("Clicked")
end
```

### Arguments

| Argument | Type | Description |
|---|---|---|
| `id` | string | Unique internal button ID |
| `label` | string | Text displayed on the button |

### Returns

```lua
boolean
```

Returns `true` only on the frame the button was clicked.

### Example

```lua
if vgui.button("panic_btn", "Panic") then
    unload_cheat()
end
```

---

## `vgui.combo(id, label, items, default)`

Creates a dropdown combo box.

```lua
local selected = vgui.combo(
    "weapon_select",
    "Weapon",
    {
        "AK47",
        "M4A1",
        "AWP"
    },
    1
)
```

### Arguments

| Argument | Type | Description |
|---|---|---|
| `id` | string | Unique internal ID |
| `label` | string | Text displayed above the combo |
| `items` | table | List of selectable options |
| `default` | number | Starting selected index |

### Returns

```lua
number
```

Returns the selected index.

### Example

```lua
local mode = vgui.combo(
    "hitbox",
    "Hitbox",
    {
        "Head",
        "Chest",
        "Stomach"
    },
    1
)
```

If `"Chest"` is selected, the function returns:

```lua
2
```

---

## `vgui.multi_combo(id, label, items, default)`

Creates a multi-selection dropdown combo box. Each item has an independent checkbox, allowing any combination of options to be selected simultaneously.

```lua
local selected = vgui.multi_combo(
    "hitbox_select",
    "Hitboxes",
    {
        "Head",
        "Chest",
        "Stomach",
        "Legs"
    },
    { true, true, false, false }
)
```

### Arguments

| Argument | Type | Description |
|---|---|---|
| `id` | string | Unique internal ID |
| `label` | string | Text displayed above the combo |
| `items` | table | List of selectable options |
| `default` | table/nil | Array of booleans for the starting state of each item. Omit to default all items to `false` |

### Returns

```lua
{ boolean, boolean, ... }
```

Returns a boolean array where each index corresponds to the matching item in `items`. `true` means that item is currently selected.

### Notes

- The dropdown header previews selected item names separated by commas
- If the preview text is too wide for the widget it is automatically truncated with `...`
- If nothing is selected the header displays `"None"`
- Clicking outside the open dropdown closes it without changing selection

### Example

```lua
local bones = vgui.multi_combo(
    "esp_bones",
    "ESP Bones",
    { "Head", "Spine", "Arms", "Legs" },
    { true, false, false, false }
)

if bones[1] then draw_head_esp() end
if bones[2] then draw_spine_esp() end
if bones[3] then draw_arm_esp() end
if bones[4] then draw_leg_esp() end
```

### Programmatic Control

Because values are stored internally by ID you can read or write them at any time with `vgui.get` and `vgui.set`:

```lua
-- Read current selection
local sel = vgui.get("esp_bones")
print(sel[1]) -- true/false

-- Force-select all items
vgui.set("esp_bones", { true, true, true, true })

-- Clear all items
vgui.set("esp_bones", { false, false, false, false })
```

---

## `vgui.hotkey(id, label, default_vk)`

Creates a keybind selector.

```lua
local key = vgui.hotkey(
    "menu_key",
    "Menu Key",
    0x50
)
```

### Arguments

| Argument | Type | Description |
|---|---|---|
| `id` | string | Unique internal ID |
| `label` | string | Text displayed above the hotkey |
| `default_vk` | number | Default virtual key code |

### Returns

```lua
number
```

Returns the current virtual key code.

### Notes

- Press `ESC` to clear the keybind
- Supports keyboard and mouse buttons

### Common Keys

| Key | Hex |
|---|---|
| LMB | `0x01` |
| RMB | `0x02` |
| SHIFT | `0x10` |
| CTRL | `0x11` |
| ALT | `0x12` |
| SPACE | `0x20` |
| P | `0x50` |
| F1 | `0x70` |

---

## `vgui.color_edit(id, label, default_color)`

Creates a color editor.

```lua
local color = vgui.color_edit(
    "esp_color",
    "ESP Color",
    {1, 0, 0, 1}
)
```

### Arguments

| Argument | Type | Description |
|---|---|---|
| `id` | string | Unique internal ID |
| `label` | string | Text displayed above the color editor |
| `default_color` | table | Starting color `{r, g, b, a}` |

### Returns

```lua
{r, g, b, a}
```

Each value ranges from:

```lua
0.0 -> 1.0
```

### Example Colors

```lua
{1, 0, 0, 1} -- red
{0, 1, 0, 1} -- green
{0, 0, 1, 1} -- blue
{1, 1, 1, 1} -- white
```

Each value ranges from `0.0` to `1.0`.

---

# Window Control

---

## `vgui.set_open(id, bool)`

Opens or closes a window.

```lua
vgui.set_open("main", false)
```

---

## `vgui.is_open(id)`

Returns whether a window is open.

```lua
local open = vgui.is_open("main")
```

---

## `vgui.toggle(id)`

Toggles a window open/closed.

```lua
vgui.toggle("main")
```

---

## `vgui.set_pos(id, x, y)`

Sets window position.

```lua
vgui.set_pos("main", 200, 150)
```

---

## `vgui.set_size(id, width, max_height)`

Sets window size.

```lua
vgui.set_size("main", 350, 500)
```

---

## `vgui.add_scroll(id, delta)`

Adds scroll offset manually.

```lua
vgui.add_scroll("main", 1)
```

---

# Value Storage

All widgets internally store values by ID.

---

## `vgui.get(id)`

Gets a stored value.

```lua
local enabled = vgui.get("enabled")
```

---

## `vgui.set(id, value)`

Sets a stored value.

```lua
vgui.set("enabled", true)
```

---

# Keybinds

---

## `vgui.bind(window_id, vk)`

Binds a key to toggle a window.

```lua
vgui.bind("main", 0x2D)
```

### Example

```lua
vgui.bind("menu", 0x2D) -- INSERT key
```

---

# Themes

---

## Setting Themes

```lua
vgui.set_theme("ocean")
```

Or use a custom table:

```lua
vgui.set_theme({
    accent = {1, 0, 0, 1}
})
```

---

# Built-In Themes

| Theme |
|---|
| `blood` |
| `ocean` |
| `mint` |
| `violet` |

---

# Theme Variables

```lua
vgui.theme = {
    window_bg = {0.10, 0.10, 0.13, 0.96},
    window_border = {0.28, 0.28, 0.35, 1.00},

    title_bg = {0.13, 0.13, 0.18, 1.00},
    title_text = {1, 1, 1, 1},

    accent = {0.22, 0.54, 0.88, 1.00},
    accent_hovered = {0.30, 0.62, 0.96, 1.00},

    text = {0.92, 0.92, 0.92, 1.00},
    text_dim = {0.55, 0.55, 0.62, 1.00},

    widget_bg = {0.18, 0.18, 0.23, 1.00},
    widget_hovered = {0.26, 0.26, 0.33, 1.00},

    button_normal = {0.20, 0.20, 0.26, 1.00},
    button_hovered = {0.28, 0.28, 0.38, 1.00},
    button_active = {0.22, 0.54, 0.88, 1.00}
}
```

---

# Full Example

```lua
utility.load_url("https://raw.githubusercontent.com/HungryKelvin123/VGui/refs/heads/main/vgui.lua")

vgui.set_theme("ocean")

vgui.offset_x = 0
vgui.offset_y = 0

vgui.bind("menu", 0x50)

function on_frame()
    vgui.new_frame()

    if vgui.begin_window(
        "menu",
        "VGUI Example",
        100,
        100,
        320
    ) then

        vgui.label("Example GUI")

        vgui.separator()

        local enabled = vgui.checkbox(
            "enabled",
            "Enable Feature",
            true
        )

        local speed = vgui.slider_int(
            "speed",
            "Speed",
            0,
            100,
            50
        )

        local alpha = vgui.slider_float(
            "alpha",
            "Alpha",
            0,
            1,
            0.75
        )

        local weapon = vgui.combo(
            "weapon",
            "Weapon",
            {
                "AK47",
                "M4A1",
                "AWP"
            },
            1
        )

        local hitboxes = vgui.multi_combo(
            "hitboxes",
            "Hitboxes",
            {
                "Head",
                "Chest",
                "Stomach",
                "Legs"
            },
            { true, true, false, false }
        )

        local key = vgui.hotkey(
            "aim_key",
            "Aim Key",
            0x02
        )

        local color = vgui.color_edit(
            "esp_color",
            "ESP Color",
            {1, 0, 0, 1}
        )

        if vgui.button("save", "Save Config") then
            print("Saved")
        end
    end

    vgui.end_window()

    vgui.render()
end
```