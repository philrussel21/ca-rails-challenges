class CelebritiesController < ApplicationController
  before_action :setup_data

  def index
    @celebrities
  end

  def show
    @celebrity = params
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
    def setup_data
      session[:celebrities] = [
        { "name" => "Lindsay Lohan", "notability" => "Parent Trap" },
        { "name" => "Adam Sandler", "notability" => "Big Daddy" },
        { "name" => "Rob Schnider", "notability" => "Adam Sandler" }
    ] unless session[:celebrities]

    @celebrities = session[:celebrities]
    end
end
