require 'sqlite3'

if File.exists?("maindata.db")
    File.delete("maindata.db")
end

db = SQLite3::Database.new("maindata.db")
db.execute <<-SQL
    create table users(
      id integer primary key,
      email varchar,
      password varchar);
  SQL

db.execute("INSERT INTO users(email, password) values(?,?)", ["bob@example.com", "pass123"])

db.execute("INSERT INTO users(email, password) values(?,?)", ["tom@example.com", "pass123"])

db.execute("INSERT INTO users(email, password) values(?,?)", ["mar@example.com", "pass123"])


array=db.execute("SELECT*FROM users")
puts array

