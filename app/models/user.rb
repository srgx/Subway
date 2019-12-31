class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :account
  has_many :articles

  def gold
    self.account.gold
  end

  def silver
    self.account.silver
  end

  def wood
    self.account.wood
  end
end
