class SwapfontController < ApplicationController

  before_action :authenticate_user

  def get
    filename = 'font5.ttf'
    path = Rails.root.join('fonts', filename)
    send_file(path, type: 'application/x-font-ttf', filename: 'myfont.ttf')
  end

end
