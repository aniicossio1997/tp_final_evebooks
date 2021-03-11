class BookSerializer
  include FastJsonapi::ObjectSerializer
  #attributes :title, :create, :"app/serializers/product_serializer.rb"
  attributes :title
  belongs_to :user
end
