class HotelsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :init_data, :init_confirm
  after_action :exit_message

  def home
  end

  def index
  end

  private
  def init_data
    @data = [
      {name: "Hotel Transylvania", capacity: 100},
      {name: "Hotel 626", capacity: 626}
    ]
  end

  def init_confirm
    puts "Default Data Initialized."
  end

  def exit_message
    puts "This is the end of the message."
  end

end
