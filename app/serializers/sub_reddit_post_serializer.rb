class SubRedditPostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
end
