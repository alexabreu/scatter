class PlayersController < ApplicationController
  respond_to :json
  
  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end
  
  def session
  	respond_with( { session: request.session_options[:id] } )
  end
end
