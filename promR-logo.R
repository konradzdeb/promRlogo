# Notes -------------------------------------------------------------------

# Generate logo for the promR package

# Settings ----------------------------------------------------------------

# Libs
library(hexSticker)
library(magick)

# Image -------------------------------------------------------------------

torch <- image_read(here::here("torch.png"))
torch <- image_negate(torch)

# Package logo ------------------------------------------------------------

sticker(
    torch,
    package = "promR",
    p_size = 25,
    h_fill = "#F9812A",
    h_color = "#000000",
    p_color = "#FFFFFF",
    p_y = 0.55,
    s_x = 1,
    s_y = 1.1,
    s_width = 1.65,
    s_height = 1.65,
    filename = here::here("logo.png"),
    spotlight = FALSE
)

# Resize ------------------------------------------------------------------

promR_logo <- image_read(here::here("logo.png"))
promR_logo <- image_scale(promR_logo, "200")
image_write(
    image = promR_logo,
    path = here::here("logo.png"),
    format = "png"
)

promR_logo
