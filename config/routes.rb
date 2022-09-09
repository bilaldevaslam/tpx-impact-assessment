Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  
  get '/*encoded_string', to: 'links#short', as: :short
  draw(:api_v1)
end
