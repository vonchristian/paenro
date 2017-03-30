module Clients
  class ClientRequirement < ApplicationRecord
    belongs_to :client
    belongs_to :requirement
  end
end
