module Attachinary
  class File
    include ::Neo4j::ActiveNode
    include ::Neo4j::Timestamps
    include FileMixin
    
    belongs_to :attachinariable, polymorphic: true
  end
end
