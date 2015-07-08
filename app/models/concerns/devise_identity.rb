module DeviseIdentity
  extend ActiveSupport::Concern

  included do
    devise :rememberable, :trackable
  end

  def to_sym
    self.class.name.underscore.to_sym
  end
end
