class AlbumsController < ApplicationController
  before_filter :authenticate_user
  
  def index
    data = JSON.load(RestClient.get("https://picasaweb.google.com/data/feed/api/user/default", {params: {alt: 'json'}, 'Authorization' => "OAuth #{current_user.oauth_token}", 'GData-Version' => 2}))
    @albums = data["feed"]["entry"].map{|e| {title: e["title"]["$t"], id: e["gphoto$id"]["$t"]}}
  end
end
