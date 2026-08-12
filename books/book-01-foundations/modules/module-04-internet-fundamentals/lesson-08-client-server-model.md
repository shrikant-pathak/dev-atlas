# Lesson 08: Client–Server Model

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain the client-server architecture and how it differs from peer-to-peer.
- Describe the request/response cycle end to end, tying together concepts from this entire module.
- Understand where a "server" actually is, conceptually and physically.

---

# Introduction

This final lesson pulls together everything from this module — IP addresses, DNS, HTTP/HTTPS, and ports — into one unified model: the **client-server architecture**, which underlies virtually every website and web application you'll ever build.

---

# What Is the Client-Server Model?

In this model, there are two roles:

- **Client** — the device or program requesting data or services (typically a web browser, but could be a mobile app or another program).
- **Server** — the device or program providing data or services in response to client requests.

Servers are usually always-on, waiting to receive and respond to requests. Clients initiate communication when needed (e.g., when you open a webpage).

This is different from **peer-to-peer (P2P)** architecture, where devices communicate directly as equals without a dedicated central server — used by some file-sharing and blockchain systems, but far less common for typical websites and web apps.

---

# What Is a "Server," Really?

A server is just a computer — often a powerful one running in a data center, but conceptually no different from your own laptop — running software that listens for incoming requests on a specific port and responds to them. When you "deploy" a website, you're essentially installing and running server software on a remote machine that stays on and connected to the Internet permanently.

---

# The Full Request/Response Cycle (Bringing It All Together)

Now that you've learned every piece individually, here's the complete flow, connecting concepts across this entire module:

1. You type `https://example.com` into your browser.
2. **DNS lookup** — your browser resolves `example.com` to an IP address (Lesson 04).
3. **TCP connection + TLS handshake** — a secure connection is established with the server at that IP address, on port 443 (Lessons 06, 07).
4. **HTTP request sent** — your browser sends a `GET` request for the page (Lesson 05).
5. **Server processes the request** — the server (possibly querying a database, running backend logic) prepares a response.
6. **HTTP response returned** — the server sends back HTML, CSS, JS, and other assets, along with a status code (Lesson 05).
7. **Browser renders the page** — the browser parses and displays everything it received.

Every one of these steps depends on a concept covered somewhere in this module — this is genuinely the backbone of how the entire web works.

---

# Practical Example

```bash
# Watch this entire cycle happen live
# Open DevTools → Network tab → reload any website
# Observe: DNS timing, connection setup, request headers, response status, response body
```

---

# Revision Questions

1. What are the two roles in the client-server model, and what does each do?
2. How does client-server architecture differ from peer-to-peer?
3. Walk through the full request/response cycle from typing a URL to seeing the rendered page, referencing at least 4 concepts from this module.

<details><summary>Answers</summary>

1. The client requests data/services (typically a browser); the server provides data/services in response, usually always-on and listening for requests.
2. In client-server, a dedicated server responds to requests from clients; in peer-to-peer, devices communicate directly as equals with no dedicated central server.
3. DNS resolves the domain to an IP address → a TCP/TLS connection is established on port 443 → the browser sends an HTTP GET request → the server processes it and returns an HTTP response with a status code → the browser renders the received content.

</details>

---

# 🏁 Module 04 Checkpoint

Before moving to Module 05, you should be able to:
- [ ] Explain the difference between the Internet and the World Wide Web
- [ ] Distinguish public/private and static/dynamic IP addresses
- [ ] Walk through the DNS lookup process from memory
- [ ] Explain HTTP methods, status codes, and why HTTPS matters
- [ ] Explain what a port is and name at least 3 well-known ports
- [ ] Describe the full client-server request/response cycle unaided

**Next up:** Module 05 — How the Web Works