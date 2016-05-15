class Account
  def sample_query
    connect_to_salesforce.query("select id, name from account")
  end

  private

  def connect_to_salesforce
    Salesforce.instance.restforce
  end
end
