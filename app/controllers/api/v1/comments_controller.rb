class Api::V1::CommentsController < Api::V1::ApplicationController
    def index
        @page = Page.find(params[:page_id])
        @comments = @page.comments.all
        render json: @comments
    end

    def show
        @page = Page.find(params[:page_id])
        @comment = @page.comments.find(params[:id])
        render json: @comment
    end
end
