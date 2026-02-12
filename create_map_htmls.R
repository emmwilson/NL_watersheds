pacman::p_load(shiny,
               tidyverse,
               quarto,
               terra,
               purrr,
               glue)

watersheds <- vect("data/spatial data/NL_subsubbasins.shp") |>  
  project("EPSG:4326 - WGS 84") 

watershed_df <- tibble(
  output_format = "html",
  output_file = paste0("map_", watersheds$watershed, ".html"),
  execute_params = map(watersheds$watershed, ~list(watershed = .x))
)

# i think this may need to be rerun everytime I change things?

purrr::pwalk(
  .l = watershed_df,            # Dataframe to map over
  .f = quarto::quarto_render,   # Quarto render function
  input = "param_maps.qmd",       # Named arguments of .f
  .progress = TRUE              # Optionally, show a progress bar
)

# quarto::quarto_render(
#   input = "param_maps.qmd",
#   execute_params = list(
#     watershed = "Strait of Belle Isle - South Shore"
#   ),
#   output_file = "map_Strait of Belle Isle - South Shore.html",
#   output_format = "html"
# )
