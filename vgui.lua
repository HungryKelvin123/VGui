vgui = {}

vgui.theme = {
    window_bg         = {0.10, 0.10, 0.13, 0.96},
    window_border     = {0.28, 0.28, 0.35, 1.00},
    window_rounding   = 5,
    title_bg          = {0.13, 0.13, 0.18, 1.00},
    title_text        = {1.00, 1.00, 1.00, 1.00},
    title_height      = 24,
    title_font_size   = 14,
    accent            = {0.22, 0.54, 0.88, 1.00},
    accent_hovered    = {0.30, 0.62, 0.96, 1.00},
    accent_dim        = {0.15, 0.38, 0.62, 1.00},
    text              = {0.92, 0.92, 0.92, 1.00},
    text_dim          = {0.55, 0.55, 0.62, 1.00},
    text_hovered      = {1.00, 1.00, 1.00, 1.00},
    widget_bg         = {0.18, 0.18, 0.23, 1.00},
    widget_hovered    = {0.26, 0.26, 0.33, 1.00},
    widget_height     = 18,
    widget_rounding   = 3,
    widget_padding    = 5,
    check_on          = {0.18, 0.72, 0.38, 1.00},
    check_size        = 14,
    slider_track      = {0.14, 0.14, 0.18, 1.00},
    slider_fill       = {0.22, 0.54, 0.88, 1.00},
    slider_grab       = {0.40, 0.70, 1.00, 1.00},
    button_normal     = {0.20, 0.20, 0.26, 1.00},
    button_hovered    = {0.28, 0.28, 0.38, 1.00},
    button_active     = {0.22, 0.54, 0.88, 1.00},
    separator_color   = {0.28, 0.28, 0.35, 0.85},
    inner_padding     = 8,
    item_spacing      = 5,
    font_size         = 13,
    scrollbar_bg      = {0.10, 0.10, 0.14, 0.80},
    scrollbar_grab    = {0.32, 0.32, 0.42, 1.00},
    scrollbar_hov     = {0.50, 0.50, 0.64, 1.00},
    scrollbar_w       = 6,
    resize_col        = {0.38, 0.38, 0.50, 0.75},
    resize_col_hov    = {0.65, 0.65, 0.82, 1.00},
    resize_size       = 12,
    collapse_arrow    = {0.60, 0.60, 0.72, 1.00},
    collapse_arrow_on = {0.22, 0.54, 0.88, 1.00},
}

vgui.themes = {}

vgui.themes.dark_blue = {}

vgui.themes.blood = {
    title_bg          = {0.22, 0.04, 0.04, 1.00},
    accent            = {0.80, 0.12, 0.12, 1.00},
    accent_hovered    = {0.95, 0.22, 0.22, 1.00},
    accent_dim        = {0.55, 0.05, 0.05, 1.00},
    check_on          = {0.80, 0.12, 0.12, 1.00},
    slider_fill       = {0.75, 0.10, 0.10, 1.00},
    slider_grab       = {0.90, 0.28, 0.28, 1.00},
    button_active     = {0.80, 0.12, 0.12, 1.00},
    collapse_arrow_on = {0.80, 0.12, 0.12, 1.00},
}

vgui.themes.ocean = {
    title_bg          = {0.04, 0.16, 0.28, 1.00},
    accent            = {0.08, 0.60, 0.82, 1.00},
    accent_hovered    = {0.15, 0.72, 0.95, 1.00},
    accent_dim        = {0.05, 0.40, 0.58, 1.00},
    check_on          = {0.08, 0.70, 0.85, 1.00},
    slider_fill       = {0.08, 0.60, 0.82, 1.00},
    slider_grab       = {0.20, 0.80, 0.95, 1.00},
    button_active     = {0.08, 0.60, 0.82, 1.00},
    collapse_arrow_on = {0.08, 0.60, 0.82, 1.00},
}

vgui.themes.mint = {
    title_bg          = {0.06, 0.18, 0.12, 1.00},
    accent            = {0.14, 0.80, 0.52, 1.00},
    accent_hovered    = {0.22, 0.92, 0.62, 1.00},
    accent_dim        = {0.08, 0.55, 0.35, 1.00},
    check_on          = {0.14, 0.80, 0.52, 1.00},
    slider_fill       = {0.14, 0.78, 0.50, 1.00},
    slider_grab       = {0.25, 0.92, 0.65, 1.00},
    button_active     = {0.14, 0.78, 0.50, 1.00},
    collapse_arrow_on = {0.14, 0.80, 0.52, 1.00},
}

vgui.themes.violet = {
    title_bg          = {0.15, 0.08, 0.22, 1.00},
    accent            = {0.65, 0.25, 0.90, 1.00},
    accent_hovered    = {0.75, 0.38, 0.98, 1.00},
    accent_dim        = {0.42, 0.14, 0.62, 1.00},
    check_on          = {0.65, 0.25, 0.90, 1.00},
    slider_fill       = {0.62, 0.22, 0.88, 1.00},
    slider_grab       = {0.78, 0.40, 0.98, 1.00},
    button_active     = {0.65, 0.25, 0.90, 1.00},
    collapse_arrow_on = {0.65, 0.25, 0.90, 1.00},
}

function vgui.set_theme(name_or_table)
    local src = type(name_or_table) == "string"
                and vgui.themes[name_or_table]
                or  name_or_table
    if not src then return end
    for k, v in pairs(src) do vgui.theme[k] = v end
end

local _S = {
    windows         = {},
    window_order    = {},
    focused_id      = nil,
    dragging_id     = nil,
    drag_off_x      = 0,
    drag_off_y      = 0,
    resizing_id     = nil,
    resize_orig_mx  = 0,
    resize_orig_my  = 0,
    resize_orig_w   = 0,
    resize_orig_h   = 0,
    scrolling_id    = nil,
    scroll_grab_off = 0,
    mx              = 0,
    my              = 0,
    lmb             = false,
    prev_lmb        = false,
    clicked         = false,
    released        = false,
    binds           = {},
    cur_win         = nil,
    cur_opts        = nil,
    cursor_y        = 0,
    items           = {},
    values          = {},
}

local function _in_rect(px, py, rx, ry, rw, rh)
    return px >= rx and px <= rx + rw and py >= ry and py <= ry + rh
end

local function _get(id, default)
    if _S.values[id] == nil then _S.values[id] = default end
    return _S.values[id]
end

local function _set(id, v)
    _S.values[id] = v
end

local function _input_blocked(id, px, py)
    local past = false
    for _, wid in ipairs(_S.window_order) do
        if wid == id then
            past = true
        elseif past then
            local w = _S.windows[wid]
            if w and w.open and _in_rect(px, py, w.x, w.y, w.w, w.h) then
                return true
            end
        end
    end
    return false
end

local function _alloc(h)
    local t   = vgui.theme
    local win = _S.cur_win
    if not win then return 0, 0, 0, h end
    local opts       = _S.cur_opts or {}
    local sb_reserve = opts.no_scroll and 0 or (t.scrollbar_w + 4)
    local ix = win.x + t.inner_padding
    local iy = _S.cursor_y
    local iw = win.w - t.inner_padding * 2 - sb_reserve
    _S.cursor_y = _S.cursor_y + h + t.item_spacing
    return ix, iy, iw, h
end

local function _push(ay, ah, fn)
    table.insert(_S.items, { ay = ay, ah = ah, fn = fn })
end

local function _focus(id)
    if _S.focused_id == id then return end
    _S.focused_id = id
    for i, wid in ipairs(_S.window_order) do
        if wid == id then
            table.remove(_S.window_order, i)
            table.insert(_S.window_order, id)
            return
        end
    end
end

function vgui.bind(window_id, vk)
    _S.binds[window_id] = { vk = vk, prev = false }
end

function vgui.set_open(id, bool)
    if _S.windows[id] then _S.windows[id].open = bool end
end

function vgui.is_open(id)
    return _S.windows[id] and _S.windows[id].open or false
end

function vgui.toggle(id)
    if _S.windows[id] then _S.windows[id].open = not _S.windows[id].open end
end

function vgui.get(id)    return _S.values[id] end
function vgui.set(id, v) _S.values[id] = v    end

function vgui.set_pos(id, x, y)
    if _S.windows[id] then
        _S.windows[id].x = x
        _S.windows[id].y = y
    end
end

function vgui.set_size(id, w, max_h)
    if _S.windows[id] then
        _S.windows[id].w     = w
        _S.windows[id].max_h = max_h
    end
end

function vgui.add_scroll(id, delta)
    local win = _S.windows[id]
    if not win or win.collapsed then return end
    local max_scroll = math.max(0, (win.content_h or 0) - win.max_h)
    win.scroll_y = math.max(0, math.min(max_scroll, win.scroll_y - delta * 20))
end

function vgui.new_frame()
    _S.mx, _S.my = utility.get_mouse_pos()
    _S.prev_lmb  = _S.lmb
    _S.lmb       = input.is_key_down(0x01)
    _S.clicked   = _S.lmb and not _S.prev_lmb
    _S.released  = not _S.lmb and _S.prev_lmb

    for id, bind in pairs(_S.binds) do
        local held = input.is_key_down(bind.vk)
        if held and not bind.prev and _S.windows[id] then
            _S.windows[id].open = not _S.windows[id].open
        end
        bind.prev = held
    end

    if _S.dragging_id then
        local win = _S.windows[_S.dragging_id]
        if win and _S.lmb then
            win.x = _S.mx - _S.drag_off_x
            win.y = _S.my - _S.drag_off_y
        else
            _S.dragging_id = nil
        end
    end

    if _S.resizing_id then
        local win = _S.windows[_S.resizing_id]
        if win and _S.lmb then
            local dw = _S.mx - _S.resize_orig_mx
            local dh = _S.my - _S.resize_orig_my
            win.w     = math.max(win.min_w, _S.resize_orig_w + dw)
            win.max_h = math.max(win.min_h, _S.resize_orig_h + dh)
        else
            _S.resizing_id = nil
        end
    end

    if _S.scrolling_id then
        local win = _S.windows[_S.scrolling_id]
        if win and _S.lmb then
            local t         = vgui.theme
            local content_h = win.content_h or 0
            local viewport  = win.max_h
            if content_h > viewport then
                local track_top  = win.y + t.title_height + t.inner_padding + 2
                local track_h    = math.max(1, viewport - t.inner_padding)
                local thumb_h    = math.max(20, track_h * (viewport / content_h))
                local max_travel = track_h - thumb_h
                local rel        = (_S.my - _S.scroll_grab_off) - track_top
                local frac       = math.max(0, math.min(1, rel / math.max(1, max_travel)))
                win.scroll_y     = frac * (content_h - viewport)
            end
        else
            _S.scrolling_id = nil
        end
    end
end

function vgui.begin_window(id, title, x, y, w, options)
    options = options or {}
    if not _S.windows[id] then
        _S.windows[id] = {
            id        = id,
            x         = x   or 120,
            y         = y   or 120,
            w         = w   or 230,
            h         = 0,
            title     = title or id,
            open      = true,
            collapsed  = false,
            max_h     = options.max_height or 400,
            min_w     = options.min_width  or 120,
            min_h     = options.min_height or 60,
            scroll_y  = 0,
            content_h = 0,
            draw_list = {},
        }
        table.insert(_S.window_order, id)
    end

    local win = _S.windows[id]
    if title              then win.title = title end
    if options.max_height then win.max_h = options.max_height end
    if options.min_width  then win.min_w = options.min_width  end
    if options.min_height then win.min_h = options.min_height end

    local t     = vgui.theme
    _S.cur_win  = win
    _S.cur_opts = options
    _S.cursor_y = win.y + t.title_height + t.inner_padding - win.scroll_y
    _S.items    = {}

    return win.open
end

function vgui.end_window()
    local win  = _S.cur_win
    local opts = _S.cur_opts or {}

    local items_snap = _S.items
    _S.items    = {}
    _S.cur_win  = nil
    _S.cur_opts = nil

    if not win then return end

    local t   = vgui.theme
    local pad = t.inner_padding
    local id  = win.id

    local raw_content_h = math.max(0,
        (_S.cursor_y + win.scroll_y) - (win.y + t.title_height + pad))
    win.content_h = raw_content_h

    local max_scroll = math.max(0, raw_content_h - win.max_h)
    win.scroll_y     = math.max(0, math.min(win.scroll_y, max_scroll))

    local body_h = win.collapsed and 0 or math.min(raw_content_h, win.max_h)
    win.h = body_h + t.title_height + pad * 2

    if win.open then
        local wx, wy, ww, wh = win.x, win.y, win.w, win.h
        local blocked = _input_blocked(id, _S.mx, _S.my)

        if _S.clicked and not blocked
           and _in_rect(_S.mx, _S.my, wx, wy, ww, wh) then
            _focus(id)
        end

        if not opts.no_close then
            local cs = 12
            local cx = wx + ww - cs - 6
            local cy = wy + math.floor((t.title_height - cs) * 0.5)
            if not blocked
               and _in_rect(_S.mx, _S.my, cx - 2, cy - 2, cs + 4, cs + 4)
               and _S.clicked then
                win.open = false
            end
        end

        if not opts.no_collapse and not blocked then
            if _in_rect(_S.mx, _S.my, wx, wy, 22, t.title_height) and _S.clicked then
                win.collapsed = not win.collapsed
                win.scroll_y  = 0
                _focus(id)
            end
        end

        if not opts.no_drag
           and not _S.dragging_id
           and not _S.resizing_id
           and not blocked then
            local left_off  = opts.no_collapse and 0  or 22
            local right_off = opts.no_close    and 0  or 22
            local drag_x    = wx + left_off
            local drag_w    = ww - left_off - right_off
            if _in_rect(_S.mx, _S.my, drag_x, wy, drag_w, t.title_height)
               and _S.clicked then
                _S.dragging_id = id
                _S.drag_off_x  = _S.mx - wx
                _S.drag_off_y  = _S.my - wy
                _focus(id)
            end
        end

        if not opts.no_resize
           and not win.collapsed
           and not _S.resizing_id
           and not _S.dragging_id
           and not blocked then
            local rs  = t.resize_size
            local rhx = wx + ww - rs
            local rhy = wy + wh - rs
            if _in_rect(_S.mx, _S.my, rhx, rhy, rs, rs) and _S.clicked then
                _S.resizing_id    = id
                _S.resize_orig_mx = _S.mx
                _S.resize_orig_my = _S.my
                _S.resize_orig_w  = ww
                _S.resize_orig_h  = win.max_h
                _focus(id)
            end
        end

        if not opts.no_scroll
           and not win.collapsed
           and not _S.scrolling_id
           and not blocked then
            local content_h = win.content_h
            local viewport  = win.max_h
            if content_h > viewport then
                local sb_w      = t.scrollbar_w
                local sb_x      = wx + ww - sb_w - 3
                local track_top = wy + t.title_height + pad + 2
                local track_h   = math.max(1, body_h - pad)
                local thumb_h   = math.max(20, track_h * (viewport / content_h))
                local frac      = win.scroll_y / math.max(1, content_h - viewport)
                local thumb_y   = track_top + frac * (track_h - thumb_h)

                if _in_rect(_S.mx, _S.my, sb_x - 2, track_top, sb_w + 4, track_h)
                   and _S.clicked then
                    if _in_rect(_S.mx, _S.my, sb_x - 2, thumb_y, sb_w + 4, thumb_h) then
                        _S.scrolling_id    = id
                        _S.scroll_grab_off = _S.my - thumb_y
                        _focus(id)
                    else
                        local rel      = _S.my - track_top
                        local new_frac = math.max(0, math.min(1,
                                         rel / math.max(1, track_h - thumb_h)))
                        win.scroll_y = new_frac * (content_h - viewport)
                        _focus(id)
                    end
                end
            end
        end
    end

    win.draw_list = {}
    local dl = win.draw_list
    if not win.open then return end

    local wx, wy, ww, wh = win.x, win.y, win.w, win.h

    table.insert(dl, function()
        draw.rect_filled(wx + 3, wy + 3, ww, wh, {0, 0, 0, 0.45}, t.window_rounding)
        draw.rect_filled(wx, wy, ww, wh, t.window_bg,     t.window_rounding)
        draw.rect(wx, wy, ww, wh, t.window_border, t.window_rounding, 1)
        draw.rect_filled(wx, wy, ww, t.title_height, t.title_bg, t.window_rounding)
        draw.line(wx + 1, wy + t.title_height, wx + ww - 1, wy + t.title_height, t.accent)
    end)

    if not opts.no_collapse then
        local ax  = wx + 8
        local acy = wy + math.floor(t.title_height * 0.5)
        local col = win.collapsed and t.collapse_arrow_on or t.collapse_arrow
        if win.collapsed then
            table.insert(dl, function()
                draw.line(ax,     acy - 4, ax + 6, acy,     col, 1.5)
                draw.line(ax + 6, acy,     ax,     acy + 4, col, 1.5)
                draw.line(ax,     acy - 4, ax,     acy + 4, col, 1.2)
            end)
        else
            table.insert(dl, function()
                draw.line(ax,     acy - 3, ax + 8, acy - 3, col, 1.5)
                draw.line(ax,     acy - 3, ax + 4, acy + 3, col, 1.5)
                draw.line(ax + 8, acy - 3, ax + 4, acy + 3, col, 1.5)
            end)
        end
    end

    do
        local tx_off     = opts.no_collapse and pad or (pad + 16)
        local _, tth     = draw.get_text_size(win.title, t.title_font_size)
        local ttx        = wx + tx_off
        local tty        = wy + math.floor((t.title_height - tth) * 0.5)
        local title_copy = win.title
        table.insert(dl, function()
            draw.text(ttx, tty, title_copy, t.title_text, t.title_font_size)
        end)
    end

    if not opts.no_close then
        local cs   = 12
        local cx   = wx + ww - cs - 6
        local cy   = wy + math.floor((t.title_height - cs) * 0.5)
        local chov = _in_rect(_S.mx, _S.my, cx - 2, cy - 2, cs + 4, cs + 4)
        local ccol = chov and {1, 0.32, 0.32, 1} or {0.55, 0.55, 0.60, 1}
        table.insert(dl, function()
            if chov then
                draw.rect_filled(cx - 2, cy - 2, cs + 4, cs + 4, {0.42, 0.08, 0.08, 0.75}, 3)
            end
            draw.line(cx,      cy,      cx + cs, cy + cs, ccol, 1.5)
            draw.line(cx + cs, cy,      cx,      cy + cs, ccol, 1.5)
        end)
    end

    if not win.collapsed then
        local clip_top = wy + t.title_height + pad
        local clip_bot = wy + wh - pad


        for _, item in ipairs(items_snap) do
            if item.ay >= clip_top and item.ay + item.ah <= clip_bot then
                table.insert(dl, item.fn)
            end
        end

        if not opts.no_scroll then
            local content_h = win.content_h
            local viewport  = win.max_h
            if content_h > viewport then
                local sb_w      = t.scrollbar_w
                local sb_x      = wx + ww - sb_w - 3
                local track_top = wy + t.title_height + pad + 2
                local track_h   = math.max(1, body_h - pad)
                local thumb_h   = math.max(20, track_h * (viewport / content_h))
                local frac      = win.scroll_y / math.max(1, content_h - viewport)
                local thumb_y   = track_top + frac * (track_h - thumb_h)
                local th_hov    = _in_rect(_S.mx, _S.my, sb_x - 2, thumb_y, sb_w + 4, thumb_h)
                local th_col    = (_S.scrolling_id == id or th_hov)
                                  and t.scrollbar_hov or t.scrollbar_grab

                local r_sbx, r_tt, r_th2, r_ty, r_thh, r_tc =
                      sb_x, track_top, track_h, thumb_y, thumb_h, th_col
                table.insert(dl, function()
                    draw.rect_filled(r_sbx, r_tt, sb_w, r_th2, t.scrollbar_bg, sb_w)
                    draw.rect_filled(r_sbx, r_ty, sb_w, r_thh, r_tc,           sb_w)
                end)
            end
        end

        if not opts.no_resize then
            local rs   = t.resize_size
            local rhx  = wx + ww - rs
            local rhy  = wy + wh - rs
            local rhov = _in_rect(_S.mx, _S.my, rhx, rhy, rs, rs)
            local rcol = (rhov or _S.resizing_id == id)
                         and t.resize_col_hov or t.resize_col
            table.insert(dl, function()
                for i = 1, 3 do
                    local o = i * 3 + 1
                    draw.line(rhx + rs - o, rhy + rs,
                              rhx + rs,     rhy + rs - o, rcol, 1)
                end
            end)
        end
    end
end

function vgui.render()
    for _, id in ipairs(_S.window_order) do
        local win = _S.windows[id]
        if win and win.open and win.draw_list then
            for _, fn in ipairs(win.draw_list) do fn() end
        end
    end
end

function vgui.label(text, color)
    local t    = vgui.theme
    color      = color or t.text
    local _, h = draw.get_text_size(text, t.font_size)
    local x, y = _alloc(h + 2)
    local lx, ly = x, y
    _push(ly, h + 2, function()
        draw.text(lx, ly, text, color, t.font_size)
    end)
end

function vgui.separator()
    local t       = vgui.theme
    local x, y, w = _alloc(1)
    _S.cursor_y   = _S.cursor_y + 3
    local sx, sy, sw = x, y, w
    _push(sy, 4, function()
        draw.line(sx, sy, sx + sw, sy, t.separator_color)
    end)
end

function vgui.spacing(amount)
    _S.cursor_y = _S.cursor_y + (amount or 6)
end

function vgui.checkbox(id, label, default)
    local t   = vgui.theme
    local val = _get(id, default)
    local cs  = t.check_size
    local _, fh = draw.get_text_size(label, t.font_size)
    local h   = math.max(cs, fh)
    local x, y, w = _alloc(h + 2)

    local win     = _S.cur_win
    local blocked = win and _input_blocked(win.id, _S.mx, _S.my) or false
    local hov     = not blocked and _in_rect(_S.mx, _S.my, x, y, w, h)
    if hov and _S.clicked then val = not val; _set(id, val) end

    local lx, ly, lw, lh, cv = x, y, w, h, val
    _push(ly, h + 2, function()
        local by = ly + math.floor((lh - cs) * 0.5)
        local bg = cv and t.check_on or (hov and t.widget_hovered or t.widget_bg)
        draw.rect_filled(lx, by, cs, cs, bg, t.widget_rounding)
        draw.rect(lx, by, cs, cs, t.window_border, t.widget_rounding, 1)
        if cv then
            local ox = lx + 3
            local oy = by + math.floor(cs * 0.5) - 1
            draw.line(ox,     oy + 2, ox + 3, oy + 5, {1,1,1,1}, 1.5)
            draw.line(ox + 3, oy + 5, ox + 9, oy - 2, {1,1,1,1}, 1.5)
        end
        local _, th2 = draw.get_text_size(label, t.font_size)
        draw.text(lx + cs + 7, ly + math.floor((lh - th2) * 0.5),
                  label, hov and t.text_hovered or t.text, t.font_size)
    end)
    return val
end

function vgui.slider_int(id, label, min_v, max_v, default)
    local t   = vgui.theme
    local val = _get(id, default)
    local sh  = t.widget_height
    local _, lh = draw.get_text_size(label, t.font_size)
    local total_h = lh + t.item_spacing + sh
    local x, y, w = _alloc(total_h)
    local lx, ly     = x, y
    local sx, sy, sw = x, y + lh + t.item_spacing, w

    local win     = _S.cur_win
    local blocked = win and _input_blocked(win.id, _S.mx, _S.my) or false
    local hov     = not blocked and _in_rect(_S.mx, _S.my, sx, sy, sw, sh)
    if hov and _S.lmb then
        local frac = math.max(0, math.min(1, (_S.mx - sx) / sw))
        val = math.max(min_v, math.min(max_v,
              math.floor(min_v + frac * (max_v - min_v) + 0.5)))
        _set(id, val)
    end

    local cv = val
    _push(ly, total_h, function()
        draw.text(lx, ly, label, t.text, t.font_size)
        local vs = tostring(cv)
        local vtw = draw.get_text_size(vs, t.font_size)
        draw.text(lx + w - vtw, ly, vs, t.text_dim, t.font_size)
        draw.rect_filled(sx, sy, sw, sh, t.slider_track, t.widget_rounding)
        draw.rect(sx, sy, sw, sh, t.window_border, t.widget_rounding, 1)
        local r = (cv - min_v) / math.max(1, max_v - min_v)
        local grab_x = math.max(sx, math.min(sx + sw - sh, sx + r * sw - sh * 0.5))
        local fill_w = math.max(0, grab_x - sx + sh * 0.5)
        draw.rect_filled(sx, sy, fill_w, sh, t.slider_fill, t.widget_rounding)
        draw.rect_filled(grab_x, sy, sh, sh, t.slider_grab, t.widget_rounding)
    end)
    return val
end

function vgui.slider_float(id, label, min_v, max_v, default, fmt)
    local t   = vgui.theme
    fmt       = fmt or "%.2f"
    local val = _get(id, default)
    local sh  = t.widget_height
    local _, lh = draw.get_text_size(label, t.font_size)
    local total_h = lh + t.item_spacing + sh
    local x, y, w = _alloc(total_h)
    local lx, ly     = x, y
    local sx, sy, sw = x, y + lh + t.item_spacing, w

    local win     = _S.cur_win
    local blocked = win and _input_blocked(win.id, _S.mx, _S.my) or false
    local hov     = not blocked and _in_rect(_S.mx, _S.my, sx, sy, sw, sh)
    if hov and _S.lmb then
        local frac = math.max(0, math.min(1, (_S.mx - sx) / sw))
        val = math.floor((min_v + frac * (max_v - min_v)) * 100 + 0.5) / 100
        val = math.max(min_v, math.min(max_v, val))
        _set(id, val)
    end

    local cv = val
    _push(ly, total_h, function()
        draw.text(lx, ly, label, t.text, t.font_size)
        local vs = string.format(fmt, cv)
        local vtw = draw.get_text_size(vs, t.font_size)
        draw.text(lx + w - vtw, ly, vs, t.text_dim, t.font_size)
        draw.rect_filled(sx, sy, sw, sh, t.slider_track, t.widget_rounding)
        draw.rect(sx, sy, sw, sh, t.window_border, t.widget_rounding, 1)
        local r = (cv - min_v) / math.max(0.000001, max_v - min_v)
        local grab_x = math.max(sx, math.min(sx + sw - sh, sx + r * sw - sh * 0.5))
        local fill_w = math.max(0, grab_x - sx + sh * 0.5)
        draw.rect_filled(sx, sy, fill_w, sh, t.slider_fill, t.widget_rounding)
        draw.rect_filled(grab_x, sy, sh, sh, t.slider_grab, t.widget_rounding)
    end)
    return val
end

function vgui.button(id, label)
    local t     = vgui.theme
    local _, th = draw.get_text_size(label, t.font_size)
    local bh    = th + t.widget_padding * 2
    local x, y, w = _alloc(bh)

    local win     = _S.cur_win
    local blocked = win and _input_blocked(win.id, _S.mx, _S.my) or false
    local hov     = not blocked and _in_rect(_S.mx, _S.my, x, y, w, bh)
    local pressed = hov and _S.lmb
    local clicked = hov and _S.clicked

    local lx, ly, lw, lh = x, y, w, bh
    _push(ly, bh, function()
        local bg = pressed and t.button_active
                  or (hov and t.button_hovered or t.button_normal)
        draw.rect_filled(lx, ly, lw, lh, bg, t.widget_rounding)
        draw.rect(lx, ly, lw, lh, t.window_border, t.widget_rounding, 1)
        if not pressed then
            draw.line(lx + 2, ly + 1, lx + lw - 2, ly + 1, {1, 1, 1, 0.06}, 1)
        end
        local tw2, th2 = draw.get_text_size(label, t.font_size)
        draw.text(lx + math.floor((lw - tw2) * 0.5),
                  ly + math.floor((lh - th2) * 0.5),
                  label, hov and t.text_hovered or t.text, t.font_size)
    end)
    return clicked
end

function vgui.combo(id, label, items, default)
    local t     = vgui.theme
    local val   = _get(id, default or 1)
    local sh    = t.widget_height
    local _, lh = draw.get_text_size(label, t.font_size)
    local total_h = lh + t.item_spacing + sh
    local x, y, w = _alloc(total_h)
    local n = #items

    local open_id = id .. "__open"
    local is_open = _get(open_id, false)
    local lx, ly     = x, y
    local dx, dy, dw = x, y + lh + t.item_spacing, w
    local dh          = sh
    local drop_y      = dy + dh

    local win     = _S.cur_win
    local blocked = win and _input_blocked(win.id, _S.mx, _S.my) or false
    local hov_box = not blocked and _in_rect(_S.mx, _S.my, dx, dy, dw, dh)

    if hov_box and _S.clicked then
        is_open = not is_open
        _set(open_id, is_open)
    end

    if is_open then
        _S.cursor_y = _S.cursor_y + n * (sh + 1)
        for i = 1, n do
            local iy2 = drop_y + (i - 1) * (sh + 1)
            if not blocked
               and _in_rect(_S.mx, _S.my, dx, iy2, dw, sh)
               and _S.clicked then
                val = i
                is_open = false
                _set(id, val)
                _set(open_id, false)
            end
        end
        if _S.clicked and not hov_box
           and not _in_rect(_S.mx, _S.my, dx, drop_y, dw, n * (sh + 1)) then
            is_open = false
            _set(open_id, false)
        end
    end

    local cv, cio, cit = val, is_open, items
    local drop_extra = is_open and n * (sh + 1) or 0
    _push(ly, total_h + drop_extra, function()
        draw.text(lx, ly, label, t.text, t.font_size)
        draw.rect_filled(dx, dy, dw, dh,
                         hov_box and t.widget_hovered or t.widget_bg, t.widget_rounding)
        draw.rect(dx, dy, dw, dh, t.window_border, t.widget_rounding, 1)
        local sel = cit[cv] or "?"
        local _, sth = draw.get_text_size(sel, t.font_size)
        draw.text(dx + 5, dy + math.floor((dh - sth) * 0.5), sel, t.text, t.font_size)
        local ax = dx + dw - 14
        local ay = dy + math.floor(dh * 0.5)
        if cio then
            draw.line(ax,      ay + 3, ax + 5,  ay - 2, t.text_dim, 1.2)
            draw.line(ax + 5,  ay - 2, ax + 10, ay + 3, t.text_dim, 1.2)
        else
            draw.line(ax,      ay - 3, ax + 5,  ay + 2, t.text_dim, 1.2)
            draw.line(ax + 5,  ay + 2, ax + 10, ay - 3, t.text_dim, 1.2)
        end
        if cio then
            local ih = sh
            draw.rect_filled(dx, drop_y, dw, n * (ih + 1) + 2,
                             {0.12, 0.12, 0.16, 0.98}, t.widget_rounding)
            draw.rect(dx, drop_y, dw, n * (ih + 1) + 2,
                      t.window_border, t.widget_rounding, 1)
            for i = 1, n do
                local iy2 = drop_y + (i - 1) * (ih + 1)
                local ihm = _in_rect(_S.mx, _S.my, dx, iy2, dw, ih)
                local ibg = i == cv and t.accent_dim or (ihm and t.widget_hovered or nil)
                if ibg then draw.rect_filled(dx + 1, iy2, dw - 2, ih, ibg, 0) end
                local _, ith = draw.get_text_size(cit[i], t.font_size)
                draw.text(dx + 5, iy2 + math.floor((ih - ith) * 0.5),
                          cit[i],
                          (i == cv or ihm) and t.text_hovered or t.text,
                          t.font_size)
            end
        end
    end)
    return val
end

function vgui.hotkey(id, label, default)
    local t       = vgui.theme
    local val     = _get(id, default or 0)
    local wait_id = id .. "__waiting"
    local rel_id  = id .. "__release"
    local waiting       = _get(wait_id, false)
    local needs_release = _get(rel_id, false)
    local sh      = t.widget_height
    local _, lh   = draw.get_text_size(label, t.font_size)
    local total_h = lh + t.item_spacing + sh
    local x, y, w = _alloc(total_h)
    local lx, ly     = x, y
    local bx, by, bw = x, y + lh + t.item_spacing, w
    local bh          = sh

    local win     = _S.cur_win
    local blocked = win and _input_blocked(win.id, _S.mx, _S.my) or false
    local hov     = not blocked and _in_rect(_S.mx, _S.my, bx, by, bw, bh)

    if hov and _S.clicked then
        waiting       = true
        needs_release = true
        _set(wait_id, true)
        _set(rel_id,  true)
    end

    if waiting then
        if needs_release then
            if not _S.lmb then
                needs_release = false
                _set(rel_id, false)
            end
        else
            local scan = {0x01,0x02,0x04,0x05,0x06,0x08,0x09,0x0D,0x1B,0x20,
                          0x21,0x22,0x23,0x24,0x25,0x26,0x27,0x28}
            for i = 0x30, 0x39 do scan[#scan + 1] = i end
            for i = 0x41, 0x5A do scan[#scan + 1] = i end
            for i = 0x60, 0x69 do scan[#scan + 1] = i end
            for i = 0x70, 0x7B do scan[#scan + 1] = i end
            for _, vk in ipairs(scan) do
                if input.is_key_down(vk) then
                    val           = (vk == 0x1B) and 0 or vk
                    waiting       = false
                    needs_release = false
                    _set(id,       val)
                    _set(wait_id,  false)
                    _set(rel_id,   false)
                    break
                end
            end
        end
    end

    local cv, cwt = val, waiting
    _push(ly, total_h, function()
        draw.text(lx, ly, label, t.text, t.font_size)
        draw.rect_filled(bx, by, bw, bh,
            cwt and t.accent or (hov and t.widget_hovered or t.widget_bg),
            t.widget_rounding)
        draw.rect(bx, by, bw, bh, t.window_border, t.widget_rounding, 1)

        local vk_names = {
            [0x01]="LMB",[0x02]="RMB",[0x04]="MMB",[0x08]="Back",[0x09]="Tab",
            [0x0D]="Enter",[0x10]="Shift",[0x11]="Ctrl",[0x12]="Alt",[0x1B]="Esc",
            [0x20]="Space",[0x21]="PgUp",[0x22]="PgDn",[0x23]="End",[0x24]="Home",
            [0x25]="Left",[0x26]="Up",[0x27]="Right",[0x28]="Down",
            [0x2D]="Insert",[0x2E]="Delete",
            [0x70]="F1",[0x71]="F2",[0x72]="F3",[0x73]="F4",
            [0x74]="F5",[0x75]="F6",[0x76]="F7",[0x77]="F8",
            [0x78]="F9",[0x79]="F10",[0x7A]="F11",[0x7B]="F12",
        }
        local ks
        if   cwt                         then ks = "< press a key >"
        elseif cv == 0                   then ks = "[ none ]"
        elseif cv >= 0x41 and cv <= 0x5A then ks = string.char(cv)
        elseif cv >= 0x30 and cv <= 0x39 then ks = string.char(cv)
        elseif cv >= 0x60 and cv <= 0x69 then ks = "Num" .. (cv - 0x60)
        elseif vk_names[cv]              then ks = vk_names[cv]
        else                                  ks = string.format("VK_%02X", cv)
        end
        local ktw, kth = draw.get_text_size(ks, t.font_size)
        draw.text(bx + math.floor((bw - ktw) * 0.5),
                  by + math.floor((bh - kth) * 0.5),
                  ks, cwt and {1, 0.85, 0.2, 1} or t.text_dim, t.font_size)
    end)
    return cv
end

function vgui.color_edit(id, label, default)
    local t   = vgui.theme
    local val = _get(id, default or {1, 1, 1, 1})
    local _, lh = draw.get_text_size(label, t.font_size)
    local px, py, pw = _alloc(lh + 2)
    local lpx, lpy, lpw, lval = px, py, pw, val
    _push(lpy, lh + 2, function()
        draw.text(lpx, lpy, label, t.text, t.font_size)
        local sw = 28
        draw.rect_filled(lpx + lpw - sw, lpy, sw, lh + 2, lval, t.widget_rounding)
        draw.rect(lpx + lpw - sw, lpy, sw, lh + 2, t.window_border, t.widget_rounding, 1)
    end)
    local r = vgui.slider_float(id .. "__r", "R", 0, 1, val[1], "%.2f")
    local g = vgui.slider_float(id .. "__g", "G", 0, 1, val[2], "%.2f")
    local b = vgui.slider_float(id .. "__b", "B", 0, 1, val[3], "%.2f")
    local a = vgui.slider_float(id .. "__a", "A", 0, 1, val[4] or 1.0, "%.2f")
    local new_val = {r, g, b, a}
    _set(id, new_val)
    return new_val
end

print("[vgui] loaded")