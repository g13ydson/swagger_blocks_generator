


# Swagger Blocks Generator

   create swagger_blocks files through your models

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'swagger_blocks_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install swagger_blocks_generator

## Usage

    $ rails g swagger_blocks:doc User
    
creates the documentation based on the return of gem fast_json_api https://github.com/Netflix/fast_jsonapi 

    $ rails g swagger_blocks:doc User --fast-json-api 


## Basic example

    $ rails g swagger_blocks:doc User

*app/controllers/docs/user.rb*
```ruby
class User
  include Swagger::Blocks
  
  swagger_schema :user_index_response do
    key :type, :array
    items do
      property :id do
        key :type, :string
      end
      property :name do
        key :type, :string
      end
      property :created_at do
        key :type, :string
      end
      property :updated_at do
        key :type, :string
      end
    end
  end

  swagger_schema :user_show_response do
    key :type, :array
    items do
      property :id do
        key :type, :string
      end
      property :name do
        key :type, :string
      end
      property :created_at do
        key :type, :string
      end
      property :updated_at do
        key :type, :string
      end
    end
  end

  swagger_schema :user_create_response do
    key :type, :array
    items do
      property :id do
        key :type, :string
      end
      property :name do
        key :type, :string
      end
      property :created_at do
        key :type, :string
      end
      property :updated_at do
        key :type, :string
      end
    end
  end

  swagger_schema :user_update_response do
    key :type, :array
    items do
      property :id do
        key :type, :string
      end
      property :name do
        key :type, :string
      end
      property :created_at do
        key :type, :string
      end
      property :updated_at do
        key :type, :string
      end
    end
  end

  swagger_schema :create_user do
    property :user do
      property :id do
        key :type, :string
      end
      property :name do
        key :type, :string
      end
      property :created_at do
        key :type, :string
      end
      property :updated_at do
        key :type, :string
      end
    end
  end

  swagger_schema :update_user do
    property :user do
      property :id do
        key :type, :string
      end
      property :name do
        key :type, :string
      end
      property :created_at do
        key :type, :string
      end
      property :updated_at do
        key :type, :string
      end
    end
  end
end
```
*app/controllers/docs/users_controller.rb*
```ruby
class UsersController
  include Swagger::Blocks

  swagger_path "/users" do
    operation :get do
      key :summary, "Index users"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "user"
      ]
      response 200 do
        key :description, "User of all users"
        schema do
          key :"$ref", :user_index_response
        end
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 403 do
        key :description, "Forbidden"
      end
      response :default do
        key :description, "Unexpected error"
      end
    end
  end

  swagger_path "/users/{id}" do
    operation :get do
      key :summary, "Show user"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "user"
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "id of user"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "Show user"
        schema do
          key :"$ref", :user_show_response
        end
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 403 do
        key :description, "Forbidden"
      end
      response :default do
        key :description, "Unexpected error"
      end
    end
  end

  swagger_path "/users" do
    operation :post do
      key :summary, "Create user"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "user"
      ]
      parameter do
        key :name, :user_params
        key :in, :body
        key :required, true
        schema do
          key :"$ref", :create_user
        end
      end
      response 200 do
        key :description, "user"
        schema do
          key :"$ref", :user_create_response
        end
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 403 do
        key :description, "Forbidden"
      end
      response :default do
        key :description, "Unexpected error"
      end
    end
  end

  swagger_path "/users/{id}" do
    operation :put do
      key :summary, "Update user"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "user"
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "id of user"
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, :user_params
        key :in, :body
        key :required, true
        schema do
          key :"$ref", :update_user
        end
      end
      response 200 do
        key :description, "user"
        schema do
          key :"$ref", :user_create_response
        end
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 403 do
        key :description, "Forbidden"
      end
      response :default do
        key :description, "Unexpected error"
      end
    end
  end

  swagger_path "/users/{id}" do
    operation :delete do
      key :summary, "Delete user"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "user"
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "id of user"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "empty"
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 403 do
        key :description, "Forbidden"
      end
      response :default do
        key :description, "Unexpected error"
      end
    end
  end
end
```

## Example with --fast-json-api option

*app/controllers/docs/user.rb*
```ruby
class User
  include Swagger::Blocks

  swagger_schema :user_index_response do
    property :data do
      key :type, :array
      items do
        property :id do
          key :type, :integer
        end
        property :type do
          key :type, :string
        end
        property :attributes do
          items do
            property :name do
              key :type, :string
            end
            property :created_at do
              key :type, :string
            end
          end
        end
      
        property :relationships do
          items do
            property :posts do
              property :data do
                property :id do
                  key :type, :integer
                end
                property :type do
                  key :type, :string
                end
              end
            end
          end
        end
      end
    end
  end

  swagger_schema :user_show_response do
    property :data do
      property :id do
        key :type, :integer
      end
      property :type do
        key :type, :string
      end
      property :attributes do
        items do
          property :name do
            key :type, :string
          end
          property :created_at do
            key :type, :string
          end
        end
      end
      
      property :relationships do
        items do
          property :posts do
            property :data do
              property :id do
                key :type, :integer
              end
              property :type do
                key :type, :string
              end
            end
          end
        end
      end
    end
  end

  swagger_schema :user_create_response do
    property :data do
      property :id do
        key :type, :integer
      end
      property :type do
        key :type, :string
      end
      property :attributes do
        items do
          property :name do
            key :type, :string
          end
          property :created_at do
            key :type, :string
          end
        end
      end
      
      property :relationships do
        items do
          property :posts do
            property :data do
              property :id do
                key :type, :integer
              end
              property :type do
                key :type, :string
              end
            end
          end
        end
      end
    end
  end

  swagger_schema :user_update_response do
    property :data do
      property :id do
        key :type, :integer
      end
      property :type do
        key :type, :string
      end
      property :attributes do
        items do
          property :name do
            key :type, :string
          end
          property :created_at do
            key :type, :string
          end
        end
      end
      
      property :relationships do
        items do
          property :posts do
            property :data do
              property :id do
                key :type, :integer
              end
              property :type do
                key :type, :string
              end
            end
          end
        end
      end
    end
  end

  swagger_schema :create_user do
    property :user do
      property :id do
        key :type, :string
      end
      property :name do
        key :type, :string
      end
      property :created_at do
        key :type, :string
      end
      property :updated_at do
        key :type, :string
      end
    end
  end

  swagger_schema :update_user do
    property :user do
      property :id do
        key :type, :string
      end
      property :name do
        key :type, :string
      end
      property :created_at do
        key :type, :string
      end
      property :updated_at do
        key :type, :string
      end
    end
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/g13ydson/swagger_blocks_generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SwaggerBlocksGenerator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/g13ydson/swagger_blocks_generator/blob/master/CODE_OF_CONDUCT.md).
