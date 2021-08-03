class MusiciansController < ApplicationController
    
    def index 
        @musicians = Musician.all
    end 

    def show 
        @musician = Musician.find_by_id(params[:id])
    end 

end
