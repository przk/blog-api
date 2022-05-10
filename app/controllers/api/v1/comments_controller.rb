class Api::V1::CommentsController < Api::V1::ApplicationController
    def index
        @page = Page.find(params[:page_id])
        @comments = @page.comments.all
        render json: @comments.as_json(except: [:created_at, :updated_at])
    end

    def show
        @page = Page.find(params[:page_id])
        @comment = @page.comments.find(params[:id])
        render json: @comment.as_json(except: [:created_at, :updated_at])
    end
end
