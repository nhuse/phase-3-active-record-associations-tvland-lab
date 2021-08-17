class Show < ActiveRecord::Base
    has_many :characters
    has_many :actors, through: :characters
    belongs_to :networks

    def network
        Network.find(id = self.network_id).id
    end
    def build_network(call_letters:)
        newNetwork = Network.create(call_letters: call_letters)
        self.network_id = newNetwork.id
    end

    def actors_list
        characters = Character.find(show_id = self.id)
        actor = Actor.find(id = characters.actor_id)
        actor.first_name + ' ' + actor.last_name
    end
end