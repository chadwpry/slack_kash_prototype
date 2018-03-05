class IdentitySerializer < ActiveModel::Serializer
  attributes :id, :provider, :scope, :access_token
end
