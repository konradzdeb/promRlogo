# Notes -------------------------------------------------------------------

# Generate logo for the promR package


# Download ----------------------------------------------------------------

# Download image, marked as for reuse and modification
if (!file.exists("logo.svg")) {
    download.file(url = "https://svgsilh.com/svg/1133865.svg",
                  destfile = "logo.svg")
}
