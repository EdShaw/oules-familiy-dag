json.array!(@parent_ofs) do |parent_of|
  json.extract! parent_of, :parent_id, :child_id
end
