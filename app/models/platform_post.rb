class PlatformPost < ApplicationRecord
  belongs_to :post
  belongs_to :platform

  def name=(name)
    platform = Platform.find_or_create_by(:name => name)
    self.platform = platform
  end

  def name
    self.platform.name if self.platform
  end 
end
