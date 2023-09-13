# Exflect

Exflect is an Elixir inflection library for pluralization/singularization of English words.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `exflect` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:exflect, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/exflect>.

## Usage

```
Exflect.pluralize("leaf")
# => "leaves"
Exflect.singularize("leaves")
# => "leaf"

Exflect.inflect("leaf", 0)
# => "leaves"
Exflect.inflect("leaf", 1)
# => "leaf"
Exflect.inflect("leaf", 2)
# => "leaves"

Exflect.pluralize("  LEAF   ", match_style: true)
# => "  LEAVES   "
Exflect.pluralize("  Leaf   ", match_style: true)
# => "  Leaves   "
Exflect.singularize("  LEAVES   ", match_style: true)
# => "  LEAF   "
Exflect.inflect("  LEAF  ", 2, match_style: true)
# => "  LEAVES  "
```

## FAQ

### Why build a new library?

The existing one seems to not longer be maintained, and it's quite inaccurate, and not very performant(mostly because of the heavy reliance on Regex).

Here are some accuracy comparisons based on the test suite from the most popular Python inflector library:


|-|-|
|exflect|90.5%|
|-|-|
|inflex|59.6%|


It would be possible to get Exflect higher scorewise, but that 10% is a lot of edge cases, or places where varying libraries disagree. Words like "elk" vs "elks", "buffalo" vs "buffaloes" vs "buffalos". Also Exflect doesn't currently handle phrases like "lady in waiting" correctly. You'll get "lady in waitings" rather than "ladies in waiting".

Here are some performance benchmarks:

```
Operating System: macOS
CPU Information: Apple M1 Pro
Number of Available Cores: 10
Available memory: 16 GB
Elixir 1.15.3
Erlang 26.0

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 2 s
reduction time: 2 s
parallel: 1
inputs: none specified
Estimated total run time: 33 s

Benchmarking exflect ...
Benchmarking inflex ...
Benchmarking exflect_match_style ...

Name                         ips        average  deviation         median         99th %
exflect                   2497.27        0.40 ms     ±3.16%        0.40 ms        0.44 ms
exflect_match_style        687.83        1.45 ms     ±2.01%        1.45 ms        1.55 ms
inflex                     37.39       26.75 ms     ±0.84%       26.83 ms       27.27 ms

Comparison:
exflect                   2497.27
exflect_match_style        687.83 - 3.63x slower +1.05 ms
inflex                     37.39 - 66.80x slower +26.35 ms

Memory usage statistics:

Name                  Memory usage
exflect                     0.80 MB
exflect_match_style         2.72 MB - 3.38x memory usage +1.91 MB
inflex                     3.68 MB - 4.57x memory usage +2.87 MB

**All measurements for memory usage were the same**

Reduction count statistics:

Name               Reduction count
exflect                     34.67 K
exflect_match_style        153.99 K - 4.44x reduction count +119.32 K
inflex                    686.32 K - 19.79x reduction count +651.65 K

**All measurements for reduction count were the same**
```

You can run these benchmarks yourself by running the test suite with the `benchmark` tag:

```
mix test --include benchmark
```

### Is it ready for production use?

It's still a work in progress, as there are some edge cases that aren't being covered, and some code clean up I'd like to do, but I don't imagine the API will change significantly as it's fairly straightforward.

## Credits
 
The existing Elixir library [Inflex](https://github.com/nurugger07/inflex) and the Python library [Inflect](https://github.com/jaraco/inflect) were both crucial in the devlopment of this code, so thanks to them for their work.


## License
 
The MIT License (MIT)

Copyright (c) 2015 Peter Richards

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.