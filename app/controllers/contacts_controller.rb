class ContactsController < ApplicatonController
    def new
        @contact = Contact.new
    end
    
    def create
    end
end