# Cards
Test app for studying purposes based on Udemy `Elixir and Phoenix Bootcamp`

## Getting started
To create a new Elixir project you must run the following command in the command line
`mix new [project_name]`

To test elixir code you run the command `iex -S mix`
iex launches the interactive console while the -S mix uses MIX to compile the project

## Generating documentation
To generate documentation you need to add the `:ex_doc` dependency like this

>defp deps do \
>&nbsp;&nbsp;    [ \
>&nbsp;&nbsp;&nbsp;&nbsp;{:ex_doc, "~> 0.12"} \
>&nbsp;&nbsp;    ] \
>end

then in the root folder run the following command: `mix docs`

## Testing
To run tests simply run the command `mix test`

### Doc tests
Adding `doctest [ModuleName]` to a test file, makes it run all the examples generated via the `@doc` annotation
see `cards.ex` and `card_test.exs` 

# Documentation
The full generated documentation can be found opening `doc/index.html` in a browser, once generated