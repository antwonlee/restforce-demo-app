class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contacts = salesforce.query("select Id, Name, Email from Contact")
  end

  def show
    @contact = salesforce.find("Contact", params[:id])
  end

  def create
    @contact = salesforce.create(
      "Contact",
      Name: params[:contact][:name],
      Email: params[:contact][:email]
    )
    redirect_to contacts_path
  end

  def edit
    @contact = salesforce.find("Contact", params[:id])
  end

  def update
    @contact = salesforce.update(
      "Contact", 
      Id: params[:contact][:id],
      Name: params[:contact][:name],
      Email: params[:contact][:email]
    )
    redirect_to contacts_path
  end

  def destroy
    @contact = salesforce.find("Contact", params[:id])
    @contact.destroy

    redirect_to contacts_path
  end

  private

  def salesforce
    Salesforce.instance.restforce
  end
end
