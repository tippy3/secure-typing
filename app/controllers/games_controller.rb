class GamesController < ApplicationController

  before_action :authenticate_user

  Dir["#{Rails.root.to_s}/swapped-font-table/*.rb"].each do |file|
    require file
  end

  def index
    @serial_num = rand(1..3)
    @current_user.font.swapfont = @serial_num
    @current_user.font.save
    @table = eval("TABLE#{@serial_num}")
    @text = "hungry"
    @new_text = @text.gsub(/[A-Za-z]/, @table )
  end

  def show
    @serial_num = rand(1..3)
    @current_user.font.swapfont = @serial_num
    @current_user.font.save
    @table = eval("TABLE#{@serial_num}")
    @text = "hungry"
    @new_text = @text.gsub(/[A-Za-z]/, @table )
  end

end
