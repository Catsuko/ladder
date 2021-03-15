class Profile
  include ActiveModel::Model

  USER_ENDPOINT = 'https://canary.discord.com/api/v8/users/%{id}'.freeze
  DISCORD_CDN = 'https://cdn.discordapp.com/avatars/%{id}/%{avatar_hash}.jpg'.freeze

  def initialize(id)
    @id = id
  end

  def name
    attributes.fetch(:username)
  end

  def avatar
    DISCORD_CDN % { id: @id, avatar_hash: attributes.fetch(:avatar) }
  end

private

  def attributes
    @attributes ||= load_attributes
  end

  def load_attributes
    http_client = Net::HTTP.new(endpoint.host, endpoint.port)
    http_client.use_ssl = true
    http_client.verify_mode = OpenSSL::SSL::VERIFY_PEER
    info_request = Net::HTTP::Get.new(endpoint.request_uri)
    info_request['Authorization'] = "Bot #{Rails.application.credentials.discord[:token]}"
    JSON.parse(http_client.request(info_request).body).symbolize_keys
  end

  def endpoint
    @endpoint ||= URI(USER_ENDPOINT % { id: @id })
  end
end
