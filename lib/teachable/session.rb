module Teachable
  class Session

    attr_accessor :current_user

    def initialize(current_user:)
      @current_user = current_user
    end

    # Registers a new user and returns a new instance of Teachable::Session
    def self.register(options)
      new(current_user: User.register(options))
    end

    # Logs a user in and returns a new instance of Teachable::Session
    def self.login(options)
      new(current_user: User.login(options))
    end

    # Lists the current user's orders
    def list_orders
      Order.list(@current_user)
    end

    # creates an order for the current user
    def create_order(options)
      Order.create(@current_user, options)
    end

    # deletes the order with the given ID
    def delete_order(id)
      Order.destroy(@current_user, id)
    end
  end
end
