module Attachinary
  class File
    include ::Neo4j::ActiveNode
    include FileMixin
    
    belongs_to :attachinariable, polymorphic: true
  end
end
