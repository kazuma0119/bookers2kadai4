class UsersController < ApplicationController
  has_many :books, dependent: :destroy
end
