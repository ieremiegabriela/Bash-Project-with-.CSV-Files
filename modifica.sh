#!/bin/bash


numeFisier="$1"
raspuns=999
numar='^[0-3]+$'
text='^[a-zA-Z]+$'
mail='^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'

while [ $raspuns -ne 0 ]
do
    clear
    cat $numeFisier
    echo -e "\e[1;36mAlege una dintre optiunile urmatoare pentru fisierul: \e[0m\e[1;35m$numeFisier\e[0m"
    echo -e "\e[1;32m1. \e[1;36mAdauga randuri noi la sfarsit\e[0m\n"
    echo -e "\e[1;32m2. \e[1;36mModifica un element dupa ID\e[0m\n"
    echo -e "\e[1;32m3. \e[1;36mSterge un element dupa ID\e[0m\n"
    echo -e "\e[1;32m0. \e[1;36mExit\e[0m\n"
    echo -e "\e[1;36mAlege o optiune folosind \e[1;32mnumarul\e[1;36m acesteia:\e[0m"
    read input

    if [[ $input =~ $numar ]] 
    then
        raspuns=$input
        case $raspuns in
            1)

            	if [ -s "$numeFisier" ]
		then
			ultimaLinie=$(tail -n 1 "$numeFisier")
			ultimulID=$(echo "$ultimaLinie" | cut -d ',' -f 1)
			id=$((ultimulID + 1))
		fi
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
					break 3
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
					break 3
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
			    break 3
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
				break 3
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
		;;
            2)
                echo -e "\e[1;36mAceasta optiune va modifica datele pentru elementul cu ID-ul dat, fara a modifica ID-ul!\nIntroduceti ID-ul pentru care doriti sa modificati datele:\e[0m"
                read id
                linie=$(grep "^$id," "$numeFisier")
		if [ -n "$linie" ]; then
		    echo -e "\e[1;36mSe modifica linia:\e[0m\n"
		    echo "$linie"
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
				new_nume=$nume
				new_prenume=$prenume
				new_nota=$nota
				new_email=$email

				sed -i "s/^\($id,[^,]*,\)[^,]*/\1$new_nume/" "$numeFisier"
				sed -i "s/^\($id,[^,]*,\)[^,]*/\1$new_prenume/" "$numeFisier"
				sed -i "s/^\($id,[^,]*,[^,]*,\)[^,]*/\1$new_nota/" "$numeFisier"
				sed -i "s/^\($id,[^,]*,[^,]*,[^,]*,\)[^,]*/\1$new_email/" "$numeFisier"
				echo -e "\e[1;32mAti modificat elementul cu succes!\e[0m"
				break
			else
				echo -e "\e[1;31mIntroduceti un e-mail de forma text@domeniu.*!\e[0m"
				continue
			fi
		    done
		else
		    echo -e "\e[1;31mNu exista elementul cu ID-ul $id! \e[0m"
		fi
                sleep 3
                ;;
            3)
                echo -e "\e[1;36mAceasta optiune va sterge linia cu ID-ul dat, fara a re-organiza ID-urile!\nIntroduceti ID-ul pentru care doriti stergeti linia:\e[0m"
                read id
		linie=$(grep "^$id," "$numeFisier")
		if [ -n "$linie" ]; then
		    echo -e "\e[1;31mSe va sterge linia:\e[0m\n"
		    echo "$linie"
		    sed -i "/^$id,/d" "$numeFisier"
		    echo -e "\e[1;32mAti sters elementul cu succes!\e[0m"
		else
		    echo -e "\e[1;31mNu exista elementul cu ID-ul $id! \e[0m"
		fi

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

