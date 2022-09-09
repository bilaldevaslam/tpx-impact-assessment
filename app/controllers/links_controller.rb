class LinksController < ApplicationController
  def short
    redirect_to Link.find_by_encoded_string!(params[:encoded_string]).url
  end
end
