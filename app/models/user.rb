class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :account
  has_many :articles

  after_create :create_account

  def gold
    self.account.gold
  end

  def silver
    self.account.silver
  end

  def wood
    self.account.wood
  end

  private
    def create_account
      self.account = Account.new(gold:300,silver:200,wood:100)
    end
end
