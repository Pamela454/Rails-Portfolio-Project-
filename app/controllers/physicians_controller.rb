class PhysiciansController < ApplicationController

  private

  def physician_params
    params.require(set_type.to_sym).permit(:npi, :specialty)
  end
end
