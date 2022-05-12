class Api::V1::Admin::CommentsController < Api::V1::ApplicationController
    before_action :authorize_request

    def create
        authorize Comment
        @page = Page.find(params[:page_id])
        @comment = @page.comments.create(params.permit(:name, :body, :page_id))
        render json: @comment.as_json(only: [:name, :body, :page_id, :id]), status: :created
    end
    
    def destroy
        @page = Page.find(params[:page_id])
        @comment = @page.comments.find(params[:id])
        authorize @comment
        @comment.destroy
        render json: { message: 'Comment destroyed!' }
    end
end
