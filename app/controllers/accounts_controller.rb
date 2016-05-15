class AccountsController < ApplicationController
  def index
    @accounts = salesforce.query("select Id, Name, Website, Phone from Account")
  end

  def show
    @account = salesforce.find("Account", params[:id])
  end

  def edit
    @account = salesforce.find("Account", params[:id])
  end

  def new
  end

  def create
    @account = salesforce.create("Account")
  end

  def update
    @account = salesforce.update("Account")
  end

  def destroy
    @account = salesforce.find("Account", params[:id])
    @account.destroy!

    redirect_to accounts_path
  end

  private

  def salesforce
    Salesforce.instance.restforce
  end
end
