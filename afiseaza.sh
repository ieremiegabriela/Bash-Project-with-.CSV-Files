#!/bin/bash


numeFisier="$1"
raspuns=999
numar='^[0-3]{1}$'
while [ $raspuns -ne 0 ]
do
    clear
    echo -e "\e[1;36mAlege una dintre optiunile urmatoare pentru fisierul: \e[0m\e[1;35m$numeFisier\e[0m"
    echo -e "\e[1;32m1. \e[1;36mAfiseaza intregul fisier\e[0m\n"
    echo -e "\e[1;32m2. \e[1;36mAfiseaza fisierul sortat in ordine alfabetica\e[0m\n"
    echo -e "\e[1;32m3. \e[1;36mAfiseaza primii 10 studenti, in ordinea notelor\e[0m\n"
    echo -e "\e[1;32m0. \e[1;36mMeniul principal\e[0m\n"
    echo -e "\e[1;36mAlege o optiune folosind \e[1;32mnumarul\e[1;36m acesteia:\e[0m"
    read input

    if [[ $input =~ $numar ]] 
    then
        raspuns=$input
        case $raspuns in
            1)
            	cat $numeFisier
                echo -e "\e[1;36mApasati enter pentru a reveni la meniul de afisare:\e[0m"
                read input
		echo -e "\e[1;36mRevenire la meniu...\e[0m"
                sleep 3
                ;;
            2)
            	coloana=2
            	header=$(head -n 1 "$numeFisier")
            	date=$(tail -n +2 "$numeFisier")
            	sortat=$(echo "$date" | sort -t ',' -k $coloana)
            	echo -e "\e[1;35m$header\e[0m"
            	echo "$sortat"
                echo -e "\e[1;36mApasati enter pentru a reveni la meniul de afisare:\e[0m"
                read input
		echo -e "\e[1;36mRevenire la meniu...\e[0m"
                sleep 3
                ;;
            3)
                coloana=4
                limita=10
            	header=$(head -n 1 "$numeFisier")
            	date=$(tail -n +2 "$numeFisier")
            	sortat=$(echo "$date" | sort -t ',' -k $coloana -r)
            	echo -e "\e[1;35m$header\e[0m"
            	echo "$sortat" | head -n $limita
                echo -e "\e[1;36mApasati enter pentru a reveni la meniul de afisare:\e[0m"
                read input
		echo -e "\e[1;36mRevenire la meniu...\e[0m"
                sleep 3
                ;;
            0)
                echo -e "\e[1;36mIesire...\e[0m\n"
                sleep 3
                break
                ;;
            *)
                echo -e "\e[1;31mintroduceti un numar intreg intre 0-3!\e[0m"
                sleep 3
                ;;
        esac
    else
        echo -e "\e[1;31mintroduceti un numar intreg intre 0-3!\e[0m"
        sleep 3
    fi
done
