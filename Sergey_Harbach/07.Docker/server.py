from http.server import BaseHTTPRequestHandler, HTTPServer

HOST = "0.0.0.0"
PORT = 8000


class MiniHTTP(BaseHTTPRequestHandler):
    def set_headers(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_HEAD(self):
        self.set_headers()

    def do_GET(self):
        if self.path == "/":
            self.set_headers()
            content = open("index.html", "rb").read()
            self.wfile.write(content)
        else:
            self.send_response(404)
        return


if __name__ == "__main__":
    server = HTTPServer((HOST, PORT), MiniHTTP)

try:
    server.serve_forever()
except KeyboardInterrupt:
    pass

server.server_close()
print("Server stopped.")
