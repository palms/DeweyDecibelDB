class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  # GET /playlists
  # GET /playlists.json
  def index
    @playlists = Playlist.all
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
  end

  # GET /playlists/new
  def new
      @playlist = Playlist.new
    
      @songs = Song.order(:artist)

      respond_to do |format|
      format.html
      # json for all songs specified by query param q
      format.json { render json: @songs.tokens(params[:q]) }
      end
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists
  # POST /playlists.json
  def create
    
    @playlist = Playlist.new(playlist_params)

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to playlists_path, notice: 'Playlist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @playlist }
      else
        format.html { render action: 'new' }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def showBox
        @playlistID = params[:playlistID]
        
        @playlist = Playlist.find(@playlistID)
  end
  

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    
    #@songs = Song.order(:artist)
    @playlist = Playlist.find(params[:id])
    
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to playlists_path, notice: 'Playlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_path }
      format.json { head :no_content }
    end
  end


  def remove_song
    #@playlist.find(params[:
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:users, :title, :qDrive, :notes, :song_tokens, :user_id)
      # EDITED FROM user_id
    end
end
