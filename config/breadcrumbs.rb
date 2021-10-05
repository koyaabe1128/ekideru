crumb :root do
  link "Home", search_places_path
end

crumb :destination do
  link "目的地", destination_places_path
  parent :root
end
crumb :exit do
  link "出口", exit_places_path
  parent :root
end

crumb :place_show do
  link Place.find(params[:id]).name
  parent :destination
end