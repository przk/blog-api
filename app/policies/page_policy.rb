# frozen_string_literal: true

class PagePolicy
    attr_reader :user, :page
  
    def initialize(user,page)
      @user = user
      @page =:page

    end
  
    def index?
      false
    end
  
    def show?
      false
    end
  
    def create?
      @user.admin?
    end
  
    def new?
      create?
    end
  
    def update?
      @user.admin?
    end
  
    def edit?
      update?
    end
  
    def destroy?
      @user.admin?
    end
  end
  