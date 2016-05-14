class Salesforce
  include Singleton

  def restforce
    client ||= Restforce.new :oauth_token => ENV["SALESFORCE_OAUTH_TOKEN"],
        :refresh_token           => ENV["SALESFORCE_REFRESH_TOKEN"],
        :instance_url            => ENV["SALESFORCE_INSTANCE_URL"],
        :client_id               => ENV["SALESFORCE_CLIENT_ID"],
        :client_secret           => ENV["SALESFORCE_CLIENT_SECRET"],
        :authentication_callback => Proc.new {|x| Rails.logger.debug x.to_s}
  end
end
