cat > interview.md << 'EOF'
# Interview Questions — How the Web Works

## Beginner
- What are the main components of a web browser?
- What is the DOM?
- What is a cookie used for?
- What's the difference between a static and a dynamic website?

## Intermediate
- Walk through the critical rendering path, from HTML/CSS to pixels on screen.
- What's the difference between `async` and `defer` script loading?
- What's the difference between a cookie and a session?
- What does the `Cache-Control` header control, and name two common values.

## Advanced
- Why can excessive DOM manipulation cause performance issues, in terms of the rendering pipeline?
- Compare session-based authentication with token-based (JWT) authentication — what are the tradeoffs?
- How does cache invalidation typically work for static assets in a production web application?
- Explain how a page load involves many separate HTTP requests, and how browsers optimize loading them.
EOF