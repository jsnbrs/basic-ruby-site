require 'pg'

if ENV["RACK_ENV"] == 'production'
  conn = PG.connect(
    dbname: ENV["POSTGRES_DBNAME"],
      host: ENV["POSTGRES_HOST"],
  password: ENV["POSTGRES_PASS"],
      user: ENV["POSTGRES_USER"]
    )
else
  conn = PG.connect(dbname: "portfolio")
end

conn.exec("DROP TABLE IF EXISTS contact_data")

conn.exec("CREATE TABLE contact_data(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    message TEXT NOT NULL
  )"
)

conn.exec("INSERT INTO contact_data (name, email, message) VALUES (
    'Jason',
    'jasonbooras@gmail.com',
    'This is a test message from the seeded data'
  )"
)
