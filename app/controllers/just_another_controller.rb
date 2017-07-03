class JustAnotherController < ApplicationController
  before_action :authorize, only: [:new, :create]

  def secret
  end

end
