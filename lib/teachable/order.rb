module Teachable
  class Order

    attr_accessor :id, :number, :total, :total_quantity, :email, :special_instructions, :created_at, :updated_at

    def initialize(id:, number:, total:, total_quantity:, email:, special_instructions:, created_at:, updated_at:)
      @id = id
      @number = number
      @total = total
      @total_quantity = total_quantity
      @email = email
      @special_instructions = special_instructions
      @created_at = Date.parse(created_at)
      @updated_at = Date.parse(updated_at)
    end

    # Returns an array of orders placed by a given user
    def self.list(user)
      orders = Client.get("/api/orders.json?user_email=#{user.email}&user_token=#{user.token}")
      orders.map do |order|
        Order.new(order)
      end
    end

    # Creates an order and returns it
    def self.create(user, options)
      new(
        Client.post("/api/orders.json?user_email=#{user.email}&user_token=#{user.token}", options)
      )
    end

    def self.destroy(user, id)
      Client.delete("/api/orders/#{id}.json?user_email=#{user.email}&user_token=#{user.token}")
    end
  end
end
