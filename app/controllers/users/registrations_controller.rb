class Users::RegistrationsController < Devise::RegistrationsController
    
    #override the create action
    def create
        super do |resource|
            if params[:plan]
                resource.plan_id = params[:plan]
                
                if resource.plan_id == 2
                    resource.save_with_payment
                else
                    resource.save
                end#nested...if/else
                
            end#if
            
        end#super do loop
    end#create method
    
    
end#class Users::RegistrationsController