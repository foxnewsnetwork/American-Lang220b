module AdsHelper
  def findCorp id
     return Corporation.find(id)
  end

end
