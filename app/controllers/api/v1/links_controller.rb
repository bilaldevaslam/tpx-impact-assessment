module Api
  module V1
    class LinksController < ApiController
      
      def decode
        render_response(url: Link.lengthen(resource_params[:url]))
      end

      def encode
        render_response(url: Link.shorten(resource_params[:url], resource_params[:encoded_string]))
      end

      private
      def resource_params
        params.permit(
          :url, :encoded_string 
        )
      end
    end
  end
end
