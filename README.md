# Exflect

Exflect is an Elixir inflection library for pluralization/singularization of English words.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `exflect` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:exflect, "~> 0.3.0"}
  ]
end
```

Documentation can be found on [HexDocs](https://hexdocs.pm/exflect).

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

Here are some accuracy comparisons based on the test suite compiled from other OSS inflection libraries. I've purposely removed any test data that follows the default "add 's'"/"remove 's'" rule, as it has the least value when comparing accuracy. There are about 1500 words being tested. The performance results below are also based on the same test set.



|exflect|91.1%|
|-|-|
|inflex|75.8%|


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

Name                          ips        average  deviation         median         99th %
exflect                    846.64        1.18 ms     ±2.63%        1.17 ms        1.26 ms
exflect_match_style        291.16        3.43 ms     ±2.23%        3.41 ms        3.76 ms
inflex                      18.81       53.16 ms     ±0.18%       53.14 ms       53.44 ms

Comparison:
exflect                    846.64
exflect_match_style        291.16 - 2.91x slower +2.25 ms
inflex                      18.81 - 45.00x slower +51.97 ms

Memory usage statistics:

Name                   Memory usage
exflect                     2.48 MB
exflect_match_style         6.45 MB - 2.60x memory usage +3.97 MB
inflex                      8.02 MB - 3.23x memory usage +5.53 MB

**All measurements for memory usage were the same**

Reduction count statistics:

Name                Reduction count
exflect                     87.88 K
exflect_match_style        341.98 K - 3.89x reduction count +254.10 K
inflex                    1415.14 K - 16.10x reduction count +1327.26 K

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
 
MIT License

Copyright (c) 2023 Peter Richards

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.