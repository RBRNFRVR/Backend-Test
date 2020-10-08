class Song < ApplicationRecord
has_many :favorites
has_many :playlists, through: :favorites

end
