class AuroraRecord < ActiveRecord::Base
  self.abstract_class = true

  connects_to database: { writing: :aurora, reading: :aurora_replica }
end
