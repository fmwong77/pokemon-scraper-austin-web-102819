require_relative 'scraper'
class Pokemon

    attr_reader :db#, :id, :name, :type
    attr_accessor :id, :name, :type

    def initialize(id:, name:, type:, db:)
       
    end

    def self.save(name, type, database_connection)
        database_connection.execute("insert into pokemon (name, type) values ('#{name}', '#{type}')")
    end

    def self.find(pokemon_id, database_connection)
        
        instance = self.new(id: pokemon_id, name: '', type: '', db: database_connection)
        # stm = database_connection.prepare "SELECT id, name, type FROM Pokemon"
        stm = database_connection.prepare "SELECT id, name, type FROM Pokemon WHERE Id=?"
        stm.bind_param 1, pokemon_id
        # stm.bind_param 2, name
        rs = stm.execute
        arr = rs.next
        
        # binding.pry
        instance.id = arr[0]
        instance.name = arr[1]
        instance.type = arr[2]
        instance
    end
end
