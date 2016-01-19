require 'pg'

conn = PG.connect(dbname: "portfolio")

conn.exec("DROP TABLE IF EXISTS contact_data")

conn.exec("CREATE TABLE contact_data(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    message TEXT NOT NULL
  )"
)

conn.exec("INSERT INTO contact_data (name, email, message) VALUES (
    'Bryan',
    'bryan.mytko@generalassemb.ly',
    'This is a test message from the seeded data'
  )"
)
