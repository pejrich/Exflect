# Exflect

Exflect is an Elixir inflection library for pluralization/singularization of English words.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `exflect` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:exflect, "~> 1.0.0"}
  ]
end
```

Documentation can be found on [HexDocs](https://hexdocs.pm/exflect).

## Usage

```elixir
iex> Exflect.pluralize("leaf")
"leaves"
iex> Exflect.singularize("leaves")
"leaf"

iex> Exflect.inflect("leaf", 0)
"leaves"
iex> Exflect.inflect("leaf", 1)
"leaf"
iex> Exflect.inflect("leaf", 2)
"leaves"

iex> Exflect.pluralize("  LEAF   ", match_style: true)
"  LEAVES   "
iex> Exflect.pluralize("  Leaf   ", match_style: true)
"  Leaves   "
Exflect.singularize("  LEAVES   ", match_style: iex> true)
"  LEAF   "
iex> Exflect.inflect("  LEAF  ", 2, match_style: true)
"  LEAVES  "
```

## FAQ

### Why build a new library?

The existing one seems to not longer be maintained, and it's quite inaccurate, and not very performant(mostly because of the heavy reliance on Regex).

Here are some accuracy comparisons based on the test suite compiled from other OSS inflection libraries. I've purposely removed any test data that follows the default "add 's'"/"remove 's'" rule, as it has the least value when comparing accuracy. There are about 1500 words being tested. The performance results below are also based on the same test set.



|exflect|93.5%|
|-|-|
|inflex|76.0%|


It would be possible to get Exflect higher scorewise, but that 10% is a lot of edge cases, or places where varying libraries disagree. Words like "elk" vs "elks", "buffalo" vs "buffaloes" vs "buffalos". Also Exflect doesn't currently handle phrases like "lady in waiting" correctly. You'll get "lady in waitings" rather than "ladies in waiting".

Here are some performance benchmarks:

```
Operating System: macOS
CPU Information: Apple M1 Pro
Number of Available Cores: 10
Available memory: 16 GB
Elixir 1.15.3
Erlang 26.0
JIT enabled: true

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 1 s
reduction time: 1 s
parallel: 1
inputs: none specified
Estimated total run time: 36 s

Benchmarking exflect ...
Benchmarking inflex ...
Benchmarking exflect_check ...
Benchmarking exflect_match_style ...
Calculating statistics...
Formatting results...

Name                          ips        average  deviation         median         99th %
exflect                    907.90        1.10 ms     ±3.40%        1.09 ms        1.24 ms
exflect_match_style        305.59        3.27 ms     ±2.10%        3.26 ms        3.47 ms
exflect_check               27.16       36.82 ms     ±0.76%       36.76 ms       37.46 ms
inflex                      19.08       52.42 ms     ±0.35%       52.42 ms       52.76 ms

Comparison:
exflect                    907.90
exflect_match_style        305.59 - 2.97x slower +2.17 ms
exflect_check               27.16 - 33.42x slower +35.71 ms
inflex                      19.08 - 47.59x slower +51.32 ms

Memory usage statistics:

Name                        average  deviation         median         99th %
exflect                     2.20 MB     ±0.00%        2.20 MB        2.20 MB
exflect_match_style         6.04 MB     ±0.00%        6.04 MB        6.04 MB
exflect_check               6.41 MB     ±0.00%        6.41 MB        6.41 MB
inflex                      7.93 MB     ±0.00%        7.93 MB        7.93 MB

Comparison:
exflect                     2.20 MB
exflect_match_style         6.04 MB - 2.75x memory usage +3.84 MB
exflect_check               6.41 MB - 2.92x memory usage +4.21 MB
inflex                      7.93 MB - 3.61x memory usage +5.74 MB

Reduction count statistics:

Name                Reduction count
exflect                     0.104 M
exflect_match_style          0.36 M - 3.40x reduction count +0.25 M
exflect_check                1.05 M - 10.09x reduction count +0.95 M
inflex                       1.40 M - 13.40x reduction count +1.30 M

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
