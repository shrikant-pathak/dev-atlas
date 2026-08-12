# Lesson 04: DNS

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what DNS is and the problem it solves.
- Describe the DNS lookup process step by step.
- Identify common DNS record types.

---

# Introduction

IP addresses like `142.250.premium.46` are precise, but nobody wants to type a string of numbers to visit a website. **DNS (Domain Name System)** solves this by letting us use memorable names like `google.com` instead — and it's one of the most important, quietly essential pieces of Internet infrastructure.

---

# What Is DNS?

DNS is often described as "the phonebook of the Internet." It translates human-readable domain names (`github.com`) into the numerical IP addresses (`140.82.112.3`) that computers actually use to locate each other on the network.

Without DNS, you'd need to memorize IP addresses for every website you visit — completely impractical at Internet scale.

---

# How a DNS Lookup Works

When you type a URL into your browser, here's the simplified sequence:

1. **Browser cache check** — the browser first checks if it already knows this domain's IP address from a recent visit.
2. **OS cache check** — if not cached in the browser, the operating system checks its own cache.
3. **Recursive DNS resolver** — if still not found, a request goes to a DNS resolver (often run by your ISP or a public service like Google's `8.8.8.8`).
4. **Root DNS servers** — the resolver asks a root server, which points it toward the correct **top-level domain (TLD)** server (e.g., for `.com`).
5. **TLD server** — points the resolver toward the specific **authoritative name server** for that domain.
6. **Authoritative name server** — returns the actual IP address for the domain.
7. **Response cached and returned** — the resolver caches this result (so future lookups are faster) and sends the IP address back to your browser.

This entire process typically takes just milliseconds, and caching at multiple levels means most lookups are even faster after the first visit.

---

# Common DNS Record Types

- **A record** — maps a domain to an IPv4 address.
- **AAAA record** — maps a domain to an IPv6 address.
- **CNAME record** — maps a domain/subdomain to another domain name (an alias).
- **MX record** — specifies mail servers responsible for receiving email for a domain.
- **TXT record** — stores arbitrary text, often used for domain verification or security policies (like SPF for email).

As a web developer, you'll interact with DNS records directly when deploying a website — pointing your domain name to your hosting provider's servers usually means configuring an A record or CNAME record.

---

# Practical Example

```bash
# Look up DNS records for a domain
nslookup github.com
dig github.com          # more detailed output (macOS/Linux)
```

---

# Revision Questions

1. What problem does DNS solve?
2. Put the DNS lookup steps in order: TLD server, browser cache, authoritative name server, root server.
3. What's the difference between an A record and a CNAME record?

<details><summary>Answers</summary>

1. It translates human-readable domain names into the numerical IP addresses computers use to locate each other, so people don't need to memorize IP addresses.
2. Browser cache → root server → TLD server → authoritative name server.
3. An A record maps a domain directly to an IPv4 address; a CNAME record maps a domain to another domain name instead of directly to an IP.

</details>