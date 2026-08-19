cat > lesson-05-http.md << 'EOF'
# Lesson 05: HTTP

## Learning Objectives
By the end of this lesson, you will be able to:
- Define HTTP and explain its role in web communication.
- Identify the main HTTP methods and their purposes.
- Understand the structure of an HTTP request and response.
- Recognize common HTTP status codes.

---

# Introduction

Once your browser knows a server's IP address (thanks to DNS), it needs an actual language to communicate with that server — to ask for a webpage and receive it back. That language is **HTTP**, and it underlies essentially every interaction between a browser (or app) and a web server.

---

# What Is HTTP?

**HTTP (HyperText Transfer Protocol)** is the protocol used for transmitting data across the Web. It defines a request/response pattern: a **client** (like a browser) sends a request, and a **server** sends back a response.

HTTP is **stateless** — each request is independent, with no memory of previous requests by default. (This is why technologies like cookies and sessions, covered in a later module, exist — to work around this statelessness when needed.)

---

# HTTP Methods

| Method | Purpose |
|---|---|
| `GET` | Retrieve data (e.g., load a webpage) |
| `POST` | Submit new data (e.g., submit a form) |
| `PUT` | Replace an existing resource entirely |
| `PATCH` | Partially update an existing resource |
| `DELETE` | Remove a resource |

These methods form the backbone of REST APIs, which you'll build extensively once you reach the backend books later in this roadmap.

---

# Anatomy of an HTTP Request

GET /search?q=devatlas HTTP/1.1
Host: www.example.com
User-Agent: Mozilla/5.0
Accept: text/html

- **Method + path** — what action, on what resource
- **Headers** — metadata about the request (browser type, accepted formats, etc.)
- **Body** (optional, common with POST/PUT) — the actual data being sent

---

# Anatomy of an HTTP Response

HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1256

<html>...</html> ```
Status line — protocol version and status code
Headers — metadata about the response (content type, length, caching rules)
Body — the actual content (HTML, JSON, an image, etc.)

HTTP Status Codes
Range	Meaning	Example
1xx	Informational	100 Continue
2xx	Success	200 OK, 201 Created
3xx	Redirection	301 Moved Permanently, 302 Found
4xx	Client Error	404 Not Found, 400 Bad Request
5xx	Server Error	500 Internal Server Error, 503 Service Unavailable

Recognizing these ranges instantly is a core debugging skill — you'll see them constantly in browser DevTools' Network tab.

Practical Example

Open DevTools → Network tab → visit any website → click a request to inspect its full headers, method, and status code in real time.

Revision Questions
Why is HTTP described as "stateless"?
What's the difference between PUT and PATCH?
What does a 404 status code mean, and what range of codes does it fall into?
<details><summary>Answers</summary>
Because each HTTP request is handled independently, with no built-in memory of previous requests.
PUT replaces a resource entirely; PATCH applies a partial update, changing only specified fields.
404 means "Not Found" — the requested resource doesn't exist on the server. It falls into the 4xx (client error) range.

</details> EOF ```
