# Omniauth logout helper
#
# Source:: https://auth0.com/docs/quickstart/webapp/rails/01-login#install-the-dependencies
# Implementer(11/27/17):: Stephen

module LogoutHelper
  def self.logout_url(root_url)
    domain = Rails.application.secrets.auth0_domain
    client_id = Rails.application.secrets.auth0_client_id
    request_params = {
      returnTo: root_url,
      client_id: client_id
    }
    URI::HTTPS.build(host: domain, path: '/logout', query: to_query(request_params))
  end

  private
  def to_query(hash)
    hash.map { |k, v| "#{k}=#{URI.escape(v)}" unless v.nil? }.reject(&:nil?).join('&')
  end
end
