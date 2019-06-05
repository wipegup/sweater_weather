class FlickrFacade < BaseFacade
  include ApiService::ConvenienceMethods
  def self.landscape(location)
    {url: flickr.landscape(location)}
  end

  private

  def self.flickr
    @_flickr_service ||= FlickrService.new
  end

end
