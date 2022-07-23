# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'byebug'

User.destroy_all
Song.destroy_all
Playlist.destroy_all

#Song API



url = URI("https://deezerdevs-deezer.p.rapidapi.com/search?q=drake")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'deezerdevs-deezer.p.rapidapi.com'
request["x-rapidapi-key"] = ENV['pusher_key']

response = http.request(request)

#Song Seeds

songs_array = JSON.parse(response.read_body)['data']
    
songs_array.each do |song_obj|
    title= song_obj['title']
    preview= song_obj['preview']
    cover= song_obj['album']['cover']
    artist= song_obj['artist']['name']
    Song.create(cover: cover, title: title, artist: artist, preview: preview)
end

#User Seeds

User.create(username:'RBRNFRVR', password:'1234')
#  EXISTING USER

#Playlist Seeds

Playlist.create(name:'The Best')

#Between Seeds

Between.create(user: User.first, playlist: Playlist.first)

#Favorite Seeds

Favorite.create(song: Song.first, playlist: Playlist.first)


