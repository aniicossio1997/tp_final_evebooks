class UserSerializer
  include FastJsonapi::ObjectSerializer
  # attributes :email, :create, :"app/serializers/user_serializer.rb"
  #include FastJsonapi::ObjectSerializer

  attributes :email
  has_many :books
end
