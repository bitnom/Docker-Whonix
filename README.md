# Docker-Whonix

I need this for a project. I have started by creating a Dockerfile for the whonix-gateway-cli. It doesn't complete the build yet but I feel like I'm close to getting it working.

**Contributors welcome**

## Current Build Error

```shell
+ sudo --non-interactive -u root git submodule update --init --recursive --jobs=200
+ true 'INFO: Updated git sub modules.'
+ mkdir -p /usr/lib/security-misc
+ cp /home/user/Whonix/packages/security-misc//usr/lib/security-misc/apt-get-wrapper /usr/lib/security-misc/apt-get-wrapper
+ cp /home/user/Whonix/packages/security-misc//usr/lib/security-misc/apt-get-update-sanity-test /usr/lib/security-misc/apt-get-update-sanity-test
+ /home/user/Whonix/packages/security-misc//usr/lib/security-misc/apt-get-wrapper -o Acquire::http::Proxy=http://127.0.0.1:3142 -o Acquire::https::Proxy=http://127.0.0.1:3142 -o Acquire::tor::Proxy=http://127.0.0.1:3142 -o Acquire::Languages=none -o Acquire::IndexTargets::deb::Contents-deb::DefaultEnabled=false -o Apt::Install-Recommends=false -o Acquire::Retries=3 -o Dpkg::Options::=--force-confnew -o Dir::Etc::sourcelist=/home/user/Whonix/build_sources/debian_stable_current_clearnet.list -o Dir::Etc::sourceparts=- update
Ign:1 http://HTTPS///deb.debian.org/debian-security buster/updates InRelease
Ign:2 http://HTTPS///deb.debian.org/debian buster-updates InRelease
Ign:3 http://HTTPS///deb.debian.org/debian buster InRelease
Ign:1 http://HTTPS///deb.debian.org/debian-security buster/updates InRelease
Ign:2 http://HTTPS///deb.debian.org/debian buster-updates InRelease
Ign:3 http://HTTPS///deb.debian.org/debian buster InRelease
Ign:1 http://HTTPS///deb.debian.org/debian-security buster/updates InRelease
Ign:2 http://HTTPS///deb.debian.org/debian buster-updates InRelease
Ign:3 http://HTTPS///deb.debian.org/debian buster InRelease
Err:1 http://HTTPS///deb.debian.org/debian-security buster/updates InRelease
  Could not connect to 127.0.0.1:3142 (127.0.0.1). - connect (111: Connection refused)
Err:2 http://HTTPS///deb.debian.org/debian buster-updates InRelease
  Unable to connect to 127.0.0.1:3142:
Err:3 http://HTTPS///deb.debian.org/debian buster InRelease
  Unable to connect to 127.0.0.1:3142:
Reading package lists...
W: Failed to fetch http://HTTPS///deb.debian.org/debian-security/dists/buster/updates/InRelease  Could not connect to 127.0.0.1:3142 (127.0.0.1). - connect (111: Connection refused)
W: Failed to fetch http://HTTPS///deb.debian.org/debian/dists/buster-updates/InRelease  Unable to connect to 127.0.0.1:3142:
W: Failed to fetch http://HTTPS///deb.debian.org/debian/dists/buster/InRelease  Unable to connect to 127.0.0.1:3142:
W: Some index files failed to download. They have been ignored, or old ones used instead.
++ errorhandlergeneral ERR
```

Wonderful reply regarding error: [build-error-apt-debian-base-on-docker/11132/2](https://forums.whonix.org/t/build-error-apt-debian-base-on-docker/11132/2) (Working on fix)

## Related Repos

[Whonix-Packer](https://github.com/TensorTom/Whonix-Packer) - Trying to deploy Whonix everywhere.

[Dockernymous](https://github.com/bcapptain/dockernymous) - Not the same goals (Not exactly Whonix) but still helpful.


### MIT License
