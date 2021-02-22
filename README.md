# vmq_lfe_plugin

[![Build Status][travis badge]][travis]
[![LFE Versions][lfe badge]][lfe]
[![Erlang Versions][erlang badge]][versions]
[![Tag][github tag badge]][github tag]
[![Downloads][hex downloads]][hex package]

[![Project Logo][logo]][logo-large]

*An LFE application*

##### Table of Contents

* [About](#about-)
* [Build](#build-)
* [Enable the Plugin](#enable-the-plugin-)
* [Tests](#tests-)
* [License](#license-)

## About [&#x219F;](#table-of-contents)

**vmq_lfe_plugin** is a Plugin template you can use to build a full VerneMQ Plugin in LFE (Lisp Flavoured Erlang).


## Build [&#x219F;](#table-of-contents)

To build a binary version of the plugin, run

```shell
$ rebar3 lfe compile
```

# Enable the Plugin [&#x219F;](#table-of-contents)

You can dynamically enable your Plugin with VerneMQ's `vmq-admin` command line tool, or in the `vernemq.conf` file.

### with `vmq-admin`

```shell
$ vmq-admin plugin enable --name=vmq_lfe_plugin --path=/your-vernemq-plugins/vmq_lfe_plugin
```
### with `vernemq.conf`

Add below lines to the `vernemq.conf`. This will enable the plugin after every VerneMQ reboot. Also note that the path needs to go down to the `_build/default/lib/vmq_lfe_plugin` folder. (The `_build` directory is created by calling the `rebar3` compile command as described above)

```erlang
plugins.vmq_lfe_plugin = on
plugins.vmq_lfe_plugin.path = path/to/my-verne-plugins/vmq_lfe_plugin
```

# Tests [&#x219F;](#table-of-contents)

```shell
$ rebar3 lfe test
```

## License [&#x219F;](#table-of-contents)

Apache License, Version 2.0

Copyright © 2021, Andre Fatton.

<!-- Named page links below: /-->

[logo]: https://avatars1.githubusercontent.com/u/3434967?s=250
[logo-large]: https://avatars1.githubusercontent.com/u/3434967
[github]: https://github.com/ORG/vmq_lfe_plugin
[gitlab]: https://gitlab.com/ORG/vmq_lfe_plugin
[travis]: https://travis-ci.org/ORG/vmq_lfe_plugin
[travis badge]: https://img.shields.io/travis/ORG/vmq_lfe_plugin.svg
[gh-actions-badge]: https://github.com/ORG/vmq_lfe_plugin/workflows/Go/badge.svg
[gh-actions]: https://github.com/ORG/vmq_lfe_plugin/actions
[lfe]: https://github.com/rvirding/lfe
[lfe badge]: https://img.shields.io/badge/lfe-1.3.0-blue.svg
[erlang badge]: https://img.shields.io/badge/erlang-19%20to%2023-blue.svg
[version]: https://github.com/ORG/vmq_lfe_plugin/blob/master/.travis.yml
[github tags]: https://github.com/ORG/vmq_lfe_plugin/tags
[github tags badge]: https://img.shields.io/github/tag/ORG/vmq_lfe_plugin.svg
[github downloads]: https://img.shields.io/github/downloads/ORG/vmq_lfe_plugin/total.svg
[hex badge]: https://img.shields.io/hexpm/v/vmq_lfe_plugin.svg?maxAge=2592000
[hex package]: https://hex.pm/packages/vmq_lfe_plugin
[hex downloads]: https://img.shields.io/hexpm/dt/vmq_lfe_plugin.svg
