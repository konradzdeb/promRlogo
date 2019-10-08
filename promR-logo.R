# Notes -------------------------------------------------------------------

# Generate logo for the promR package

# Settings ----------------------------------------------------------------

# Libs
library(hexSticker)
library(magick)


# Download ----------------------------------------------------------------

# Download image, marked as for reuse and modification
if (!file.exists("torch.svg")) {
    download.file(url = "https://svgsilh.com/svg/1133865.svg",
                  destfile = "torch.svg")
}

# Image -------------------------------------------------------------------

torch <- image_read(here::here("torch.svg"))
torch <- image_fill(image = torch, color = "#8b0000", fuzz = 20, point = "+384+444")
image_scale(torch, "75")


# Package logo ------------------------------------------------------------

sticker(
    torch,
    package = "promR",
    p_size = 7,
    h_fill = "#ffffff",
    h_color = "#cc7000",
    p_color = "#003366",
    s_x = 1,
    s_y = .75,
    s_width = 1.3,
    s_height = 1,
    filename = here::here("logo.png"),
    spotlight = FALSE
)

# Resize ------------------------------------------------------------------

promR_logo <- image_read(here::here("logo.png"))
promR_logo <- image_scale(promR_logo, "90")
image_write(
    image = promR_logo,
    path = here::here("logo.png"),
    format = "png"
)
