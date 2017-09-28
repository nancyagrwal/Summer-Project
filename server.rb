require 'socket' 							# Get sockets

server = TCPServer.open(2000) # Socket listens on port 2000
loop {  										
	client = server.accept			
	client.puts(Time.now.ctime)	
	client.puts "Closing connection"
	client.close								
}
