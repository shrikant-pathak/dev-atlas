# Lesson 06: HTTPS

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what HTTPS is and how it differs from HTTP.
- Describe the basic concept of TLS/SSL encryption.
- Understand what an SSL/TLS certificate is and why it matters.
- Explain why HTTPS matters for both security and SEO.

---

# Introduction

Plain HTTP sends data in readable plain text — meaning anyone intercepting the connection (on public Wi-Fi, for instance) could read passwords, credit card numbers, or any other sensitive data being transmitted. **HTTPS** fixes this by adding encryption on top of HTTP.

---

# What Is HTTPS?

**HTTPS (HTTP Secure)** is HTTP layered on top of **TLS (Transport Layer Security)**, formerly known as SSL (Secure Sockets Layer). It encrypts the data exchanged between client and server, so even if someone intercepts the traffic, they can't read its contents.

You can visually confirm HTTPS is active by the padlock icon in your browser's address bar and the `https://` prefix in the URL.

---

# How TLS Encryption Works (Simplified)

1. **TLS Handshake** — before any data is exchanged, the browser and server perform a "handshake": the server presents its **SSL/TLS certificate**, and both sides agree on an encryption method and generate shared encryption keys.
2. **Certificate verification** — the browser checks that the certificate is valid and issued by a trusted **Certificate Authority (CA)** — this is how your browser knows it's really talking to `github.com` and not an impostor.
3. **Encrypted communication** — once the handshake completes, all further data is encrypted using the agreed-upon keys, unreadable to anyone intercepting it in transit.

---

# What Is an SSL/TLS Certificate?

A certificate is a digital document issued by a trusted Certificate Authority (like Let's Encrypt, DigiCert, or others) that verifies a website's identity and enables encrypted connections. Certificates:
- Confirm the domain actually belongs to who it claims to
- Contain a public key used as part of the encryption process
- Have an expiration date and must be renewed periodically

Services like **Let's Encrypt** provide free certificates and have made HTTPS the default expectation for virtually all websites today, not just ones handling sensitive data.

---

# Why HTTPS Matters

1. **Security** — protects sensitive data (passwords, payment info, personal details) from interception.
2. **Trust** — the padlock icon reassures users the site is legitimate and secure.
3. **SEO** — search engines like Google factor HTTPS into search rankings, favoring secure sites.
4. **Required by modern browsers** — many browser features (like camera/microphone access) only work over HTTPS, and browsers actively flag HTTP sites as "Not Secure."

---

# Practical Example

Open DevTools → click the padlock icon in your browser's address bar on any site → view certificate details, including issuer and expiration date.

---

# Revision Questions

1. What does HTTPS add on top of regular HTTP?
2. What is a Certificate Authority, and why does it matter?
3. Name two practical reasons a website should use HTTPS beyond just "it's more secure."

<details><summary>Answers</summary>

1. Encryption via TLS (formerly SSL), protecting data in transit from being read by anyone intercepting it.
2. A Certificate Authority is a trusted organization that verifies and issues SSL/TLS certificates, allowing browsers to confirm a website's identity is legitimate.
3. Any two of: better SEO ranking, browser trust indicators (padlock, avoiding "Not Secure" warnings), access to modern browser features that require HTTPS.

</details>