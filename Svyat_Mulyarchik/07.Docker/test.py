from http.server import HTTPServer, BaseHTTPRequestHandler
import socket
import http.server
import socketserver
PORT = 8001
class MyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write("<html>\n<head>\n<title>Hello World</title>\n</head>\n</html>\n".encode("utf-8"))
try:
    server = http.server.HTTPServer(('0.0.0.0', PORT), MyHandler)
    print('Server is started\nListening on port =', PORT)
    server.serve_forever()
except KeyboardInterrupt:
    print('^C received, shutting down server')
    server.socket.close()
