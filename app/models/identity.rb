class Identity < ActiveRecord::Base
  devise :rememberable, :trackable

  def to_sym
    self.class.name.underscore.to_sym
  end
end