class Actor < ActiveRecord::Base
    has_many :roles
    has_many :movies, through: :roles

    def total_salary
        self.roles.sum(:salary)
    end

    def blockbusters
        self.movie.all.select do |m|
            m.box_office_earnings == 50000000
        end  
    end

    

    def self.most_successful
        Actor.all.max_by do |a|
            actor.salary.count
        end
    end

end