class Role < ActiveRecord::Base
    has_many :auditions
    
    def actors 
        self.auditions.collect do |a|
            a.actor
        end
    end

    def locations
        self.auditions.collect do |a|
            a.location 
        end
    end

    def lead
        self.audtions.find_by(hired: true) || 'no actor has been hired for this role'
    end

    def understudy
        self.auditions.where(hired: true).second || 'no actor has been hired for understudy for this role'
    end
end