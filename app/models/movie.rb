class Movie < ActiveRecord::Base
    has_many :roles
    has_many :actors, through: :roles

    def cast_role(actor, character_name, salary)
        Role.create(actor_id: actor.id, movie_id: self.id, character_name: character_name, salary: salary)
    end

    def all_credits
        self.roles.map do |b|
            b.credit
        end
    end

    def fire_actor(actor)
        self.roles.where(actor: actor).destroy_all
    end

end