class ValidatedItem < Item
  self.table_name = "items"
  validates_presence_of :title
end
