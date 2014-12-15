# NewRelic Erlang

**NOT USABLE YET**

## Development

NewRelic distributes its agent sdk as compiled `.so` libraries only available for Linux, so you will need to run/compile this library on that platform.

To make that easier, the project provides a Vagrant configuration that builds a Ubuntu machine suitable for development/testing.

After cloning:

    $ vagrant up
    $ vagrant ssh

Inside the vm:

    $ cd /home/newrelic-erlang

Here are the supported make tasks you can run from that position:

- `make` compiles the project
- `make clean` removes compiled library
- `make shell` starts an erlang shell
