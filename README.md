# Matomo Container

This project aims to set up a useful Matomo service for UO. This readme was
copied from our old OWA project, and may still have some inaccuracies. I didn't
realize it needed a rewrite for over a year after deployment.

## Setup

**Note**: I'm not sure about all these steps as I have no idea anymore how
Matomo works when first set up. Stuff may be missing or incorrect :(

1. Copy `compose.override.yml-example` to `compose.override.yml`
   and alter it to specify the port you wish the Matomo container to use.
   - You should **not** mount any local files into the running containers in
     production, as this makes the application less scalable and in some cases
     less secure.
2. Visit the site at the public URL and fill in the initial data and admin
   user. Make sure the default admin user's name is *not* "adm" or "admin" or
   anything else obvious. Choose a random, secure password.
3. Enable the server for public access. Do not do this before step 3. You do
   not want somebody accidentally hitting the setup pages and hijacking the
   server, even if it's nothing more than a minor annoyance.
