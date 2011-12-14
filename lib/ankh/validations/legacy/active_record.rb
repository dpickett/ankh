module Ankh
  module Validations
    module Legacy
      module ActiveRecord
        def extended(base)
          base.class_attribute :_validators
        end
      
        def validates_with(*args, &block)
          _validators ||= {}
        
          options = args.extract_options!
          args.each do |klass|
            validator = klass.new(options, &block)
            validator.setup(self) if validator.respond_to?(:setup)

            if validator.respond_to?(:attributes) && !validator.attributes.empty?
              validator.attributes.each do |attribute|
                _validators[nil] ||= []
                _validators[attribute.to_sym] << validator
              end
            else
              _validators[nil] ||= []
              _validators[nil] << validator
            end

            validate(validator, options)
          end
        end
      
        private
        def _merge_attributes(attr_names)
          options = attr_names.extract_options!
          options.merge(:attributes => attr_names.flatten)
        end
      end
    end
  end
end
