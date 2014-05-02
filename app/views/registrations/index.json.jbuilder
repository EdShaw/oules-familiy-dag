json.array!(@registrations) do |registration|
  json.extract! registration, :id, :person, :person_id
  json.url registration_url(registration, format: :json)
end
