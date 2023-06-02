class_name UDPReceiver


var server = UDPServer.new()
var _thread_active = false
var _thread : Thread

func start():
	server.listen(8080)
	_thread_active = true
	
	_thread = Thread.new()
	_thread.start(_receive_packets)
	
	print("Listening on port 8080...")


func _receive_packets():
	while _thread_active:
		server.poll()
		var peer = server.take_connection()
		if peer != null:
			var packet = peer.get_var()
			_process_packet(packet, peer)


func _process_packet(dict, peer : PacketPeerUDP):
	match dict.type:
		Packet.Type.ECHO:
			peer.put_var(dict)


func stop():
	server.stop()
	_thread_active = false
	_thread.wait_to_finish()
