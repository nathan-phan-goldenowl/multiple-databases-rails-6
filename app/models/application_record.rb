class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # connects_to database: { writing: :primary, reading: :primary_replica }

  connects_to shards: {
    default: { writing: :primary, reading: :primary_replica },
    shard_one: { writing: :aurora, reading: :aurora_replica }
  }
end
