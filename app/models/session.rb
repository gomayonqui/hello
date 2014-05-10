class Session < ActiveRecord::Base
  include Hello::SessionModel

  def device_name
    ua.split('(').second.split(')').first rescue ua
  end
end
