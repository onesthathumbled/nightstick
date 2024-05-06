module VtApi
  require 'httparty'

  BASE_URL = ENV['BASE_URL'].freeze
  API_KEY = ENV['API_KEY'].freeze

  # Upload a file for scanning
  def self.upload_file(file_path)
      response = HTTParty.post(
        "#{BASE_URL}/files",
        headers: {
          'x-apikey': API_KEY,
          'Content-Type': 'multipart/form-data'
        },
        body: {
          file: File.new(file_path, 'rb')
        }
      )
  
      if response.success?
        analysis_id = JSON.parse(response.body)['data']['id']
        get_analysis(analysis_id)
      else
        raise "Error uploading file: #{response.code} - #{response.message}"
      end
  end

  def self.get_analysis(analysis_id)
    response = HTTParty.get(
      "#{BASE_URL}/analyses/#{analysis_id}",
      headers: {
        'x-apikey': API_KEY,
        'Content-Type': 'application/json'
      }
    )

    if response.success?
      JSON.parse(response.body)
    else
      raise "Error getting analysis: #{response.code} - #{response.message}"
    end
  end
  
  # Get a file report by hash
  def self.upload_hash(hash)
    response = HTTParty.get(
      "#{BASE_URL}/files/#{hash}",
      headers: {
        'x-apikey': API_KEY
      }
    )

    if response.success?
      JSON.parse(response.body)
    else
      raise "Error uploading URL: #{response.code} - #{response.message}"
    end
  end

  # Scan URL
  def self.upload_url(url)
    response = HTTParty.post(
      "#{BASE_URL}/urls",
      headers: {
        'x-apikey': API_KEY
      },
      body: {
        url: url
      }
    )

    if response.success?
      JSON.parse(response.body)
    else
      raise "Error uploading URL: #{response.code} - #{response.message}"
    end
  end

  # Get an IP address report
  def self.upload_ip(ip)
    response = HTTParty.get(
      "#{BASE_URL}/ip_addresses/#{ip}",
      headers: {
        'x-apikey': API_KEY
      }
    )

    if response.success?
      JSON.parse(response.body)
    else
      raise "Error uploading URL: #{response.code} - #{response.message}"
    end
  end
end