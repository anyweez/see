# Shortlinks for LAN's

This is a simple webapp that makes it easy to shorten URL's within a network. It doesn't do much else.

The intended use for the app is in conjunction with a custom DNS entry, such as `c`, so that a shortlink would be something like `c/news` or `c/mail`. Throughout this documentation I'll assume you've resolving `c` to your server, though you can replace this with any name you like.

## Available routes

- `c/{name}` - if `name` is an existing shortlink, redirect to the target. If it does not exist, go to the shortlink creation page for that name.
- `c/_` - view and manage all existing shortlinks
- `c/_{name}` - manage the `name` shortlink