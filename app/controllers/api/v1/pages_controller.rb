class Api::V1::PagesController < Api::V1::ApplicationController
    def index
        @pages = Page.all
        render json: @pages.as_json(except: [:created_at, :updated_at])
    end

    def show
        @page = Page.find(params[:id])
        render json: @page.as_json(except: [:created_at, :updated_at])
    end
end
