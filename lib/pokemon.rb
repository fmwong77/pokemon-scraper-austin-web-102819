require_relative 'scraper'
class Pokemon

    attr_reader :db#, :id, :name, :type
    attr_accessor :id, :name, :type

    def initialize(id:, name:, type:, db:)
       
    end

    def self.save(name, type, database_connection)
        database_connection.execute("insert into pokemon (name, type) values ('#{name}', '#{type}')")
    end

    def self.find(pikachu_id, database_connection)
        instance = self.new(id: pikachu_id, name: '', type: '', db: database_connection)
        pikachu = database_connection.execute("select id, name, type from pokemon where id = #{pikachu_id}").flatten()
        
        instance.id = pikachu[0]
        instance.name = pikachu[1]
        instance.type = pikachu[2]
        instance

    end
end
