class ShortlinkController < ApplicationController

    def redirect
        name = params[:name]
        link = Shortlink.find_by(name: name)

        if link     # redirect to stored url
            redirect_to link.url
        else        # show the create page
            @link = Shortlink.new
            @target = params[:name]
        end
    end

    def create 
        link = params
                .require(:shortlink)
                .permit(:name, :url)
        link[:create_ip] = "1.2.3.4"

        Shortlink.create(link)

        redirect_to manage_path
    end

    def manage
        @links = Shortlink.all
    end
end
