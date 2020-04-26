json.array! @events do |event|
    json.title event.name
    json.start event.stime
    json.end event.etime
    json.url place_url(event, format: :html)
end