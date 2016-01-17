require 'attachinary/utils'

module Attachinary
  module Extension
    include Base

    def attachinary_orm_definition(options)
      if options[:single]
        # has_one :photo, ...
          has_one :out, :"#{options[:scope]}",
            type: 'attachinariable',
            model_class: ::Attachinary::File,
            dependent: :destroy
      else
        # has_many :images, ...
          has_many :out, :"#{options[:scope]}",
            type: 'attachinariable',
            model_class: ::Attachinary::File,
            dependent: :destroy
      end

      # alias_method "orig_photo=", "photo="
      # def photo=(input)
      #   input = Attachinary::Utils.process_input(input, upload_options)
      #   if input.nil?
      #     super(nil)
      #   else
      #     files = [input].flatten
      #     super(options[:single] ? files[0] : files)
      #   end
      # end
      alias_method "orig_#{options[:scope]}=", "#{options[:scope]}="
      define_method "#{options[:scope]}=" do |input, upload_options = {}|
        input = Attachinary::Utils.process_input(input, upload_options)
        if !input.nil?
          input = [input].flatten
          input = (options[:single] ? input[0] : input)
        end
        send("orig_#{options[:scope]}=", input)
      end
    end
  end
end
