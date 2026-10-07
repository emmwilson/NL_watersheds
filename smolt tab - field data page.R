### Smolts

Describe data here...   

Click on a site to see the data collected. Link to download shapefile is [below map](#bottom3).   
  
  ```{r, palettes_smolt}
  #| include: false
  #| eval: false
  
  
  # smolt biomass
  smolt.pal <- colorNumeric(c("#dfdce3", "#A600E3", "#57106e"), domain = smolt_field$smolt)
  
  smolt.pal.leg <- colorNumeric(c("#dfdce3", "#A600E3", "#57106e"), domain = c(0, max(smolt_field$smolt, na.rm = T)), reverse = T) 
  
  
  
  # colour palette for predictor variable?
  
  pred1_sm_sm.pal <- colorNumeric(c("#F5DAEA", "#B34D63",  "#C2002A"), domain = smolt_field$pred)  
  
  pred1_sm_sm.pal.leg <- colorNumeric(c("#F5DAEA", "#B34D63",  "#C2002A"), domain = c(0, max(smolt_field$pred, na.rm = T)), reverse = T)  
  ```
  
  ```{r, popup_labels_smolt}
  #| include: false
  #| eval: false
  
  
  # adds information to popups for each reach when it is selected
  label_text_smolt <- glue("<b><u>Site data: {field_reaches$site_id}</u></b> <br/>",
                           "<b>Smolt biomass: </b> {round(field_reaches$smolt_bio, 1)} g<br/>", ## add one of these lines for each of the variables you would like in the popup
                           "<b>Predictor variable 1: </b> {round(field_reaches$pred1_sm_bio, 1)} units<br/>",
                           "<b>Predictor variable 2: </b> {round(field_reaches$pred2_sm_bio, 1)} units<br/>") |>
    lapply(htmltools::HTML)
  ```
  
  ```{r, map_smolt}
  #| echo: false
  #| column: screen 
  #| warning: false
  #| eval: false
  
  
  exploits_map_smolt <- exploits_map |>  
    addMapPane("data_smolt", zIndex = 450) |> 
    addMapPane("data_pred1", zIndex = 445) |> 
    
    ## smolt
    addCircleMarkers(data = smolt_field, lng = ~smolt_field$x, lat = ~smolt_field$y, fillColor = ~smolt.pal(smolt_field$smolt), options = pathOptions(pane = "data_smolt"), group = "Smolt caught", popup = ~label_text_smolt, radius = 4.5, fillOpacity = 1, opacity = 1, weight = 1, color = "#dfdce3") |>
    
    addLegend(
      position = 'topright', 
      pal = smolt.pal.leg,  # Use the reversed palette
      values = smolt_field$smolt, 
      title = "Smolt caught",
      group = "Smolt caught",
      labFormat = labelFormat(transform = function(x) sort(x, decreasing = TRUE)), # Reverse labels
      opacity = 1, na.label = "NA"
    )  |>  
    
    addCircleMarkers(data = smolt_field, lng = ~smolt_field$x, lat = ~smolt_field$y, fillColor = ~pred1_sm_sm.pal(smolt_field$smolt), options = pathOptions(pane = "data_fry"), group = "Pred", popup = ~label_text_smolt, radius = 4.5, fillOpacity = 1, opacity = 1, weight = 1, color = "#F5DAEA") |>
    
    addLegend(
      position = 'topright', 
      pal = pred1_sm_sm.pal.leg,  # Use the reversed palette
      values = smolt_field$pred, 
      title = "pred1_sm",
      group = "pred1_sm",
      labFormat = labelFormat(transform = function(x) sort(x, decreasing = TRUE)), # Reverse labels
      opacity = 1, na.label = "NA"
    )  |>  
    
    # ability to choose which layers to see
    addGroupedLayersControl(
      baseGroups = c("Satellite", "Topographic", "White & Grey"),
      overlayGroups = list(
        "Available layers" = c("smolt", "pred1")),
      position = "topleft",
      options = groupedLayersControlOptions(
        groupCheckboxes = FALSE,
        collapsed = FALSE,
        groupsCollapsable = FALSE,
        sortLayers = FALSE,
        sortGroups = FALSE,
        sortBaseLayers = FALSE,
        exclusiveGroups = c("Available layers")
      )
    )  |> 
    hideGroup(c("pred1"))
  
  exploits_map_smolt
  ```
  
  
  \
  
  <u><b>Desciption of map contents:</b></u>  
    
    Description of smolt data and data collection...  
  
  
  
  [Click here to download the Exploits River field data shapefile](https://github.com/emmwilson/NL_watersheds/blob/0d9a7a8e31f9d6fc5a61aac211dbf85ce949138c/data/spatial%20data/exploits_river_field_data.shp?raw=true)  
  
  <b>CABD barriers and areas past:</b>
    Potential barriers to upstream salmon movement were taken from the Canadian Aquatic Barriers Database. Barriers were filtered to remove barriers that are insufficient to impede movement: a fishway exists, barrier has been decommissioned/removed, barrier was a dam less than 5 m high, or barrier's Used for Network Analysis field was false. Any stream segment upstream of the barrier is considered potentially inaccessible. Many of these barriers may in fact be passable by salmon (e.g. passable rapid listed as waterfall) but we lack sufficient information to remove them from list the of potential barriers. Therefore, each barrier must be assessed on an individual basis if being incorporated into management or research plans.       
  
Citation: ...  
  
<div id="bottom3"></div>