Template code to create a GitPage for salmon resource predictions

Author/developer: Emmerson Wilson (emmerson.r.wilson@gmail.com)

Contents:

- Control Website:
  - index.qmd: Home page with project information
  - Sliders.qmd: Input variables controlled by sliders to create predictions of response variables
  - Exploits_map.qmd: Map with predictions of response variables for reaches sampled for Exploits watershed, NL
  - Exploits_map2.qmd: Map with predictions of response variables from HydroSHEDs data for Exploits watershed, NL
  - Rocky_map.qmd: Map with predictions of response variables from HydroSHEDs data for Rocky River watershed, NL
  - TerraNova_map2.qmd: Map with predictions of response variables from HydroSHEDs data for Terra Nova watershed, NL
  - _quarto.yml: Rendering source, which pages included in site, universal themes

  - Requirements:
    - Git
    - quarto-live
    - data folder with pngs and shapefiles
    - GitPage source as docs folder from main branch

 
- Tutorial:
  - tutorial.qmd: Quarto presentation that explains how the code works and how you can customize the code to make your own version of the website. To view the presentation open in RStudio and click render

  - Requirements:
    - quarto-drop
    - data folder with 'for webpage' folder containing pngs for tutorial

- data:
  - pngs for Slide.qmd
  - /spatial data: shapefiles for []_map.qmd in 
    - Exploits_lakes.shp: lakes in Exploits watershed
    - OrderSlopeSegJan22.shp: waterways created using DEM by Kyleisha Foote
    - exploits_reaches_with_sites.shp: reaches from OrderSlopeSegJan22.shp that had a sample site, and the corresponding field data collected at that site
    - exploits_watershed.shp: Exploits watershed area
    - exploits_hydroatlas.shp: waterways created by HydroRivers, with HydroATLAS data, for Exploits River watershed
    - rocky_hydroatlas.shp: waterways created by HydroRivers, with HydroATLAS data for Rocky River watershed
    - rocky_lakes.shp: lakes in Rocky River watershed
    - rocky_watershed.shp: Rocky River watershed area
    - Terranova_basin.shp: Terra Nova river watershed area
    - Terranova_lakes.shp: lakes in Terra Nova watershed
    - Terranova_rivers.shp: waterways created by HydroRivers, with HydroATLAS data for Terra Nova watershed
  -/for webpage: pngs used in tutorial

- docs: created and updated upon render

- _site: created and updated upon render

- _extensions: created and updated by quarto-live upon render

- style.css: empty

- about.qmd: empty
