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
  java -jar $LIB_PATH/fb_nlplib.jar -s -t $(nproc) \
    -i $data/${fin%.gz} -o $data/syllables.txt 2> $data/log/syl.log
  rm -f $data/${fin%.gz}
  gzip $data/log/syl.log
}

gunzip -kc $fin | awk '{print $1}' | LC_ALL=C sort -u | \
  docker run --rm -i falabrasil/syl 2> $flog | \
  gzip -c > $fout || exit 1
gzip -f $flog
