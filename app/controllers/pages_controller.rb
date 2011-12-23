class PagesController < ApplicationController

  def help
  end

  def home
    @a = 'main.css'
    @b = 'thickbox.css'
    @c = 'reset.css'
  end

  def stats
  end

end
