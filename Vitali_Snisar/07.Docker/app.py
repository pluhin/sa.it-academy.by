#python3

from http.server import BaseHTTPRequestHandler
from http.server import HTTPServer

HOST = ""
PORT = 8080


class HttpGetHandler(BaseHTTPRequestHandler):
  
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write('<html><head><meta charset="utf-8">'.encode())
        self.wfile.write('<title>Http APP</title></head>'.encode())
        self.wfile.write('<body>HI</body></html>'.encode())

if __name__ == "__main__":
    server = HTTPServer((HOST, PORT), HttpGetHandler)

try:
    server.serve_forever()
except KeyboardInterrupt:
    pass