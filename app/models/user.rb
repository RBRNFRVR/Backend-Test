class User < ApplicationRecord
has_many :betweens
has_many :playlists, through: :betweens
end