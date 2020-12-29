json.extract! docket, :id, :equipment_no, :customer_reference_no, :seal_no, :description, :return_empty, :deliver_to_id, :collect_from_id, :hazardous_good_id, :created_at, :updated_at
json.url docket_url(docket, format: :json)
