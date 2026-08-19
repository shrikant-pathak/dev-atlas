# 📄 Cheat Sheet — How the Web Works

## Browser Engines

| Browser | Rendering Engine | JS Engine |
|---|---|---|
| Chrome / Edge / Brave | Blink | V8 |
| Firefox | Gecko | SpiderMonkey |
| Safari | WebKit | JavaScriptCore |

## Critical Rendering Path

HTML ──► DOM ─┐
├──► Render Tree ──► Layout ──► Paint ──► Composite
CSS ──► CSSOM ─┘

## Script Loading Attributes

| Attribute | Behavior |
|---|---|
| (none) | Blocks HTML parsing until downloaded + executed |
| `async` | Downloads in parallel, executes ASAP (may interrupt parsing) |
| `defer` | Downloads in parallel, executes after HTML parsing completes |

## Static vs. Dynamic

| | Static | Dynamic |
|---|---|---|
| Content | Same for everyone | Generated per request |
| Speed | Fast | Depends on backend logic |
| Example | Portfolio site | E-commerce dashboard |

## Cookie Attributes

| Attribute | Purpose |
|---|---|
| `Max-Age` / `Expires` | How long the cookie persists |
| `HttpOnly` | Blocks JavaScript access |
| `Secure` | Only sent over HTTPS |
| `SameSite` | Controls cross-site request behavior |

## Session vs. Token Auth

| | Session-Based | Token-Based (JWT) |
|---|---|---|
| Storage | Server-side | Encoded in the token |
| Scalability | Needs shared storage | Easier across servers |
| Revocation | Easy | Harder |

## Cache-Control Directives

| Directive | Meaning |
|---|---|
| `max-age=N` | Cache for N seconds |
| `no-cache` | Cache but revalidate first |
| `no-store` | Never cache |