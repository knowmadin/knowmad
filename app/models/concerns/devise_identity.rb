module DeviseIdentity
  extend ActiveSupport::Concern

  included do
    devise :rememberable, :trackable
  end

  def to_sym
    self.class.model_name.param_key.to_sym
  end
end
