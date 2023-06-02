extends HttpRouter
class_name DefaultRouter

func handle_get(request, response):
	response.send(200, "Success!")
