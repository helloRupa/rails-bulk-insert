class BandsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Band.all
  end

  def create
    bands = Band.insert_all_normalized(bands_params, returning: [:id, :name, :members])

    if bands.kind_of?(ActiveRecord::Result)
      render json: bands
    else
      render json: {
        status: 422,
        error: bands
      }, status: 422
    end
  end

  private

  def bands_params
    params.permit(bands: [:name, :members]).require(:bands)
  end
end