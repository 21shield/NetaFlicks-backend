class MovieSerializer < ActiveModel::Serializer
  attributes :movieId, :title, :director, :release_date, :overview, :thumbs_up, :thumbs_down, :poster
end
