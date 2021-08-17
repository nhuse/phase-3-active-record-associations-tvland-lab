class Character < ActiveRecord::Base
    belongs_to :actors
    belongs_to :shows

    def actor
        Actor.find(self.id)
    end

    def show
        Show.where(id: self.show_id).first
    end
    def build_show(name:)
        newShow = Show.create(name: name)
        self.show_id = newShow.id
    end

    def say_that_thing_you_say
        newString = self.name + ' always says: ' + self.catchphrase
    end
end