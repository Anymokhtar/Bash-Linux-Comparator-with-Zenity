#!/bin/bash
choix=$(zenity --entry --title="Les Comparaison" \
       --text="Veuillez indiquer le type de comparaison:" \
         --entry-text=Nombres Chaines Fichiers \
          --width=350 --height=200 )
          

if (("$?"== 1 ));
then
zenity --question --text="Sur vous voullez quitter" --width=400 --height=250

if(("$?" == 0));then
exit 0
else
choix=$(zenity --entry --title="Les Comparaison" \
       --text="Veuillez indiquer le type de comparaison:" \
         --entry-text=Nombres Chaines Fichiers \
          --width=350 --height=200 )
           while [ "$?" == 1 ] 
          do
          zenity --question --text="Sur vous voullez quitter" \
             --width=400 --height=250

     if(("$?" == 0));then 
      exit 0
     else
     choix=$(zenity --entry --title="Les Comparaison" \
       --text="Veuillez indiquer le type de comparaison:" \
         --entry-text=Nombres Chaines Fichiers \
          --width=350 --height=200 )
        fi
      done
    fi
          
          
          
fi
        
          
if [ $choix = "Nombres" ] ;
  then
 OUT=$(zenity --forms --title="Comparaison des $choix" \
      --text="Donnez deux $choix a comparer" \
       --add-entry="Nombre 1:" --add-entry="Nombre 2:" \
        --width=350 --height=200 )  
if (("$?"== 1 ));
 then
zenity --question --text="Sur vous voullez quitter" --width=400 --height=250

if(("$?" == 0));then
   exit 1
else
OUT=$(zenity --forms --title="Comparaison des $choix" \
      --text="Donnez deux $choix a comparer" \
       --add-entry="Nombre 1:" --add-entry="Nombre 2:" \
        --width=350 --height=200 )
        while [ "$?" == 1 ] 
          do
          zenity --question --text="Sur vous voullez quitter" \
             --width=400 --height=250

     if(("$?" == 0));then 
      exit 0
     else
      OUT=$(zenity --forms --title="Comparaison des $choix" \
      --text="Donnez deux $choix a comparer" \
       --add-entry="Nombre 1:" --add-entry="Nombre 2:" \
        --width=350 --height=200 )
        fi
      done
    fi
  fi
n1=$(awk -F\| '{print $1}' <<<$OUT)
n2=$(awk -F\| '{print $2}' <<<$OUT)


if test -z $n1  ||  test -z $n2
    then
  zenity --error --width=350 --height=200 ;
 else
 if [ $n1 -gt $n2 ];
 then
   zenity --info --title="Résultat de comparaison" \
     --text="$n1 est différent de $n2 \n\n $n1 > $n2"\
       --width=350  --height=200 ;              
        
elif [ $n2 -gt $n1 ];
 then
   zenity --info --title="Résultat de comparaison" \
     --text="$n1 est différent de $n2 \n\n $n2 > $n1" \
        --width=350 --height=200 ;
elif [ $n2 == $n1 ];
 then
   zenity --info --title="Résultat de comparaison" \
     --text="$n1 est identique a $n2"  --width=350 --height=200 ;      
           
fi
fi
fi

if [ $choix = "Chaines" ] ;
  then
 OUT=$(zenity --forms --title="Comparaison des $choix de caracteres" \
      --text="Donnez deux $choix a comparer" \
       --add-entry="Chaine 1:" --add-entry="Chaine 2:" \
        --width=450 --height=200 )  
         if (("$?"== 1 ));
 then
zenity --question --text="Sur vous voullez quitter" --width=400 --height=250

if(("$?" == 0));then
   exit 1
else
OUT=$(zenity --forms --title="Comparaison des $choix de caracteres" \
      --text="Donnez deux $choix a comparer" \
       --add-entry="Chaine 1:" --add-entry="Chaine 2:" \
        --width=450 --height=200 )  
        while [ "$?" == 1 ] 
          do
          zenity --question --text="Sur vous voullez quitter" \
             --width=400 --height=250

     if(("$?" == 0));then 
      exit 0
     else
      OUT=$(zenity --forms --title="Comparaison des $choix de caracteres" \
      --text="Donnez deux $choix a comparer" \
       --add-entry="Chaine 1:" --add-entry="Chaine 2:" \
        --width=450 --height=200 )  
        fi
      done
    fi
  fi
ch1=$(awk -F\| '{print $1}' <<<$OUT)
ch2=$(awk -F\| '{print $2}' <<<$OUT)


if test -z $ch1  ||  test -z $ch2
   then
  zenity --error --width=350 --height=200 ;
  else
  if [ $ch1 \> $ch2 ];
 then
   zenity --info --title="Résultat de comparaison" \
     --text=" '$ch1' est différent de '$ch2' \n\n '$ch1' > '$ch2' "\
       --width=350  --height=200 ;              
        
elif [ $ch2 \> $ch1 ];
 then
   zenity --info --title="Résultat de comparaison" \
     --text=" '$ch1' est différent de '$ch2' \n\n '$ch2' > '$ch1' " \
        --width=350 --height=200 ;
elif [ $ch2 == $ch1 ];
 then
   zenity --info --title="Résultat de comparaison" \
     --text="\n '$ch1' est identique a '$ch2' " \
         --width=350 --height=200 ;      
           
fi
fi
fi


if [ $choix = "Fichiers" ] ;
  then
 OUT=$(zenity --forms \
      --title="Comparaison des $choix de caracteres" \
      --text="Donnez deux $choix a comparer" \
       --add-entry="Fichier 1:" --add-entry="Fichier 2:" \
         --separator="|" --width=450 --height=200  )
 if (("$?"== 1 ));
 then
zenity --question --text="Sur vous voullez quitter" --width=400 --height=250

if(("$?" == 0));then
   exit 1
else
OUT=$(zenity --forms \
      --title="Comparaison des $choix de caracteres" \
      --text="Donnez deux $choix a comparer" \
       --add-entry="Fichier 1:" --add-entry="Fichier 2:" \
         --separator="|" --width=450 --height=200  )
        while [ "$?" == 1 ] 
          do
          zenity --question --text="Sur vous voullez quitter" \
             --width=400 --height=250

     if(("$?" == 0));then 
      exit 0
     else
      OUT=$(zenity --forms \
      --title="Comparaison des $choix de caracteres" \
      --text="Donnez deux $choix a comparer" \
       --add-entry="Fichier 1:" --add-entry="Fichier 2:" \
         --separator="|" --width=450 --height=200  )
        fi
      done
    fi
  fi        
           
fichier_1=$(zenity --file-selection --filename --title="Selectionner un Fichier")
fichier_2=$(zenity --file-selection --filename --title="Selectionner un Fichier")
if [ $?=0 ];
then        
fic1=$(echo "$fichier_1" | cut -d "|" -f1 )
fic2=$(echo "$fichier_2" | cut -d "|" -f2 )
contenu_1=$(cat $fic1 )
contenu_2=$(cat $fic2 )
fi
if test -z $fic1  ||  test -z $fic2
then
zenity --error --width=350 --height=200 ;
else
if test -s $fic1  &&  test -s $fic2
   then

      if [ $contenu_1 != $contenu_2 ];
     then
     zenity --info --title="Résultat de comparaison" \
     --text=" 'Fichier 1' et 'Fichier' non vide \n Les deux fichiers ne sont pas identiques  "  --width=350  --height=200 ;              
        
        else
       zenity --info --title="Résultat de comparaison" \
     --text=" 'Fichier 1' et 'Fichier' non vide \n Les deux fichiers sont   identiques  " --width=350 --height=200 ;
     fi
     else 
      zenity --info --title="Résultat de comparaison" \
       --text="veuillez remplir ces fichiers" --width=350 --height=200 ;
     
fi
fi
fi



