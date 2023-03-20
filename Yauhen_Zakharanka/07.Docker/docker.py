from http.server import HTTPServer, BaseHTTPRequestHandler
import socket


class HTTPRequest(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'Successfull test\n')

SERVER_PORT = 7802
httpd = HTTPServer(('0.0.0.0', SERVER_PORT), HTTPRequest)
print('Listening on port %s ...' % SERVER_PORT)
httpd.serve_forever()
