pacman::p_load(shiny,
               tidyverse,
               quarto)

watersheds <- vect("data/spatial data/NL_subsubbasins.shp") |>  
  project("EPSG:4326 - WGS 84") 

watershed_df <- data.frame(output_format = "html",
                   output_file = paste0("map_", watersheds$watershed, ".html"),
                   execute_params = paste0('watershed = "', watersheds$watershed, '"'))


purrr::pwalk(
  .l = watershed_df,            # Dataframe to map over
  .f = quarto::quarto_render,   # Quarto render function
  input = "param_maps.qmd",       # Named arguments of .f
  .progress = TRUE              # Optionally, show a progress bar
)

quarto::quarto_render(
  input = "param_maps.qmd",
  execute_params = list(
    watershed = "Gander"
  ),
  output_file = "map_Gander.html",
  output_format = "html"
)
