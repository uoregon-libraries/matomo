# Matomo Container

This project aims to set up a useful Matomo service for UO. This readme was
copied from our old OWA project, and a year later I realized the mistake. Now I
have no idea what I had to do to set up Matomo, so this is almost totally void
of useful information. Sorry.

## Setup

Copy `compose.override.yml-example` to `compose.override.yml` and alter it to
specify the port you wish the Matomo container to use. You should **not** mount
any local files into the running containers in production, as this makes the
application less scalable and in some cases less secure.
