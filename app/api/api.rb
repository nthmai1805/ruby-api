class API < Grape::API
  prefix 'api'
  format :json
  mount Acme::Ping
  mount Acme::Raise
  mount Acme::Protected
  mount Acme::Post
  mount V1::Add
end
