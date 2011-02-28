module RailsAssist::File
  module Routes
    def insert_into_routes route_stmt=nil, &block
      statement = block ? yield : route_stmt
      routes_file.insert statement, :after => 'routes.draw do'
    end

    def insert_last_in_routes route_stmt=nil, &block
      statement = block ? yield : route_stmt
      routes_file.insert statement, :before_last => 'end'
    end
  end
end
