# Quiz — Internet Fundamentals

## Multiple Choice
1. What does DNS stand for?
   a) Domain Network System  b) Domain Name System  c) Digital Naming Service  d) Data Network Server

2. What is the default port for HTTPS?
   a) 21  b) 80  c) 443  d) 3000

3. Which HTTP method is used to completely replace an existing resource?
   a) GET  b) POST  c) PUT  d) DELETE

4. What does a 404 status code mean?
   a) Server error  b) Redirect  c) Not Found  d) Success

---

## True / False
1. The Internet and the World Wide Web are the same thing. (True/False)
2. A private IP address is reachable directly from anywhere on the Internet. (True/False)
3. HTTP is a stateless protocol. (True/False)

---

## Short Answer
1. Explain, in your own words, what a TLS handshake accomplishes.
2. What's the difference between a LAN and a WAN?
3. Why do modern browsers flag HTTP-only websites as "Not Secure"?

---

## Coding Questions
1. Write the terminal command to look up the DNS records for a domain (macOS/Linux).
2. Given the address `192.168.1.50:8080`, identify which part is the IP address and which part is the port.

<details><summary>Answers</summary>

**Multiple Choice:** 1-b, 2-c, 3-c, 4-c

**True/False:** 1-False (the Web is one service running on top of the Internet), 2-False (private IPs are only reachable within their local network), 3-True

**Coding Question 1:** `nslookup <domain>` or `dig <domain>`

**Coding Question 2:** `192.168.1.50` is the IP address; `8080` is the port.

</details>