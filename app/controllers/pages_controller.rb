class PagesController < ApplicationController
  def feed
    @posts     = Post.all
    # @playlists = Playlist.all
    # @songs     = Song.all
  end

  def home
    @posts     = current_user.posts
    # @playlists = current_user.playlists
    # @songs     = current_user.songs
  end
end
