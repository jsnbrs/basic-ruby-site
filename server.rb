module Portfolio
  class Server < Sinatra::Base
    get "/" do
      erb :index
    end

    get "/contact" do
      erb :contact
    end

    post "/contact" do
      name = params["name"]
      email = params["email"]
      message = params["message"]

      conn = PG.connect(dbname: "portfolio")
      conn.exec_params("INSERT INTO contact_data (name, email, message) VALUES ($1, $2, $3)",
        [ name, email, message])

      @contact_submitted = true

      erb :contact
    end
  end
end
