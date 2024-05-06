require_relative '../lib/vt_api.rb'

class NightstickController < ApplicationController

    # Upload a file for scanning
    def files
        uploaded_file = params[:file]
        result = VtApi.upload_file(uploaded_file.tempfile.path)
        render json: result
    rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
    end

    # Get a file report by hash
    def hashes
        uploaded_hash = params[:hash]
        result = VtApi.upload_hash(uploaded_hash)
        render json: result
      rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
    end
    
    # Scan URL
    def urls
        uploaded_url = params[:url]
        result = VtApi.upload_url(uploaded_url)
        render json: result
      rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
    end

    # Get an IP address report
    def ips
        uploaded_ip = params[:ip]
        result = VtApi.upload_ip(uploaded_ip)
        render json: result
      rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
    end
end
