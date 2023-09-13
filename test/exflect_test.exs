defmodule ExflectTest do
  use ExUnit.Case
  doctest Exflect

  @data [
    {"abscissa", "abscissas"},
    {"accomplice", "accomplices"},
    {"Achinese", "Achinese"},
    {"acropolis", "acropolises"},
    {"adieu", "adieus"},
    {"adjutant general", "adjutant generals"},
    {"aegis", "aegises"},
    {"afflatus", "afflatuses"},
    {"afreet", "afreets"},
    {"afrit", "afrits"},
    {"agendum", "agenda"},
    {"aide-de-camp", "aides-de-camp"},
    {"Alabaman", "Alabamans"},
    {"albino", "albinos"},
    {"album", "albums"},
    {"Alfurese", "Alfurese"},
    {"alga", "algae"},
    {"alias", "aliases"},
    {"alto", "altos"},
    {"alumna", "alumnae"},
    {"alumnus", "alumni"},
    {"alveolus", "alveoli"},
    {"ambassador-at-large", "ambassadors-at-large"},
    {"Amboinese", "Amboinese"},
    {"Americanese", "Americanese"},
    {"amoeba", "amoebas"},
    {"Amoyese", "Amoyese"},
    {"analysis", "analyses"},
    {"anathema", "anathemas"},
    {"Andamanese", "Andamanese"},
    {"Angolese", "Angolese"},
    {"Annamese", "Annamese"},
    {"antenna", "antennas"},
    {"anus", "anuses"},
    {"apex", "apexes"},
    {"aphelion", "aphelia"},
    {"apparatus", "apparatuses"},
    {"appendix", "appendixes"},
    {"apple", "apples"},
    {"aquarium", "aquariums"},
    {"Aragonese", "Aragonese"},
    {"Arakanese", "Arakanese"},
    {"archipelago", "archipelagos"},
    {"armadillo", "armadillos"},
    {"arpeggio", "arpeggios"},
    {"arthritis", "arthritises"},
    {"asbestos", "asbestoses"},
    {"asparagus", "asparaguses"},
    {"ass", "asses"},
    {"Assamese", "Assamese"},
    {"asylum", "asylums"},
    {"asyndeton", "asyndeta"},
    {"ataman", "atamans"},
    {"atlas", "atlases"},
    {"atman", "atmas"},
    {"attorney of record", "attorneys of record"},
    {"aurora", "auroras"},
    {"auto", "autos"},
    {"auto-da-fe", "autos-da-fe"},
    {"aviatrix", "aviatrixes"},
    {"Avignonese", "Avignonese"},
    {"axe", "axes"},
    {"axman", "axmen"},
    {"Azerbaijanese", "Azerbaijanese"},
    {"bacillus", "bacilli"},
    {"bacterium", "bacteria"},
    {"Bahaman", "Bahamans"},
    {"Balinese", "Balinese"},
    {"bamboo", "bamboos"},
    {"banjo", "banjoes"},
    {"basso", "bassos"},
    {"bathos", "bathoses"},
    {"beau", "beaus"},
    {"beef", "beefs"},
    {"Bengalese", "Bengalese"},
    {"Bernese", "Bernese"},
    {"Bhutanese", "Bhutanese"},
    {"bias", "biases"},
    {"biceps", "biceps"},
    {"bison", "bisons"},
    {"black olive", "black olives"},
    {"blouse", "blouses"},
    {"Bolognese", "Bolognese"},
    {"bonus", "bonuses"},
    {"Borghese", "Borghese"},
    {"boss", "bosses"},
    {"Bostonese", "Bostonese"},
    {"box", "boxes"},
    {"boy", "boys"},
    {"bravo", "bravoes"},
    {"bream", "bream"},
    {"breeches", "breeches"},
    {"bride-to-be", "brides-to-be"},
    {"Brigadier General", "Brigadier Generals"},
    {"britches", "britches"},
    {"bronchitis", "bronchitises"},
    {"bronchus", "bronchi"},
    {"brother", "brothers"},
    {"buffalo", "buffaloes"},
    {"Buginese", "Buginese"},
    {"buoy", "buoys"},
    {"bureau", "bureaus"},
    {"Burman", "Burmans"},
    {"Burmese", "Burmese"},
    {"bursitis", "bursitises"},
    {"bus", "buses"},
    {"butter", "butter"},
    {"buzz", "buzzes"},
    {"caddis", "caddises"},
    {"caiman", "caimans"},
    {"cake", "cakes"},
    {"Calabrese", "Calabrese"},
    {"calf", "calves"},
    {"callus", "calluses"},
    {"Camaldolese", "Camaldolese"},
    {"cameo", "cameos"},
    {"campus", "campuses"},
    {"candelabrum", "candelabra"},
    {"cannabis", "cannabises"},
    {"canto", "cantos"},
    {"Cantonese", "Cantonese"},
    {"cantus", "cantus"},
    {"canvas", "canvases"},
    {"CAPITAL", "CAPITALS"},
    {"carcinoma", "carcinomas"},
    {"care", "cares"},
    {"cargo", "cargoes"},
    {"caribou", "caribous"},
    {"Carlylese", "Carlylese"},
    {"carmen", "carmina"},
    {"carp", "carp"},
    {"cash", "cash"},
    {"Cassinese", "Cassinese"},
    {"cat", "cats"},
    {"catfish", "catfish"},
    {"cattle", "cattles"},
    {"cayman", "caymans"},
    {"Celanese", "Celanese"},
    {"ceriman", "cerimans"},
    {"cervid", "cervids"},
    {"Ceylonese", "Ceylonese"},
    {"chairman", "chairmen"},
    {"chamois", "chamois"},
    {"chaos", "chaoses"},
    {"chapeau", "chapeaus"},
    {"charisma", "charismas"},
    {"chassis", "chassis"},
    {"chateau", "chateaus"},
    {"cherub", "cherubs"},
    {"chickenpox", "chickenpox"},
    {"chief", "chiefs"},
    {"child", "children"},
    {"chili", "chilis"},
    {"Chinese", "Chinese"},
    {"oatmeal cookie", "oatmeal cookies"},
    {"chorus", "choruses"},
    {"chrysalis", "chrysalises"},
    {"church", "churches"},
    {"cicatrix", "cicatrixes"},
    {"circus", "circuses"},
    {"class", "classes"},
    {"clippers", "clippers"},
    {"clitoris", "clitorises"},
    {"cod", "cod"},
    {"codex", "codices"},
    {"coitus", "coitus"},
    {"commando", "commandos"},
    {"compendium", "compendiums"},
    {"coney", "coneys"},
    {"Congoese", "Congoese"},
    {"Congolese", "Congolese"},
    {"conspectus", "conspectuses"},
    {"contralto", "contraltos"},
    {"contretemps", "contretemps"},
    {"conundrum", "conundrums"},
    {"corps", "corps"},
    {"corpus", "corpuses"},
    {"cortex", "cortexes"},
    {"cosmos", "cosmoses"},
    {"cow", "cows"},
    {"cranium", "craniums"},
    {"crescendo", "crescendos"},
    {"criterion", "criteria"},
    {"curriculum", "curriculums"},
    {"czech", "czechs"},
    {"dais", "daises"},
    {"data point", "data points"},
    {"datum", "data"},
    {"debris", "debris"},
    {"decorum", "decorums"},
    {"deer", "deer"},
    {"delphinium", "delphiniums"},
    {"desideratum", "desiderata"},
    {"desman", "desmans"},
    {"diabetes", "diabetes"},
    {"dictum", "dictums"},
    {"digitalis", "digitalises"},
    {"dingo", "dingoes"},
    {"diploma", "diplomas"},
    {"discus", "discuses"},
    {"dish", "dishes"},
    {"ditto", "dittos"},
    {"djinn", "djinn"},
    {"dog", "dogs"},
    {"dogma", "dogmas"},
    {"dolman", "dolmans"},
    {"dominatrix", "dominatrixes"},
    {"domino", "dominoes"},
    {"Dongolese", "Dongolese"},
    {"dormouse", "dormice"},
    {"drama", "dramas"},
    {"drum", "drums"},
    {"dwarf", "dwarves"},
    {"dynamo", "dynamos"},
    {"edema", "edemas"},
    {"eland", "elands"},
    {"elf", "elves"},
    {"elk", "elks"},
    {"embryo", "embryos"},
    {"emporium", "emporiums"},
    {"encephalitis", "encephalitises"},
    {"encomium", "encomiums"},
    {"enema", "enemas"},
    {"enigma", "enigmas"},
    {"epidermis", "epidermises"},
    {"epididymis", "epididymises"},
    {"erratum", "errata"},
    {"ethos", "ethoses"},
    {"eucalyptus", "eucalyptuses"},
    {"eunuch", "eunuchs"},
    {"extremum", "extrema"},
    {"eyas", "eyases"},
    {"factotum", "factotums"},
    {"farman", "farmans"},
    {"Faroese", "Faroese"},
    {"fauna", "faunas"},
    {"fax", "faxes"},
    {"Ferrarese", "Ferrarese"},
    {"ferry", "ferries"},
    {"fetus", "fetuses"},
    {"fiance", "fiances"},
    {"fiancee", "fiancees"},
    {"fiasco", "fiascos"},
    {"fish", "fish"},
    {"fizz", "fizzes"},
    {"flamingo", "flamingoes"},
    {"flittermouse", "flittermice"},
    {"flora", "floras"},
    {"flounder", "flounder"},
    {"focus", "focuses"},
    {"foetus", "foetuses"},
    {"folio", "folios"},
    {"Foochowese", "Foochowese"},
    {"foot", "feet"},
    {"foramen", "foramens"},
    {"formula", "formulas"},
    {"forum", "forums"},
    {"fox", "foxes"},
    {"fungus", "funguses"},
    {"Gabunese", "Gabunese"},
    {"gallows", "gallows"},
    {"ganglion", "ganglions"},
    {"gas", "gases"},
    {"gateau", "gateaus"},
    {"general", "generals"},
    {"generalissimo", "generalissimos"},
    {"Genevese", "Genevese"},
    {"genie", "genies"},
    {"Genoese", "Genoese"},
    {"genus", "genera"},
    {"German", "Germans"},
    {"ghetto", "ghettos"},
    {"Gilbertese", "Gilbertese"},
    {"glottis", "glottises"},
    {"Goanese", "Goanese"},
    {"goat", "goats"},
    {"goose", "geese"},
    {"goy", "goys"},
    {"graffiti", "graffiti"},
    {"grizzly", "grizzlies"},
    {"guano", "guanos"},
    {"guardsman", "guardsmen"},
    {"Guianese", "Guianese"},
    {"gumma", "gummas"},
    {"gunman", "gunmen"},
    {"gymnasium", "gymnasiums"},
    {"Hainanese", "Hainanese"},
    {"handkerchief", "handkerchiefs"},
    {"Hararese", "Hararese"},
    {"Harlemese", "Harlemese"},
    {"harman", "harmans"},
    {"harmonium", "harmoniums"},
    {"Havanese", "Havanese"},
    {"headquarters", "headquarters"},
    {"Heavenese", "Heavenese"},
    {"helix", "helices"},
    {"hepatitis", "hepatitises"},
    {"hero", "heroes"},
    {"herpes", "herpes"},
    {"hetman", "hetmans"},
    {"hiatus", "hiatuses"},
    {"highlight", "highlights"},
    {"hijinks", "hijinks"},
    {"hippopotamus", "hippopotamuses"},
    {"Hiroshiman", "Hiroshimans"},
    {"honorarium", "honorariums"},
    {"hoof", "hoofs"},
    {"Hoosierese", "Hoosierese"},
    {"Hottentotese", "Hottentotese"},
    {"house", "houses"},
    {"housewife", "housewives"},
    {"hubris", "hubrises"},
    {"human", "humans"},
    {"Hunanese", "Hunanese"},
    {"hydra", "hydras"},
    {"hyperbaton", "hyperbata"},
    {"hyperbola", "hyperbolas"},
    {"I", "we"},
    {"ibis", "ibises"},
    {"ignoramus", "ignoramuses"},
    {"impetus", "impetuses"},
    {"incubus", "incubuses"},
    {"index", "indexes"},
    {"Indochinese", "Indochinese"},
    {"inferno", "infernos"},
    {"infinity", "infinities"},
    {"information", "information"},
    {"innings", "innings"},
    {"interregnum", "interregnums"},
    {"iris", "irises"},
    {"itself", "themselves"},
    {"jackanapes", "jackanapes"},
    {"Japanese", "Japanese"},
    {"Javanese", "Javanese"},
    {"Jerry", "Jerrys"},
    {"jerry", "jerries"},
    {"jinx", "jinxes"},
    {"Johnsonese", "Johnsonese"},
    {"Jones", "Joneses"},
    {"jumbo", "jumbos"},
    {"Kanarese", "Kanarese"},
    {"Kiplingese", "Kiplingese"},
    {"Kongoese", "Kongoese"},
    {"Kongolese", "Kongolese"},
    {"lacuna", "lacunas"},
    {"lady in waiting", "ladies in waiting"},
    {"Lapponese", "Lapponese"},
    {"larynx", "larynxes"},
    {"latex", "latexes"},
    {"lawman", "lawmen"},
    {"layman", "laymen"},
    {"Lebanese", "Lebanese"},
    {"leman", "lemans"},
    {"lemma", "lemmas"},
    {"lens", "lenses"},
    {"Leonese", "Leonese"},
    {"lick of the cat", "licks of the cat"},
    {"Lieutenant General", "Lieutenant Generals"},
    {"lie", "lies"},
    {"life", "lives"},
    {"Liman", "Limans"},
    {"lingo", "lingos"},
    {"loaf", "loaves"},
    {"locus", "loci"},
    {"Londonese", "Londonese"},
    {"lore", "lores"},
    {"Lorrainese", "Lorrainese"},
    {"lothario", "lotharios"},
    {"louse", "lice"},
    {"Lucchese", "Lucchese"},
    {"lumbago", "lumbagos"},
    {"lumen", "lumens"},
    {"lummox", "lummoxes"},
    {"lustrum", "lustrums"},
    {"lyceum", "lyceums"},
    {"lymphoma", "lymphomas"},
    {"lynx", "lynxes"},
    {"Lyonese", "Lyonese"},
    {"Macanese", "Macanese"},
    {"Macassarese", "Macassarese"},
    {"mackerel", "mackerel"},
    {"macro", "macros"},
    {"madman", "madmen"},
    {"Madurese", "Madurese"},
    {"magma", "magmas"},
    {"magneto", "magnetos"},
    {"Major General", "Major Generals"},
    {"Malabarese", "Malabarese"},
    {"Maltese", "Maltese"},
    {"man", "men"},
    {"mandamus", "mandamuses"},
    {"manifesto", "manifestos"},
    {"mantis", "mantises"},
    {"marquis", "marquises"},
    {"Mary", "Marys"},
    {"maximum", "maximums"},
    {"measles", "measles"},
    {"medico", "medicos"},
    {"medium", "mediums"},
    {"medusa", "medusas"},
    {"memorandum", "memorandums"},
    {"meniscus", "menisci"},
    {"merman", "mermen"},
    {"Messinese", "Messinese"},
    {"metamorphosis", "metamorphoses"},
    {"metropolis", "metropolises"},
    {"mews", "mews"},
    {"miasma", "miasmas"},
    {"Milanese", "Milanese"},
    {"milieu", "milieus"},
    {"millennium", "millenniums"},
    {"minimum", "minimums"},
    {"minx", "minxes"},
    {"mittamus", "mittamuses"},
    {"Modenese", "Modenese"},
    {"momentum", "momentums"},
    {"money", "monies"},
    {"mongoose", "mongooses"},
    {"moose", "moose"},
    {"mother-in-law", "mothers-in-law"},
    {"mouse", "mice"},
    {"mumps", "mumps"},
    {"Muranese", "Muranese"},
    {"murex", "murices"},
    {"museum", "museums"},
    {"mustachio", "mustachios"},
    {"myself", "ourselves"},
    {"mythos", "mythoi"},
    {"Nakayaman", "Nakayamans"},
    {"Nankingese", "Nankingese"},
    {"nasturtium", "nasturtiums"},
    {"Navarrese", "Navarrese"},
    {"nebula", "nebulas"},
    {"Nepalese", "Nepalese"},
    {"neuritis", "neuritises"},
    {"neurosis", "neuroses"},
    {"news", "news"},
    {"nexus", "nexus"},
    {"Niasese", "Niasese"},
    {"Nicobarese", "Nicobarese"},
    {"nimbus", "nimbuses"},
    {"Nipponese", "Nipponese"},
    {"no", "noes"},
    {"Norman", "Normans"},
    {"nostrum", "nostrums"},
    {"noumenon", "noumena"},
    {"nova", "novas"},
    {"nucleolus", "nucleoluses"},
    {"nucleus", "nuclei"},
    {"numen", "numina"},
    {"oaf", "oafs"},
    {"occiput", "occiputs"},
    {"octavo", "octavos"},
    {"octopus", "octopuses"},
    {"oedema", "oedemas"},
    {"Oklahoman", "Oklahomans"},
    {"omnibus", "omnibuses"},
    {"onus", "onuses"},
    {"opera", "operas"},
    {"optimum", "optimums"},
    {"opus", "opuses"},
    {"organon", "organa"},
    {"ottoman", "ottomans"},
    {"ovum", "ova"},
    {"ox", "oxen"},
    {"oxman", "oxmen"},
    {"oxymoron", "oxymorons"},
    {"Panaman", "Panamans"},
    {"parabola", "parabolas"},
    {"Parmese", "Parmese"},
    {"pathos", "pathoses"},
    {"pegasus", "pegasuses"},
    {"Pekingese", "Pekingese"},
    {"pelvis", "pelvises"},
    {"pendulum", "pendulums"},
    {"penis", "penises"},
    {"penumbra", "penumbras"},
    {"perihelion", "perihelia"},
    {"person", "people"},
    {"persona", "personae"},
    {"petroleum", "petroleums"},
    {"phalanx", "phalanxes"},
    {"PhD", "PhDs"},
    {"phenomenon", "phenomena"},
    {"philtrum", "philtrums"},
    {"photo", "photos"},
    {"phylum", "phylums"},
    {"piano", "pianos"},
    {"Piedmontese", "Piedmontese"},
    {"pika", "pikas"},
    {"pincers", "pincers"},
    {"Pistoiese", "Pistoiese"},
    {"plateau", "plateaus"},
    {"play", "plays"},
    {"plexus", "plexuses"},
    {"pliers", "pliers"},
    {"polis", "polises"},
    {"Polonese", "Polonese"},
    {"pontifex", "pontifexes"},
    {"portmanteau", "portmanteaus"},
    {"Portuguese", "Portuguese"},
    {"possum", "possums"},
    {"potato", "potatoes"},
    {"pox", "pox"},
    {"pragma", "pragmas"},
    {"premium", "premiums"},
    {"prima donna", "prima donnas"},
    {"pro", "pros"},
    {"proceedings", "proceedings"},
    {"prolegomenon", "prolegomena"},
    {"proof", "proofs"},
    {"proof of concept", "proofs of concept"},
    {"prosecutrix", "prosecutrixes"},
    {"prospectus", "prospectuses"},
    {"protozoan", "protozoans"},
    {"protozoon", "protozoa"},
    {"puma", "pumas"},
    {"quantum", "quantums"},
    {"quarto", "quartos"},
    {"quiz", "quizzes"},
    {"quorum", "quorums"},
    {"rabies", "rabies"},
    {"radius", "radiuses"},
    {"radix", "radices"},
    {"ragman", "ragmen"},
    {"rebus", "rebuses"},
    {"reindeer", "reindeer"},
    {"repo    ", "repos"},
    {"rhino", "rhinos"},
    {"rhinoceros", "rhinoceroses"},
    {"Rom", "Roma"},
    {"Romagnese", "Romagnese"},
    {"Roman", "Romans"},
    {"Romanese", "Romanese"},
    {"Romany", "Romanies"},
    {"romeo", "romeos"},
    {"roof", "roofs"},
    {"rostrum", "rostrums"},
    {"ruckus", "ruckuses"},
    {"salmon", "salmon"},
    {"Sangirese", "Sangirese"},
    {"Sarawakese", "Sarawakese"},
    {"sarcoma", "sarcomas"},
    {"sassafras", "sassafrases"},
    {"scarf", "scarves"},
    {"schema", "schemas"},
    {"scissors", "scissors"},
    {"pair of scissors", "pairs of scissors"},
    {"pair of slippers", "pairs of slippers"},
    {"Scotsman", "Scotsmen"},
    {"sea-bass", "sea-bass"},
    {"seaman", "seamen"},
    {"self", "selves"},
    {"Selman", "Selmans"},
    {"Senegalese", "Senegalese"},
    {"seraph", "seraphs"},
    {"series", "series"},
    {"shaman", "shamans"},
    {"Shavese", "Shavese"},
    {"Shawanese", "Shawanese"},
    {"sheaf", "sheaves"},
    {"shears", "shears"},
    {"sheep", "sheep"},
    {"shelf", "shelves"},
    {"Siamese", "Siamese"},
    {"siemens", "siemens"},
    {"Sienese", "Sienese"},
    {"Sikkimese", "Sikkimese"},
    {"silex", "silices"},
    {"simplex", "simplexes"},
    {"Singhalese", "Singhalese"},
    {"Sinhalese", "Sinhalese"},
    {"sinus", "sinuses"},
    {"size", "sizes"},
    {"sizes", "size                           #VERB FORM"},
    {"slice", "slices"},
    {"smallpox", "smallpox"},
    {"Smith", "Smiths"},
    {"Sogdianese", "Sogdianese"},
    {"soliloquy", "soliloquies"},
    {"solo", "solos"},
    {"soma", "somas"},
    {"Sonaman", "Sonamans"},
    {"soprano", "sopranos"},
    {"species", "species"},
    {"spectrum", "spectrums"},
    {"speculum", "speculums"},
    {"spermatozoon", "spermatozoa"},
    {"sphinx", "sphinxes"},
    {"spokesperson", "spokespeople"},
    {"stadium", "stadiums"},
    {"stamen", "stamens"},
    {"status", "statuses"},
    {"stereo", "stereos"},
    {"stigma", "stigmas"},
    {"stimulus", "stimuli"},
    {"stoma", "stomas"},
    {"stomach", "stomachs"},
    {"storey", "storeys"},
    {"story", "stories"},
    {"stratum", "strata"},
    {"strife", "strifes"},
    {"stylo", "stylos"},
    {"stylus", "styluses"},
    {"succubus", "succubuses"},
    {"Sudanese", "Sudanese"},
    {"suffix", "suffixes"},
    {"Sundanese", "Sundanese"},
    {"superior", "superiors"},
    {"supply", "supplies"},
    {"surplus", "surpluses"},
    {"Swahilese", "Swahilese"},
    {"swine", "swines"},
    {"syrinx", "syrinxes"},
    {"tableau", "tableaus"},
    {"taco", "tacos"},
    {"Tacoman", "Tacomans"},
    {"talouse", "talouses"},
    {"tattoo", "tattoos"},
    {"taxman", "taxmen"},
    {"tempo", "tempos"},
    {"Tenggerese", "Tenggerese"},
    {"testatrix", "testatrixes"},
    {"testes", "testes"},
    {"thief", "thiefs"},
    {"Times", "Timeses"},
    {"Timorese", "Timorese"},
    {"Tirolese", "Tirolese"},
    {"titmouse", "titmice"},
    {"to it", "to them"},
    {"to itself", "to themselves"},
    {"to me", "to us"},
    {"to myself", "to ourselves"},
    {"to you", "to you"},
    {"to yourself", "to yourselves"},
    {"Tocharese", "Tocharese"},
    {"tomato", "tomatoes"},
    {"Tonkinese", "Tonkinese"},
    {"tonsillitis", "tonsillitises"},
    {"tooth", "teeth"},
    {"Torinese", "Torinese"},
    {"torus", "toruses"},
    {"trapezium", "trapeziums"},
    {"trauma", "traumas"},
    {"travois", "travois"},
    {"tranche", "tranches"},
    {"trellis", "trellises"},
    {"trilby", "trilbys"},
    {"trousers", "trousers"},
    {"trousseau", "trousseaus"},
    {"trout", "trout"},
    {"tuna", "tuna"},
    {"turf", "turfs"},
    {"Tyrolese", "Tyrolese"},
    {"ultimatum", "ultimatums"},
    {"umbilicus", "umbilicuses"},
    {"umbra", "umbras"},
    {"uterus", "uteruses"},
    {"vacuum", "vacuums"},
    {"vellum", "vellums"},
    {"velum", "velums"},
    {"Vermontese", "Vermontese"},
    {"Veronese", "Veronese"},
    {"vertebra", "vertebrae"},
    {"vertex", "vertexes"},
    {"Viennese", "Viennese"},
    {"Vietnamese", "Vietnamese"},
    {"virtuoso", "virtuosos"},
    {"virus", "viruses"},
    {"vita", "vitae"},
    {"vixen", "vixens"},
    {"vortex", "vortexes"},
    {"walrus", "walruses"},
    {"Wenchowese", "Wenchowese"},
    {"wharf", "wharves"},
    {"whiting", "whiting"},
    {"Whitmanese", "Whitmanese"},
    {"whiz", "whizzes"},
    {"widget", "widgets"},
    {"wife", "wives"},
    {"wildebeest", "wildebeests"},
    {"wish", "wishes"},
    {"wolf", "wolves"},
    {"woman", "women"},
    {"woman of substance", "women of substance"},
    {"woodlouse", "woodlice"},
    {"Yakiman", "Yakimans"},
    {"Yengeese", "Yengeese"},
    {"yeoman", "yeomen"},
    {"yeowoman", "yeowomen"},
    {"yes", "yeses"},
    {"Yokohaman", "Yokohamans"},
    {"you", "you"},
    {"yourself", "yourselves"},
    {"Yuman", "Yumans"},
    {"Yunnanese", "Yunnanese"},
    {"zero", "zeros"},
    {"zoon", "zoa"}
  ]

  test "match_style: false" do
    assert(equal?(Exflect.pluralize("zoo"), "zoos"))
    assert(equal?(Exflect.pluralize("CAT"), "cats"))
    assert(equal?(Exflect.singularize("leaves"), "leaf"))
    assert(equal?(Exflect.singularize("we"), "I"))
  end

  test "inflect" do
    assert(equal?(Exflect.inflect("man", 0), "men"))
    assert(equal?(Exflect.inflect("man", 1), "man"))
    assert(equal?(Exflect.inflect("man", 2), "men"))
  end

  test "match_style: true" do
    assert(Exflect.singularize("  Things  ", match_style: true) == "  Thing  ")
    assert(Exflect.singularize("\tthieves\t", match_style: true) == "\tthief\t")
    assert(Exflect.pluralize("BOY", match_style: true) == "BOYS")
    assert(Exflect.pluralize("thing   ", match_style: true) == "things   ")
  end

  @tag :benchmark
  test "benchmark" do
    %{
      exflect: fn ->
        Enum.each(@data, fn {sg, _} -> Exflect.pluralize(sg) end)
        Enum.each(@data, fn {_, pl} -> Exflect.singularize(pl) end)
      end,
      exflect_match_style: fn ->
        (Enum.map(@data, fn {sg, pl} -> Exflect.pluralize(sg, match_style: true) == pl end) ++
           Enum.map(@data, fn {sg, pl} -> Exflect.singularize(pl, match_style: true) == sg end))
        |> score()
      end,
      inflex: fn ->
        Enum.each(@data, fn {sg, _} -> Inflex.pluralize(sg) end)
        Enum.each(@data, fn {_, pl} -> Inflex.singularize(pl) end)
      end
    }
    |> Benchee.run(memory_time: 2, reduction_time: 2)
    |> IO.inspect()
  end

  test "compare accuracy" do
    %{
      exflect: fn ->
        (Enum.map(@data, fn {sg, pl} -> equal?(Exflect.pluralize(sg), pl) end) ++
           Enum.map(@data, fn {sg, pl} -> equal?(Exflect.singularize(pl), sg) end))
        |> score()
      end,
      inflex: fn ->
        (Enum.map(@data, fn {sg, pl} -> equal?(Inflex.pluralize(sg), pl) end) ++
           Enum.map(@data, fn {sg, pl} -> equal?(Inflex.singularize(pl), sg) end))
        |> score()
      end
    }
    |> Enum.map(fn {k, v} -> {k, v.()} end)
    |> IO.inspect()
  end

  defp equal?(text, text), do: true
  defp equal?(text, text2), do: String.downcase(text) == String.downcase(text2)

  defp score(list), do: Enum.count(list, & &1) / length(list)
end
