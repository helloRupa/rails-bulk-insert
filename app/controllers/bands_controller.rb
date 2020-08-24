class BandsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Band.all
  end

  def create
    bands = Band.insert_all(bands_params, returning: [:id, :name, :members])
  
    render json: bands
  end

  private

  def bands_params
    params.permit(bands: [:name, :members]).require(:bands)
  end
end