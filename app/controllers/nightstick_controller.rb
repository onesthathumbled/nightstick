require_relative '../lib/virus_total_api.rb'

class NightstickController < ApplicationController

    # Upload a file for scanning
    def files
        uploaded_file = params[:file]
        result = VirusTotalAPI.upload_file(uploaded_file.tempfile.path)
        render json: result
    rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
    end

    # Get a file report by hash
    def hashes
        uploaded_hash = params[:hash]
        result = VirusTotalAPI.upload_hash(uploaded_hash)
        render json: result
      rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
    end
    
    # Scan URL
    def urls
        uploaded_url = params[:url]
        result = VirusTotalAPI.upload_url(uploaded_url)
        render json: result
      rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
    end

    # Get an IP address report
    def ips
        uploaded_ip = params[:ip]
        result = VirusTotalAPI.upload_ip(uploaded_ip)
        render json: result
      rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
    end
end
