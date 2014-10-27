class PhotosController < ApplicationController
  before_filter :authenticate_user

  def index
    data = JSON.load(RestClient.get("https://picasaweb.google.com/data/feed/api/user/default/albumid/#{params[:album_id]}", {params: {'max-results' => 3,alt: 'json'}, 'Authorization' => "OAuth #{current_user.oauth_token}", 'GData-Version' => 2}))
    @photos = data["feed"]["entry"].map{|e| {src: e["content"]["src"], id: e["gphoto$id"]["$t"]}}
    @album_title = data["feed"]["title"]["$t"]
  end

  def add_comment
    xml = <<-XML 
    <entry xmlns='http://www.w3.org/2005/Atom'>
	    <content>#{params[:comment]}</content>
      <category scheme='http://schemas.google.com/g/2005#kind'
        term='http://schemas.google.com/photos/2007#comment'/>
    </entry>
    XML
    url = "https://picasaweb.google.com/data/feed/api/user/default/albumid/#{params[:album_id]}/photoid/#{params[:id]}"
    resp = RestClient.post(url, xml, {content_type: 'application/atom+xml', 'Authorization' => "OAuth #{current_user.oauth_token}"})
    render nothing: true, status: :ok
  end
end
