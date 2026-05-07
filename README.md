# VGUI

A lightweight immediate-mode GUI library for the Vector Lua Engine.

---

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

## Label

Draws text.

```lua
vgui.label("Hello")
```

### Custom Color

```lua
vgui.label("Warning", {1, 0, 0, 1})
```

---

## Separator

Draws a horizontal line.

```lua
vgui.separator()
```

---

## Spacing

Adds vertical spacing.

```lua
vgui.spacing(10)
```

---

## Checkbox

```lua
local enabled = vgui.checkbox(
    "enabled",
    "Enable ESP",
    false
)
```

### Returns

```lua
boolean
```

---

## Integer Slider

```lua
local value = vgui.slider_int(
    "speed",
    "Speed",
    0,
    100,
    50
)
```

### Returns

```lua
number
```

---

## Float Slider

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

### Returns

```lua
number
```

---

## Button

```lua
if vgui.button("apply", "Apply") then
    print("Clicked")
end
```

### Returns

```lua
boolean
```

Returns `true` only on the frame the button was clicked.

---

## Combo Box

```lua
local selected = vgui.combo(
    "weapon",
    "Weapon",
    {
        "AK47",
        "M4A1",
        "AWP"
    },
    1
)
```

### Returns

```lua
number
```

Returns the selected index.

---

## Hotkey

```lua
local key = vgui.hotkey(
    "menu_key",
    "Menu Key",
    0x2D
)
```

### Returns

```lua
number
```

Returns the virtual key code.

### Notes

- Press `ESC` to clear the keybind
- Supports keyboard and mouse buttons

---

## Color Editor

```lua
local color = vgui.color_edit(
    "esp_color",
    "ESP Color",
    {1, 0, 0, 1}
)
```

### Returns

```lua
{r, g, b, a}
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