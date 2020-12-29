class ApplicationController < ActionController::Base
    before_action :category_viewer

    def category_viewer
        @category_viewer = Category.all
    end

end
