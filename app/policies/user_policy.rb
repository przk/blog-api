# frozen_string_literal: true

class UserPolicy
    attr_reader :user, :page
  
    def initialize(user,page)
      @user = user
      @page =:page

      #@current_user = user
      #@page =:page

    end
  
    def index?
      @user.admin?
    end
  
    def show?
      false
    end
  
    def create?
      false
    end
  
    def new?
      create?
    end
  
    def update?
      @user
    end
  
    def edit?
      update?
    end

    def adminpatch?
      @user.admin?
    end

    def thisuser?
      @user != nil
    end
  
    def destroy?
      @user.admin?
    end
  
    class Scope
      def initialize(user, scope)
        @user = user
        @scope = scope
      end
  
      def resolve
        raise NotImplementedError, "You must define #resolve in #{self.class}"
      end
  
      private
  
      attr_reader :user, :scope
    end
  end
  