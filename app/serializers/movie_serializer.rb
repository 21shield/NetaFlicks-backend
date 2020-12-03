class MovieSerializer < ActiveModel::Serializer
  attributes :movieId, :title, :director, :release_date, :description, :thumbs_up, :thumbs_down, :poster
end
