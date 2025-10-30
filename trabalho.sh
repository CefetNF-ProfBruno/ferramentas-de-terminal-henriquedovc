#!/bin/bash


rm -f *.txt
touch 1a.txt 1b.txt 1c.txt 1d.txt 1e.txt 1f.txt 1g.txt 1h.txt

grep -oE '[01]*' bruxarias.dat > 1a.txt

grep -oE '\b1[01]{0,7}\b' bruxarias.dat > 1b.txt

grep -E '^1[01]{7}$' bruxarias.dat > 1c.txt

grep -oP '\b(0|[1-9][0-9]*)\b' bruxarias.dat > 1d.txt

grep -oE '[ue]tt' bruxarias.dat > 1e.txt

grep -oP '\b[A-Z]?[a-z]{2,}\b' bruxarias.dat > 1f.txt

grep -oP '\b[A-Za-z][A-Za-z0-9_]*\b' bruxarias.dat > 1g.txt

OCTETO='(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})' 
grep -oP "\b$OCTETO\.$OCTETO\.$OCTETO\.$OCTETO\b" bruxarias.dat > 1h.txt

find /etc -type d 2>/dev/null > 2a.txt
find /etc -maxdepth 1 -type d 2>/dev/null > 2b.txt
find /etc -type f -size +1k 2>/dev/null > 2c.txt
find /var -mtime -7 2>/dev/null > 2d.txt


awk -F: '{print $1}' /etc/passwd 2>/dev/null > 3a.txt
awk -F: 'NR >= 10 && NR <= 20 {print $1}' /etc/passwd 2>/dev/null > 3b.txt

export SED_TMPDIR=/tmp

ARQUIVO_SENHA=/etc/passwd

USUARIO_ALVO="henrique" 

cd /etc/passwd
(sed -i "s/^$USUARIO_ALVO:/exercicio:/" $ARQUIVO_SENHA)
cp $ARQUIVO_SENHA 4a.txt


cd /etc/passwd
(sed -i "/^exercicio:/d" $ARQUIVO_SENHA)
cp $ARQUIVO_SENHA 4b.txt
