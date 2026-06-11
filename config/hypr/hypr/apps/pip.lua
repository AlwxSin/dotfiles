-- Picture-in-picture overlay
hl.window_rule({
    name            = "pip",
    match           = { title = "(Picture.{0,1}in.{0,1}[Pp]icture)" },
    float           = true,
    pin             = true,
    size            = "600 338",
    keep_aspect_ratio = true,
    border_size       = 0,
    opacity         = "1 1",
    move            = "100%-w-40 4%",
})
