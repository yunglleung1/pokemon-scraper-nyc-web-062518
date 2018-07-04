
class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
  end

  def self.save(name, type, db)
    pokemon = Pokemon.new({name: name, type: type, db: db})
    sql = "INSERT INTO pokemon (name, type) values (?, ?)"
    db.execute(sql, pokemon.name, pokemon.type)
  end

  def self.find(id_number, db)
    sql = "SELECT ?, name, type FROM pokemon"
    pokemonArray = db.execute(sql, id_number)[0]
    pokemonHash = {id: pokemonArray[0], name: pokemonArray[1], type: pokemonArray[2]}
    pokemon = Pokemon.new(pokemonHash)
  end
end
