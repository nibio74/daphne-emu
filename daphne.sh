#!/bin/bash
#In this 'array' section the alternative versions to the original rom are listed: ace, lair, lair2, cliff, badlands, astron, bega, cobra, galaxy, sdq, tq
ace_array=('aceeuro' 'ace91' 'ace91_euro' 'ace_a' 'ace_a2' 'sae')
lair_array=('dle11' 'dle21' 'lair_a' 'lair_b' 'lair_c' 'lair_d' 'lair_e' 'lair_f' 'lair_x' 'lair_n1' 'laireuro' 'lair_d2' 'lair_ita' )
lair2_array=('lair2_211' 'lair2_300' 'lair2_314' 'lair2_315' 'lair2_316_euro' 'lair2_318' 'lair2_319_euro' 'lair2_319_span')
cliff_array=('cliffalt' 'cliffalt2') 
badlands_array=('badlandp')
astron_array=('astronp')
bega_array=('begar1')
cobra_array=('cobraab' 'cobraconv' 'cobram3')
esh_array=('eshalt' 'eshalt2')
galaxy_array=('galaxyp' 'blazer')
sdq_array=('sdqhort' 'sdqshortalt')
tq_array=('tq_alt' 'tq_swear')
dir="$1"
name="${dir##*/}"
name="${name%.*}"
name_clone=$name

#This condition allows you to add your own .commands file for every single rom (even in alternative versions)
if [[ -f "$dir/$name.commands" ]]; then
  params=$(<"$dir/$name.commands")
fi

#These conditions allow alternative rom to be launched from the same directory where the original rom are located without having to duplicate .m2v and .ogg files
if [[ " ${ace_array[*]} " == *"$name"* ]]; then
  name="ace"
  dir="/home/pi/RetroPie/roms/daphne/ace.daphne"
elif [[ " ${lair_array[*]} " == *"$name"* ]]; then
  name="lair"
  dir="/home/pi/RetroPie/roms/daphne/lair.daphne"
elif [[ " ${lair2_array[*]} " == *"$name"* ]]; then
  name="lair2"
  dir="/home/pi/RetroPie/roms/daphne/lair2.daphne"
elif [[ " ${sdq_array[*]} " == *"$name"* ]]; then
  name="sdq"
  dir="/home/pi/RetroPie/roms/daphne/sdq.daphne"
elif [[ " ${cliff_array[*]} " == *"$name"* ]]; then
  name="cliff"
  dir="/home/pi/RetroPie/roms/daphne/cliff.daphne"
elif [[ " ${badlands_array[*]} " == *"$name"* ]]; then
  name="badlands"
  dir="/home/pi/RetroPie/roms/daphne/badlands.daphne"
elif [[ " ${astron_array[*]} " == *"$name"* ]]; then
  name="astron"
  dir="/home/pi/RetroPie/roms/daphne/astron.daphne"
elif [[ " ${bega_array[*]} " == *"$name"* ]]; then
  name="bega"
  dir="/home/pi/RetroPie/roms/daphne/bega.daphne"
elif [[ " ${cobra_array[*]} " == *"$name"* ]]; then
  name="cobra"
  dir="/home/pi/RetroPie/roms/daphne/cobra.daphne"
elif [[ " ${esh_array[*]} " == *"$name"* ]]; then
  name="esh"
  dir="/home/pi/RetroPie/roms/daphne/esh.daphne"
elif [[ " ${tq_array[*]} " == *"$name"* ]]; then
  name="tq"
  dir="/home/pi/RetroPie/roms/daphne/tq.daphne"
elif [[ " ${galaxy_array[*]} " == *"$name"* ]]; then
  name="galaxy"
  dir="/home/pi/RetroPie/roms/daphne/galaxy.daphne"
fi

#Launch of the daphne.bin application and related parameters
"/opt/retropie/emulators/daphne/daphne.bin" "$name_clone" vldp -nohwaccel -framefile "$dir/$name.txt" -homedir "/opt/retropie/emulators/daphne" -fullscreen $params

 
