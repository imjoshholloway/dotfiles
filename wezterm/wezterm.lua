local wezterm = require('wezterm');
return {
    color_scheme = "OneHalfDark";
    
    font_size = 15;
    font = wezterm.font("FiraCode Nerd Font");

    -- make sure left alt allows us to write symbols like '#'
    send_composed_key_when_left_alt_is_pressed=true,
    
}
