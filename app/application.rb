class Application

  @@items = [Item.new("Taylor Swift CD", 9.00), Item.new("Fantastic Beasts: The Crimes of Grindelwald", 6.00)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
        item_in_cart = req.path.split("/items/").last
        if item = @@items.find{|item| item.name  == item_in_cart}
          resp.write item.price
        else
          resp.write "Item not found"
          resp.status = 400
         end
       else
          resp.write "Route not found"
          resp.status = 404
      end
      resp.finish
  end

end
