class MusiciansController < ApplicationController
    
    def index 
        @musicians = Musician.all
    end 

    def show 
    end 

end
