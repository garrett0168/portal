class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :uploadable_items, inverse_of: :user, dependent: :nullify

  def admin?
    self.admin
  end
end
