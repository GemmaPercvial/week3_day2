require ('pg')
class Bounty

attr_writer :cashed_in

  def initialize (options)
    @id = options['id'].to_i if options['id'] != nil
    @name = options ['name']
    @bounty_value = options ['bounty_value'].to_i
    @danger_level = options ['danger_level']
    @cashed_in =  (options['cashed_in'] == 'true')
  end


  def save
    db = PG.connect({ dbname: 'space_cowboys', host: 'localhost' })
    sql = "INSERT INTO bounties (name, bounty_value, danger_level, cashed_in) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@name, @bounty_value, @danger_level, @cashed_in]
    db.prepare("save", sql)
    hashes = db.exec_prepared("save", values)
    @id = hashes.first['id'].to_i
    db.close()
  end

  def delete
    db = PG.connect({ dbname: 'space_cowboys', host: 'localhost' })
    sql = "DELETE FROM bounties WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

  def update
    db = PG.connect({ dbname: 'space_cowboys', host: 'localhost' })
    sql = "UPDATE bounties SET (name, bounty_value, danger_level, cashed_in) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @bounty_value, @danger_level, @cashed_in, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end



end
