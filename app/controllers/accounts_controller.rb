class AccountsController < ApplicationController
  def index
    @accounts = Account.new.sample_query
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
