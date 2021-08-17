class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def characters
        Character.where(actor_id: self.id)
    end

    def shows
        character = Character.find(actor_id = self.id)
        Show.where(id: character.show_id)
    end

    def full_name
        self.first_name + ' ' + self.last_name
    end

    def list_roles
        character = Character.find(actor_id = self.id)
        show = Show.find(id = character.show_id)
        character.name + ' - ' + show.name
    end
end