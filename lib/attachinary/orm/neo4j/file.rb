module Attachinary
  class File
    include ::Neo4j::ActiveNode
    include ::Neo4j::Timestamps
    include FileMixin
    
    has_one :out, :attachinariable, type: 'attachinariable', model_class: false
  end
end
