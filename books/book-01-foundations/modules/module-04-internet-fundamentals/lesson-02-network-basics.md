# Lesson 02: Network Basics

## Learning Objectives
By the end of this lesson, you will be able to:
- Define what a computer network is.
- Distinguish between LAN, WAN, and the Internet.
- Explain the basic role of routers and switches.
- Understand what a protocol is and why standardization matters.

---

# Introduction

Before diving into IP addresses, DNS, and HTTP individually, it helps to understand the basic building blocks of any network — the vocabulary and infrastructure that everything else in this module builds on.

---

# What Is a Network?

A **network** is simply two or more computers connected together so they can share data. Networks can be tiny (two laptops connected directly) or massive (the entire Internet).

---

# Types of Networks

- **LAN (Local Area Network)** — a network confined to a small physical area, like your home or office. Your home Wi-Fi is a LAN.
- **WAN (Wide Area Network)** — a network spanning a large geographic area, connecting multiple LANs together. Your ISP's network is a WAN.
- **The Internet** — the largest WAN of all: a global network connecting countless smaller networks together.

---

# Key Hardware Concepts

- **Router** — a device that directs data between different networks, deciding the best path for information to travel. Your home router connects your LAN to your ISP's WAN.
- **Switch** — a device that connects multiple devices within the same LAN, directing data to the correct device on that local network.
- **Modem** — converts signals between your ISP's infrastructure (like cable or fiber) and a format your router/devices can use.

In most homes, a single device combines a modem, router, and switch into one box — but conceptually, they're three separate jobs.

---

# What Is a Protocol?

A **protocol** is an agreed-upon set of rules governing how data is formatted and transmitted between devices. Just as two people need to speak the same language to communicate, computers need to follow the same protocol to exchange data meaningfully.

Some protocols you'll encounter throughout this module and your career:
- **TCP/IP** — the foundational protocol suite for how data is addressed and reliably delivered across the Internet
- **HTTP/HTTPS** — how browsers and servers communicate
- **DNS** — how domain names get translated into IP addresses

Without standardized protocols, a Windows PC and a Linux server couldn't reliably exchange any data at all — protocols are the shared language making the entire Internet possible.

---

# Practical Example

```bash
# Check your own device's basic network info
ipconfig      # Windows
ifconfig      # macOS/Linux (older)
ip addr       # Linux (modern)
```

This shows details like your device's local IP address on your LAN.

---

# Revision Questions

1. What's the difference between a LAN and a WAN?
2. What is the role of a router versus a switch?
3. Why do protocols matter for network communication?

<details><summary>Answers</summary>

1. A LAN is a network confined to a small area (like a home or office); a WAN spans a much larger geographic area and typically connects multiple LANs together.
2. A router directs data between different networks (e.g., your home network and the wider Internet); a switch connects devices within the same local network.
3. Protocols are agreed-upon rules for formatting and transmitting data — without them, different devices and systems couldn't reliably understand each other's data.

</details>