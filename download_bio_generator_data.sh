
###################################################
###Download Biomass Power Generators	       ####
###################################################


#!/bin/bash

# Overpass over the commandline

#wget download data via the Overpass API
# Biogenerators
wget -O power_generator.osm https://overpass-api.de/api/xapi?node[generator:source=biogas][bbox=-24.00,40.00,43.00,66.00]

# Farmyards for cattle. Farmyard feedloot for intensive cattle raising. 
wget -O farmyards.osm https://overpass-api.de/api/xapi?node[landuse=farmyard][bbox=-24.00,40.00,43.00,66.00]

#Convert .osm to shape file. Generates a folder with all OSM nodes, ways. 
ogr2ogr -f "ESRI Shapefile" /media/hatschito/35B72C99231E1530/Harald/projects_harald/qgis_projects_harald/Aura_Biomass_generation_Chapter/power_generator power_generator.osm -explodecollections

ogr2ogr -f "ESRI Shapefile" /media/hatschito/35B72C99231E1530/Harald/projects_harald/qgis_projects_harald/Aura_Biomass_generation_Chapter/farmyards farmyards.osm -explodecollections

cd /media/hatschito/35B72C99231E1530/Harald/projects_harald/qgis_projects_harald/Aura_Biomass_generation_Chapter/power_generator


# Select by attributes in the converted shapefile
# ogr2ogr -sql "SELECT * FROM infile WHERE ID='1'" outfile.shp infile.shp


#Reproject to UTM 32
#t -ogr2ogr_srs EPSG:25833 icecream_shops_UTM33.shp ice/points.shp -overwrite

#Grid the data
#gdal_grid -l icecream_shops_UTM33 -a count:radius1=1000:radius2=1000:angle=0:min_points=0:nodata=0 -ot Float32 icecream_shops_UTM33.shp #ice_cream_shops_4000_4000_mean.tif
