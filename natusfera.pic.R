
natusfera.pic <- 
  
  function(file.path, pic.size){
  natdf <- read.csv(file.path)
  im_url <- as.character(natdf$image_url)
  im_url <- gsub("medium", pic.size, im_url)
  id <- natdf$id[nchar(im_url)>0]
  sp <-  as.character(natdf$scientific_name[nchar(im_url)>0])
  im_url <- im_url[nchar(im_url)>0]
  photo_name <- paste0(id,"-", sp, ".jpg")
  if(!file.exists("observation_pics_natusfera")){
    dir.create("observation_pics_natusfera")}
    setwd("./observation_pics_natusfera")
    lapply(1:length(im_url), function(i) download.file(im_url[i], photo_name[i], mode = 'wb'))
    }