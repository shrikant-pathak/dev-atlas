# Lesson 03: IP Address

## Learning Objectives
By the end of this lesson, you will be able to:
- Define what an IP address is and why it's necessary.
- Distinguish between IPv4 and IPv6.
- Explain the difference between public and private IP addresses.
- Understand what a static vs. dynamic IP address is.

---

# Introduction

Every device connected to a network needs a unique identifier so data knows where to go — just like a house needs a street address for mail to be delivered correctly. That identifier is called an **IP address**.

---

# What Is an IP Address?

An **IP (Internet Protocol) address** is a unique numerical label assigned to each device on a network, used to identify and locate it. When your browser requests a webpage, that request needs to know exactly which server on the entire Internet to reach — the IP address makes that possible.

---

# IPv4 vs. IPv6

**IPv4** is the older, still widely used format, written as four numbers (0–255) separated by dots:

192.168.1.1

IPv4 only supports about 4.3 billion unique addresses — a number the world has essentially exhausted given how many devices now exist.

**IPv6** was created to solve this shortage, using a much longer format:

2001:0db8:85a3:0000:0000:8a2e:0370:7334

IPv6 supports an astronomically larger number of addresses, and adoption is steadily increasing, though IPv4 remains common today, especially internally.

---

# Public vs. Private IP Addresses

- **Public IP address** — a unique address visible to the entire Internet, assigned to your network by your ISP. This is how external servers know where to send data back to you.
- **Private IP address** — used only within your local network (LAN), not directly reachable from the Internet. Common private ranges include `192.168.x.x` and `10.x.x.x`.

Your router typically has one public IP address (facing the Internet) and manages many private IP addresses for devices inside your home network (your laptop, phone, smart TV), using a process called **NAT (Network Address Translation)** to route traffic correctly between them.

---

# Static vs. Dynamic IP Addresses

- **Dynamic IP** — assigned automatically and can change over time (common for most home Internet connections).
- **Static IP** — fixed and doesn't change, commonly used for servers so they can be reliably reached at the same address every time.

Web servers almost always use static IPs (or a static IP is mapped to them via DNS, covered in the next lesson), since a website's address needs to stay consistent.

---

# Practical Example

```bash
# Find your public IP address (visit in browser)
https://whatismyipaddress.com

# Find your private/local IP address
ipconfig        # Windows
ifconfig        # macOS/Linux
```

---

# Revision Questions

1. Why does every device on a network need a unique IP address?
2. What's the main difference between IPv4 and IPv6?
3. What's the difference between a public and a private IP address?

<details><summary>Answers</summary>

1. So data can be correctly routed to the right destination — without a unique identifier, the network wouldn't know where to send information.
2. IPv4 uses a shorter numeric format with a limited pool of about 4.3 billion addresses; IPv6 uses a much longer format supporting a vastly larger address space to accommodate more devices.
3. A public IP is visible to and reachable from the entire Internet; a private IP is only used within a local network and isn't directly reachable from outside it.

</details>