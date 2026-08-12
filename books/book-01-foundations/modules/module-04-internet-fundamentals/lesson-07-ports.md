Think of the IP address as a building's street address, and the port number as a specific apartment number within that building — the address gets mail to the right building, but you still need the apartment number to reach the right resident.

---

# Common Well-Known Ports

| Port | Protocol/Service |
|---|---|
| 20/21 | FTP (File Transfer Protocol) |
| 22 | SSH (Secure Shell) |
| 25 | SMTP (Email sending) |
| 53 | DNS |
| 80 | HTTP |
| 443 | HTTPS |
| 3306 | MySQL (default) |
| 5432 | PostgreSQL (default) |
| 27017 | MongoDB (default) |

When you visit `https://example.com`, your browser is implicitly connecting to port 443 — you rarely see the port number because browsers default to it automatically for HTTPS (and 80 for HTTP).

---

# Port Ranges

- **Well-known ports (0–1023)** — reserved for common, standardized services (HTTP, HTTPS, SSH, etc.). Requires special/admin privileges to bind to these on most systems.
- **Registered ports (1024–49151)** — used by specific applications, often registered with IANA but not as strictly controlled. This is where you'll commonly run local development servers (e.g., port 3000 for a React app, port 5000 or 8000 for various backend frameworks).
- **Dynamic/private ports (49152–65535)** — used temporarily by client applications for outgoing connections.

---

# Practical Example

```bash
# Check what's running on a specific port (macOS/Linux)
lsof -i :3000

# Start a local development server (commonly seen in tutorials)
npm start   # often defaults to http://localhost:3000
```

If you've ever seen an error like "port 3000 is already in use," this is exactly the concept at play — another process is already bound to that port on your machine.

---

# Revision Questions

1. Why do we need ports in addition to IP addresses?
2. What port does HTTPS use by default? What about HTTP?
3. What range do "well-known" ports fall into, and why does binding to them typically require admin privileges?

<details><summary>Answers</summary>

1. A single device can run many network programs simultaneously; ports let each program have its own distinct communication endpoint, so data reaches the correct program rather than just the correct device.
2. HTTPS defaults to port 443; HTTP defaults to port 80.
3. Well-known ports fall into the 0–1023 range; they're reserved for standardized, often security-sensitive services, so most operating systems restrict binding to them without elevated privileges.

</details>