module Portfolio
  class Server < Sinatra::Base
    get "/" do
      erb :index
    end

    get "/about" do
      erb :about
    end

    get "/contact" do
      erb :contact
    end

    get "/services" do
      erb :services
    end

    post "/contact" do
      name = params["name"]
      email = params["email"]
      message = params["message"]

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

      conn.exec_params("INSERT INTO contact_data (name, email, message) VALUES ($1, $2, $3)",
        [ name, email, message])

      @contact_submitted = true

      erb :contact
    end
  end
end
