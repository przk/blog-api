# frozen_string_literal: true

class CommentPolicy
    attr_reader :user, :comment
  
    def initialize(user,comment)
      @user = user
      @comment = :comment
    end
  
    def index?
      true
    end
  
    def show?
      true
    end
  
    def create?
      puts @user, ' <- user'
      @user
    end
  
    def new?
      create?
    end
  
    def update?
      #false
      @user.admin?
    end
  
    def edit?
      update?
    end
  
    def destroy?
      #false
      @user.admin?
    end
  end
  