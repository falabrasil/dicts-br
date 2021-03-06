# Dictionaries :brazil:

:fox_face: Resources stored on GitLab (LFS): 
https://gitlab.com/fb-resources/dicts-br

Phonetic, syllabic and stress vowel dicionaries generated by
[FalaBrasil's tagger tool :fox_face:](https://gitlab.com/fb-nlp/nlp-generator).
The scripts under this repo, however, use their 
[dockerized version :whale:](https://hub.docker.com/u/falabrasil).

The word list contains ~2.4 million unfiltered words estimated from 4 portions
of the [OSCAR CORPUS v2019](https://oscar-corpus.com/)'s Portuguese version.
A slim, filtered version with the top-250k most frequent words is also
available.

## Usage

```bash
$ ./run.sh
```

<summary>
<details>Output should be as follows:

<p>

```text
run.sh: generating phonetic dictionary (lexicon)
local/g2p.sh ./data/count.txt.gz ./data/log/g2p-count.log ./data/lexicon.count.txt.gz
Time: 29:06.35 (20.37 secs). RAM: 578948 KB
run.sh: generating syllabic dictionary
local/syl.sh ./data/count.txt.gz ./data/log/syl-count.log ./data/syllables.count.txt.gz
Time: 0:24.04 (7.81 secs). RAM: 48784 KB
run.sh: generating vowel stressing dictionary 
local/stress.sh ./data/count.txt.gz ./data/log/stress-count.log ./data/stress.count.txt.gz
Time: 0:20.40 (7.01 secs). RAM: 48808 KB
run.sh: generating phonetic dictionary (lexicon)
local/g2p.sh ./data/vocab.txt.gz ./data/log/g2p-vocab.log ./data/lexicon.vocab.txt.gz
Time: 3:14.06 (1.45 secs). RAM: 71708 KB
run.sh: generating syllabic dictionary
local/syl.sh ./data/vocab.txt.gz ./data/log/syl-vocab.log ./data/syllables.vocab.txt.gz
Time: 0:04.81 (0.83 secs). RAM: 49044 KB
run.sh: generating vowel stressing dictionary 
local/stress.sh ./data/vocab.txt.gz ./data/log/stress-vocab.log ./data/stress.vocab.txt.gz
Time: 0:02.82 (0.60 secs). RAM: 48532 KB
run.sh: success! check out './data' dir
```

</p>

</details>
</summary>


## License

MIT


## Citation

TBD (Eurasip 2022?)


[![FalaBrasil](https://gitlab.com/falabrasil/avatars/-/raw/main/logo_fb_git_footer.png)](https://ufpafalabrasil.gitlab.io/ "Visite o site do Grupo FalaBrasil") [![UFPA](https://gitlab.com/falabrasil/avatars/-/raw/main/logo_ufpa_git_footer.png)](https://portal.ufpa.br/ "Visite o site da UFPA")

__Grupo FalaBrasil (2021)__ - https://ufpafalabrasil.gitlab.io/    
__Universidade Federal do Par?? (UFPA)__ - https://portal.ufpa.br/     
Cassio Batista - https://cassota.gitlab.io/
