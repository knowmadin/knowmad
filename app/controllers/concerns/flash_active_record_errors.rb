module FlashActiveRecordErrors
  extend ActiveSupport::Concern

  module ClassMethods
    def add_active_record_errors_to_flash(*actions)
      actions.each do |action|
        define_method(action) do
          super(
            &proc do |resource|
              if resource.errors.any?
                flash[:error] = resource.errors.full_messages.to_sentence
              end
            end
          )
        end
      end
    end
  end
end
