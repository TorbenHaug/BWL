json.array!(@bill_entries) do |bill_entry|
  json.extract! bill_entry, :id, :amount
  json.url bill_entry_url(bill_entry, format: :json)
end
