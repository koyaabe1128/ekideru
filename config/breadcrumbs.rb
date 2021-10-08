crumb :root do
  link "Home", search_places_path
end

crumb :destination do
  link "目的地一覧", destination_places_path
  parent :root
end
crumb :exit do
  link "出口一覧", exits_path
  parent :root
end

crumb :place_show do
  link Place.find(params[:id]).name
  parent :destination
end

crumb :exit_show do
  link Exit.find(params[:id]).number
  parent :exit
end