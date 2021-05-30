# `mosh-static-build`: build a statically linked `mosh`

Build a statically linked `mosh` via an Alpine Linux container.
Requires `systemd-nspawn`. Mostly exists to allow for building `mosh`
from master with things like true-color without needing to maintain
an RPM build. Very lazy.

Actual execution:

```
./build.sh
```

Everything else is handled. Then install with:

```
sudo cp build/mosh-* /usr/local/bin/
sudo cp mosh/scripts/mosh /usr/local/bin/
```
