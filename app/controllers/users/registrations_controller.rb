class Users::RegistrationsController < Devise::RegistrationsController
    
    before_filter :select_plan, only: :new
    
    
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
    
    private
        def select_plan
            unless params[:plan] && (params[:plan] == '1' || params[:plan] == '2')
                flash[:notice] = "Please select a membership plan to sign up."
                redirect_to root_url
            end#unless
        end#select_plan
    
end#class Users::RegistrationsController