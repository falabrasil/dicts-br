#!/usr/bin/env bash
#
# author: oct 2021
# cassio batista - https://cassota.gitlab.io

set -e

data=./data

# check dependencies
ok=true
for pack in python3 gzip time ; do
  ! type -f $pack > /dev/null 2>&1 && \
    echo "$0: error: please install $pack" && ok=false
done
python3 -c "import unidecode" 2>/dev/null || { ok=false && \
  echo "$0: error: please install python module unidecode" ; }
$ok || exit 1

mkdir -p $data/log

for fin in count.txt.gz vocab.txt.gz ; do
  suff=${fin%.txt.gz}

  # phonemes
  echo "$0: generating phonetic dictionary (lexicon)"
  /usr/bin/time -f "Time: %E (%U secs). RAM: %M KB" local/g2p.sh \
    $data/$fin $data/log/g2p-$suff.log $data/lexicon.$suff.txt.gz || exit 1

  # syllables
  echo "$0: generating syllabic dictionary"
  /usr/bin/time -f "Time: %E (%U secs). RAM: %M KB" local/syl.sh \
    $data/$fin $data/log/syl-$suff.log $data/syllables.$suff.txt.gz || exit 1

  # vowel stress
  echo "$0: generating vowel stressing dictionary "
  /usr/bin/time -f "Time: %E (%U secs). RAM: %M KB" local/stress.sh \
    $data/$fin $data/log/stress-$suff.log $data/stress.$suff.txt.gz || exit 1
done

echo "$0: success! check out '$data' dir"
