class Playlist < ApplicationRecord
has_many :betweens
has_many :users, through: :betweens
has_many :favorites
has_many :songs, through: :favorites
end
