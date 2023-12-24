defmodule Exflect.Detect do
  @moduledoc false
  @sg [
    ~r/[bcdfgjkmruopquvxzw]$/,
    ~r/ss$/,
    ~r/sis$/,
    ~r/thos$/,
    ~r/pus$/,
    ~r/tis$/,
    ~r/^[a-z]{1}s$/,
    ~r/us$/,
    ~r/(n|r)is$/,
    ~r/tmas$/,
    ~r/[abefgjklpqywxyz]a$/,
    ~r/[^i]ca$/,
    ~r/[^n]da$/,
    ~r/[^p]ha$/,
    ~r/([^dvtlar])ia$/,
    ~r/([^i]|(cteri|at|ul|at|asi|di|nd|ov|ri))a$/,
    ~r/(z|h|g|b|r|l)eria$/,
    ~r/[^ci]teria$/,
    ~r/[^cb]ilia$/,
    ~r/[^xi]lia$/,
    ~r/[^e]ma$/,
    ~r/[^aeu]na$/,
    ~r/[^ciam][a-z]na$/,
    ~r/[ifo]\w{2}na$/,
    ~r/[^aip]ta$/,
    ~r/[^rmpe][a-z]ta$/,
    ~r/[^gart][a-z][a-z]ta$/,
    ~r/(a)e$/,
    ~r/people$/,
    ~r/[^t][^t][^o][^i][^a]e$/,
    ~r/[^i][^t]h$/,
    ~r/[uacgzheimnot][a-z]i$/,
    ~r/[^atvliopcbnmgfds][a-z]*i$/,
    ~r/[a-z][^ertiopasl][a-z]+[a-z]i$/,
    ~r/[^e]l$/,
    ~r/[^e]n$/
  ]

  @pl [
    ~r/men$/,
    ~r/sortia$/,
    ~r/^media$/,
    ~r/^cilia$/,
    ~r/abilia$/,
    ~r/trivia$/,
    ~r/[^jtma](chi*|yn|ol|am|i|umn|os|an|ermin|omb|ul|eol|cle|on|un)i$/,
    ~r/(um|pa|ro)ni$/,
    ~r/(uo|io)si$/,
    ~r/onchi$/,
    ~r/(o|u|a)li$/,
    ~r/(e|i)i$/,
    ~r/ies$/,
    ~r/ves$/,
    ~r/es$/,
    ~r/[aouiey]ys$/,
    ~r/oos$/,
    ~r/ios$/,
    ~r/[tfg]ee[sth]{1,2}e*$/,
    ~r/[^aouies][aoui]s$/,
    ~r/[ea]s$/,
    ~r/[^aouie]s$/
  ]

  def singular?(word), do: Enum.any?(@sg, &Regex.match?(&1, word)) || !plural?(word)
  def plural?(word), do: Enum.any?(@pl, &Regex.match?(&1, word))
end
