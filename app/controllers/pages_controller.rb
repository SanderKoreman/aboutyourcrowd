class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :uikit, :test]

  def home
  end

  def uikit
  end

  def test
  end
end
