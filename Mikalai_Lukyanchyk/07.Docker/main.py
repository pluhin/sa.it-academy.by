from http.server import BaseHTTPRequestHandler, HTTPServer
import re
class myHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type','text/html')
        self.end_headers()
        path = self.path
        if path == "/":
            path = "/index"

        try:
            file  = open("pages"+path + ".html", 'r')
        except FileNotFoundError:
            file  = open("pages/404.html", 'r')

        message = file.read()
        file.close()
        self.wfile.write(bytes(message, "utf8"))


    def do_POST(self):
        self.send_response(301)
        self.send_header('Location','/support')
        self.end_headers()
        path = self.path
        #Обработчик подписки
        if path == "/email":
            content_len = int(self.headers.get('Content-Length'))
            post = self.rfile.read(content_len)
            email = re.split(r"email=",str(post))[1]
            email = re.sub(r"\'","",email)
            print(email)

server = HTTPServer(('', 8081), myHandler)
server.serve_forever()
