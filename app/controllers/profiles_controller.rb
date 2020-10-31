class ProfilesController < ApplicationCntroller
   before_action :authenticate_user!
    def show
    @profile = current_user.profile
   end

   def edit

   end

   def update
    
   end
end