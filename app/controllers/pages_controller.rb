class PagesController < ApplicationController
    def about
        @title = 'About Us';
        @content = 'This is about us';

    end
end
