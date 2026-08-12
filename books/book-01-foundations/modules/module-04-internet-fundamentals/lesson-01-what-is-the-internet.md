# Lesson 01: What is the Internet?

## Learning Objectives
By the end of this lesson, you will be able to:
- Define the Internet and distinguish it from the World Wide Web.
- Explain the basic idea of a "network of networks."
- Understand the historical origins of the Internet at a high level.

---

# Introduction

You've learned how a single computer works internally, and how its operating system manages that hardware. But almost nothing you build as a web developer will live on a single, isolated machine — it'll be reachable by anyone, anywhere, over the Internet. This module shifts focus from a single computer to the global network connecting billions of them.

---

# What the Internet Actually Is

The **Internet** is a massive, decentralized network of interconnected computer networks that communicate using a shared set of rules (protocols). It's often described as a "network of networks" — your home Wi-Fi network connects to your Internet Service Provider's (ISP) network, which connects to larger backbone networks, which connect to other ISPs and networks around the world.

No single company or government owns the Internet. It works because everyone agrees to speak the same technical language — a set of standardized protocols (which you'll learn about later in this module: IP, HTTP, DNS, and more).

---

# Internet vs. World Wide Web

These terms are often used interchangeably, but they're not the same thing:

- **The Internet** is the physical and logical infrastructure — the cables, routers, satellites, and protocols that let computers exchange data globally.
- **The World Wide Web (WWW)** is just one service that runs on top of the Internet — a system of interlinked documents (webpages) accessed via browsers using HTTP.

Other services also run on the Internet without being part of the "Web" — email (SMTP), file transfer (FTP), video calls, online gaming, and more. The Web is the most visible use of the Internet, but it's not the whole thing.

---

# A Brief History

The Internet's roots trace back to **ARPANET**, a US Department of Defense project in the late 1960s designed to let computers at different universities communicate, even if part of the network failed. Over the following decades, standardized protocols (like TCP/IP) were developed, allowing different networks to interconnect reliably — this interconnection is literally where the name "Internet" (inter-network) comes from.

The World Wide Web itself wasn't invented until 1989, by Tim Berners-Lee — decades after the Internet's underlying infrastructure already existed.

---

# Why This Distinction Matters for Developers

Understanding that the Web is just one application running on top of the Internet helps clarify a lot of concepts you'll meet later: why email works differently from browsing a website, why some apps use direct network connections instead of a browser, and why terms like "the Internet is down" and "the website is down" mean genuinely different things.

---

# Revision Questions

1. What is the key difference between the Internet and the World Wide Web?
2. What does it mean to call the Internet a "network of networks"?
3. Who invented the World Wide Web, and in what year?

<details><summary>Answers</summary>

1. The Internet is the underlying global infrastructure and set of protocols connecting networks; the World Wide Web is one particular service (interlinked documents/webpages) that runs on top of that infrastructure.
2. It means many individual networks (home networks, ISP networks, corporate networks) are all interconnected to form one larger global network.
3. Tim Berners-Lee, in 1989.

</details>