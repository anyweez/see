class ShortlinkController < ApplicationController

    # GET /:name
    #
    # Checks to see if a shortlink exists and redirect if so. If not, render a 'create new
    # shortlink' view. If the shortlink exists then the redirect occurs immediately and no
    # interstitial page is displayed.
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

    # POST /:name
    #
    # Creates a new shortlink with the specified information; this method expects that that data
    # is provided via a form.
    def create 
        link = params
                .require(:shortlink)
                .permit(:name, :url)
        link[:create_ip] = "1.2.3.4"

        # It shouldn't be possible to create an invalid shortlink name unless something nefarious
        # is happening. FEED THEM TO THE DOGS.
        if /^[a-zA-Z0-9]+$/.match(link[:name]) != nil
            Shortlink.create(link)
            redirect_to manage_path
        else
            redirect_to stahp_path
        end
    end

    # GET /_
    #
    # List all shortlinks and allow users to do some basic managerial stuff (deleting links, for example).
    def manage
        @links = Shortlink.all.order(created_at: :desc)
    end

    # GET /_/stahp
    #
    # Only for displaying to Ben or Ben-like entities who are trying to deface my masterpiece.
    def stahp
    end
end
