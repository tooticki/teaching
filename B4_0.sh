#!/bin/bash

# The list of extentions
exts=("txt" "pdf" "jpg" "sh" "png" "svg")
# The list of objects
objs=("clavier" "moniteur" "souris" "tapis_de_souris" "casque" "cactus" "chat" "barre_de_chocolat" "telephone" "ordi" "bd" "salamandre")
# The list of boxes
conts=("bouteille_de_coca" "verre" "boite" "pot" "tasse" "chope_a_biere" "sac_a_dos" "chaussette")

# Get the highest index of exts
N=$((${#exts[@]}))

# Delete mon_bureau if exists already
if [[ -d mon_bureau ]]; then
    echo "Removing the existing mon_bureau..."
    rm -rf mon_bureau
fi

for ext in txt pdf sh; do 
    mkdir -p "mon_bureau/$ext-TIROIR"
done

cd mon_bureau

# Creating objects
for obj in ${objs[*]}; do 
    n=$((1+$RANDOM % 3))
    for j in $(seq 1 $n); do
	r=$(($RANDOM % $N))
	ext="${exts[$r]}"
	touch "$obj-$j.$ext"
    done
done

# Creating boxes
for cont in ${conts[*]}; do
    m=$((1+$RANDOM % 3))
    for j in $(seq 1 $m); do
	dirname="$cont-$j"
	mkdir $dirname
	n=$((1+$RANDOM % 3))
	# Filling boxes with objects
	for j in $(seq 1 $n); do
	    r1=$(($RANDOM % $N))
	    r2=$(($RANDOM % $N))
	    ext="${exts[$r1]}"
	    obj="${objs[$r2]}"
	    touch "$dirname/$obj($dirname).$ext"
	done
    done
done 

echo "New mon_bureau created!"
