#!/bin/bash

numeFisier="$1"

numar='^[1-3]+$'
text='^[a-zA-Z]+$'
mail='^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'

echo "ID,Nume,Prenume,NotaSO,E-Mail" > "$numeFisier"
echo -e "\e[1;32mAti creat fisierul cu succes!\e[0m"

id=1

while true
do
    echo -e "\e[1;36mIntroducere date pentru elementul cu ID: \e[0m\e[1;35m$id\e[0m"
    while true
    do
    	echo -e "\e[1;36mIntroduceti numele, sau 'meniu' pentru a reveni la meniul principal:\e[0m"
    	read nume
    	if [[ $nume =~ $text ]]
    	then
    		if [ "$nume" = "meniu" ]
    		then
        		break 2
    		fi
    		break
 	else
 		echo -e "\e[1;31mIntroduceti un nume care contine doar text!\e[0m"
 		continue
	fi
    done
    
    while true
    do
    	echo -e "\e[1;36mIntroduceti prenumele, sau 'meniu' pentru a reveni la meniul principal:\e[0m"
    	read prenume
    	if [[ $prenume =~ $text ]]
    	then
    		if [ "$prenume" = "meniu" ]
    		then
        		break 2
    		fi
    		break
 	else
 		echo -e "\e[1;31mIntroduceti un prenume care contine doar text!\e[0m"
 		continue
	fi
    done

    while true
    do
    	echo -e "\e[1;36mIntroduceti nota, in intervalul 1-10, sau 'meniu' pentru a reveni la meniul principal:\e[0m"
        read nota
        if [ "$nota" = "meniu" ]
        then
            break 2
        fi

        if [[ "$nota" =~ ^[1-9]$|^10$ ]]
        then
            break
        else
            echo -e "\e[1;31mIntroduceti doar numere intre 1-10!\e[0m"
            continue
        fi
    done

    while true
    do
    	echo -e "\e[1;36mIntroduceti adresa de e-mail, sau 'meniu' pentru a reveni la meniul principal:\e[0m"
	read email
	if [ "$email" = "meniu" ]
	then
		break 2
	fi

	if [[ $email =~ $mail ]]
	then
		exista=$(grep "$email" "$numeFisier")
		if [ -n "$exista" ]
		then
			echo -e "\e[1;31mAcest e-mail exista deja! Probabil ca studentul deja exista in fisier! Daca vrei sa modifici datele studentului, modifica dupa ID!\e[0m"
			sleep 5
			break 2
		fi
		echo "$id,$nume,$prenume,$nota,$email" >> "$numeFisier"
		echo -e "\e[1;32mAti adaugat elementul cu succes!\e[0m"
		id=$((id + 1))
		break
	else
		echo -e "\e[1;31mIntroduceti un e-mail de forma text@domeniu.*!\e[0m"
		continue
	fi
    done
    
done

echo -e "\e[1;36mRevenire la meniul principal...\e[0m"

