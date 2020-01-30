class SwapfontController < ApplicationController

  before_action :authenticate_user

  def show
    @serial_num = @current_user.font.swapfont
    filename = "font-#{@serial_num}.ttf"
    path = Rails.root.join('swapped-font', filename)
    send_file(path, type: 'application/x-font-ttf', filename: "myfont#{Time.zone.now.hash}.ttf")
  end

end
