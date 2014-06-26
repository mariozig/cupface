class FacesController < ApplicationController
  def index
    @faces = Face.all
  end

  def show
    @face = Face.find(params[:id])
  end

  def new
    @face = Face.new
  end

  def create
    @face = Face.new(face_params)

    respond_to do |format|
      if @face.save
        format.html { redirect_to @face, notice: 'Face was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def face_params
      params.require(:face).permit(:match_id, :player_id, :image, :game_minute)
    end

end
