extends Node

var receiver : UDPReceiver

func _ready():
	receiver = UDPReceiver.new()
	var server = HttpServer.new()
	receiver.start()
	server.register_router("/", DefaultRouter.new())
	server.port = 8070
	add_child(server)
	server.start()


func _exit_tree():
	receiver.stop()
