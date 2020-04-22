json.array!(@places) do |place|
    json.extract! palce, :id, :name, :menu
    json.start place.stime
    json.end place.etime
    json.url place_url(place, format: :html)
end
