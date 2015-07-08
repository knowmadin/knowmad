module DeviseIdentity
  extend ActiveSupport::Concern

  included do
    devise :rememberable, :trackable
  end

  def to_sym
    model_name.to_sym
  end
end
