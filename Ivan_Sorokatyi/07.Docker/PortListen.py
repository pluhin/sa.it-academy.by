import http.server
import socketserver

PORT = 8004

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(b'This port is UP')
        self.end_headers()

with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
    print("Listening on port", PORT)
    httpd.serve_forever()