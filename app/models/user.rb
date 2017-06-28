class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lists
  has_many :reviews, dependent: :destroy
  has_many :accounts
  has_many :cash_purchase
  has_many :credit_purchase


end
