crumb :root do
  link "Home", search_places_path
end

crumb :building do
  link "建物", building_places_path
  parent :root
end

crumb :landmark do
  link "目印", landmark_places_path
  parent :root
end

crumb :place_show do
  link Place.find(params[:id]).name
  if Place.find(params[:id]).kind == "建物・店"
    parent :building
  else
    parent :landmark
  end
  
end