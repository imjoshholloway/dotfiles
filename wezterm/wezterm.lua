local wezterm = require('wezterm');
return {
    color_scheme = "OneHalfDark";

    font_size = 15;
    font = wezterm.font("FiraCode Nerd Font");

    window_padding = {
        -- This will become the scrollbar width if you have enabled the scrollbar!
        top = 1,
    },

    hide_tab_bar_if_only_one_tab = true,

    -- make sure left alt allows us to write symbols like '#'
    send_composed_key_when_left_alt_is_pressed = true,
}
