require 'neo4j'
require_relative 'file_mixin'
require_relative 'base_extension'
require_relative 'neo4j/extension'
require_relative 'neo4j/file'

Neo4j::ActiveNode::ClassMethods.send :include, Attachinary::Extension
