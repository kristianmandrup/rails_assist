module RailsAssist::File
  module Routes 
    # insert as first route statement
    def insert_into_routes route_stmt=nil, &block
      statement = block ? yield : route_stmt
      routes_file.insert statement, :after => 'routes.draw do'
    end
    alias_method :insert_as_first_route_statement, :insert_into_routes

    # insert as last route statement
    def insert_last_in_routes route_stmt=nil, &block
      statement = block ? yield : route_stmt
      routes_file.insert statement, :before_last => 'end'
    end

    alias_method :insert_as_last_route_statement, :insert_last_in_routes
  end
end
