# TgsnApi

A simple API made in Elixir with PostgreSQL as the database. Work in progress of a personal project.

## Installation

To run the application you must have an instance of PostgreSQL up and running, also (and quite obviously), you need to have Elixir installed. 

If it's your first time trying to run the application, you must: 
- Get the dependencies with `mix deps.get`
- Create the repository with `mix ecto.create`
- Run the migrations with `mix ecto.migrate`

## Running the application

After all that you are able to run the application with `iex -S mix`, with the server running on port: 3000. To change the port (or other configuration propeties you deem necessary), you can change the values in the `config.exs` file. 
