extends Node

var receiver : UDPReceiver
var http_server : HttpServer

func _ready():
	receiver = UDPReceiver.new()
	http_server = HttpServer.new()
	receiver.start()
	http_server.register_router("/index", DefaultRouter.new())
	http_server.port = 8070
	add_child(http_server)
	http_server.start()


func _exit_tree():
	http_server.stop()
	receiver.stop()
