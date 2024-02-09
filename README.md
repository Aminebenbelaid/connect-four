# Connect four

Console based "Connect four" game.

## Game play

```shell
$ bin/connect_four
```

```shell
player x> 3
 12345678
 ........
 ........
 ........
 ........
 ........
 ........
 ........
 ..x.....
```

```shell
player o> 4
 12345678
 ........
 ........
 ........
 ........
 ........
 ........
 ........
 ..xo....
```

### Many moves later...

```shell
player x> 2

 12345678
 ........
 ........
 ........
 ........
 ........
 ........
 ..xoox..
 .xxoox.x
```

```shell
player o> 4

 12345678
 ........
 ........
 ........
 ........
 ........
 ...o....
 ..xoox..
 .xxoox.x
```

## Setup

```shell
cd connect_four
gem install bundler
```

Install ruby-3.2.3 and ensure version with:

```shell
ruby -v # => 3.2.3
```

Install dependencies with:

```shell
bundle
```

## Test

```shell
rake test
```

## Development

A test driven approach is appreciated.

Tests should be written with `minitest/spec` syntax using minitest assertions.