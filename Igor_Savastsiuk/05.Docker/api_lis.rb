require 'socket'

port_to_listen_to = 8080

puts "starting to listen to: #{port_to_listen_to}"
server = TCPServer.open(port_to_listen_to)
loop {
  client = server.accept

  puts 'receiving data ' + Time.now.ctime
  puts '--------------------------------------------------------------------------------'
  
  while (a = client.gets) != "\r\n" do
    puts a
  end

  puts '--------------------------------------------------------------------------------'


  client.puts "HTTP/1.1 200 Success"
  client.puts ""
  client.puts `linuxlogo`
  client.close
}