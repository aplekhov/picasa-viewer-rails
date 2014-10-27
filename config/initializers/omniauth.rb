OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '<Add here>', '<Add here>', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}, scope: 'https://picasaweb.google.com/data/,https://www.googleapis.com/auth/userinfo.profile', access_type: 'offline', prompt: 'consent'}
end
