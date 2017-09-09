module Teachable
  class User

    attr_accessor :id, :name, :nickname, :image, :email, :token, :created_at, :updated_at

    def initialize(id:, name:, nickname:, image:, email:, tokens:, created_at:, updated_at:)
      @id = id
      @name = name
      @nickname = nickname
      @image = image
      @email = email
      @token = tokens
      @created_at = Date.parse(created_at)
      @updated_at = Date.parse(updated_at)
    end

    # Registers a new user and returns the newly created User
    # Note: after experimenting creating users with other attributes and noticing they do not get saved, I limited the attributes to email and password.
    def self.register(options)
        new(Client.post('/users.json',
          user: options
        )
      )
    end

    # Logs a user in and returns the logged in User
    def self.login(options)
      new(
        Client.post('/users/sign_in.json',
          user: options
        )
      )
    end

    # Gets the users information from the API and returns a new copy
    def get
      User.new(
        Client.get("/api/users/current_user/edit.json?user_email=#{email}&user_token=#{token}")
      )
    end
  end
end
