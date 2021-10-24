#!/usr/bin/env bash
#
# author: oct 2021
# cassio batista - https://cassota.gitlab.io

[ $# -ne 3 ] && exit 1
echo "$0 $@"

fin=$1
flog=$2
fout=$3

jar() {
  LIB_PATH=$HOME/fb-gitlab/fb-nlp/nlp-generator
  gunzip -k $data/$fin
  java -jar $LIB_PATH/fb_nlplib.jar -g -t $(nproc) \
    -i $data/${fin%.gz} -o $data/lexicon.txt 2> $data/log/g2p.log
  rm -f $data/${fin%.gz}
  gzip $data/log/g2p.log
}

gunzip -kc $fin | awk '{print $1}' | LC_ALL=C sort -u | \
  docker run --rm -i falabrasil/g2p 2> $flog | \
  local/parse_abbrev.py 2> ${flog%.log}.abbrev.log | \
  gzip -c > $fout || exit 1
gzip -f $flog
