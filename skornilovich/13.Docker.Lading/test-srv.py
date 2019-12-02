from http.server import HTTPServer, BaseHTTPRequestHandler

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'Hello, world!\n')

httpd = HTTPServer(('0.0.0.0', 5626), SimpleHTTPRequestHandler)
httpd.serve_forever()
