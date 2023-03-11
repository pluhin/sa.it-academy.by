from http.server import BaseHTTPRequestHandler, HTTPServer

class myHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type','text/html')
        self.end_headers()

        message = "Server working!"

        self.wfile.write(bytes(message, "utf8"))



server = HTTPServer(('', 8081), myHandler)
server.serve_forever()
