class Admin::PagesController < ApplicationController
    before_action :authorize_request

    def create
        authorize Page
        @page = Page.create(title: params[:title], body: params[:body])
        render json: @page
    end

    def update
        @page = Page.find(params[:id])
        authorize @page
        @page.update(title: params[:title], body: params[:body])
        render json: "#{@page.title} has been updated!"
    end

    def destroy
        @page = Page.find(params[:id])
        authorize @page
        @page.destroy
        render json: "#{@page.title} has been destroyed!"
    end
end