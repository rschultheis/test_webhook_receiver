# Webhook Receiver

A simple server for receiving and inspecting webhook payloads

## Usage

Two steps:

1) Start the server:

`bundle exec ruby server.rb`

2) use ngrok to open a public endpoint

`ngrok http 4567`

Take the hostname it displays, that is your public hostname for the sinatra server.

:exclamation: to install ngrok: `brew cask install ngrok`

3) Test using curl:

`curl -v -X POST -d '{"key1":"value1", "key2":"value2"}'  http://ab93d380.ngrok.io/testing123`

:exclamation: make sure to substitute the host you get on the ngrok command line
