module RailsAssist::File
  module Environment
    def insert_before_application_init content=nil, &block
      insert_application_init :before, content, &block
    end

    def insert_after_application_init content=nil, &block
      insert_application_init :after, content, &block
    end

    def insert_application_init place, statement=nil, &block
      statement = block ? yield : statement
      environment_file.insert statement, place => /\w+::Application.initialize!/
    end    
  end
end