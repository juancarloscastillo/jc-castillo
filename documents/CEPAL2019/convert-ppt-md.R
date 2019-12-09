devtools::install_github("datalorax/slidex")

library(slidex)

pptx <- system.file("examples", "slidedemo.pptx", package = "slidex")



slidex::convert_pptx(path = "originales/ppt-MLM.pptx")

# no funciona con encoding es-CL, solamente con en-US