class AccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @accounts = salesforce.query("select Id, Name, Website, Phone from Account")
  end

  def show
    @account = salesforce.find("Account", params[:id])
  end

  def new
  end

  def create
    @account = salesforce.create(
      "Account",
      Name: params[:account][:name],
      Website: params[:account][:website],
      Phone: params[:account][:phone]
    )
    redirect_to accounts_path
  end

  def edit
    @account = salesforce.find("Account", params[:id])
  end

  def update
    @account = salesforce.update(
      "Account", 
      Id: params[:account][:id],
      Name: params[:account][:name],
      Website: params[:account][:website],
      Phone: params[:account][:phone]
    )
    redirect_to accounts_path
  end

  def destroy
    @account = salesforce.find("Account", params[:id])
    @account.destroy

    redirect_to accounts_path
  end

  private

  def salesforce
    Salesforce.instance.restforce
  end
end
