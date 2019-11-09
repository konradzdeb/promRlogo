# Notes -------------------------------------------------------------------

# Generate logo for the promR package

# Settings ----------------------------------------------------------------

# Libs
library(hexSticker)
library(magick)


# Download ----------------------------------------------------------------

# Download image, marked as for reuse and modification
if (!file.exists("torch.png")) {
    download.file(url = "https://cdn.pixabay.com/photo/2016/11/22/11/49/flashlight-1849092_960_720.png",
                  destfile = "torch.png")
}

# Image -------------------------------------------------------------------

torch <- image_read(here::here("torch.png"))
# torch <- image_fill(image = torch, color = "#8b0000", fuzz = 20, point = "+384+444")
torch <- image_rotate(torch, -38)
torch <- image_crop(image = torch, geometry = "500x700+100")
torch <- image_scale(torch, "200")
torch <- image_transparent(torch, color = "white")
image_scale(torch, "80")


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
    s_height = 1.3,
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

promR_logo

file.copy(
    from = here::here("logo.png"),
    to = fs::path_wd("..", "promR", "man", "figures", "logo.png"),
    overwrite = TRUE
)
