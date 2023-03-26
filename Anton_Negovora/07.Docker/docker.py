import http.server
import socketserver

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(b'This port is up')
        self.end_headers()

with socketserver.TCPServer(("", 8005), MyHandler) as httpd:
    print("Listening on port", 8005)
    httpd.serve_forever()