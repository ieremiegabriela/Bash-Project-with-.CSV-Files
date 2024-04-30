#!/bin/bash

raspuns=999
numar='^[0-3]{1}$'
text='^[a-zA-Z]+(.csv){1}$'

while [ $raspuns -ne 0 ]
do
    clear 
    echo -e "\e[1;36mAlege una dintre optiunile urmatoare:\e[0m\n"
    echo -e "\e[1;32m1. \e[1;36mCreeaza un fisier CSV nou\e[0m\n"
    echo -e "\e[1;32m2. \e[1;36mAfiseaza un fisier CSV existent\e[0m\n"
    echo -e "\e[1;32m3. \e[1;36mModifica un fisier CSV existent\e[0m\n"
    echo -e "\e[1;32m0. \e[1;36mExit\e[0m\n"
    echo -e "\e[1;36mAlege o optiune folosind \e[1;32mnumarul\e[1;36m acesteia:\e[0m"
    read input

    if [[ $input =~ $numar ]] 
    then
        raspuns=$input
        case $raspuns in
            1)
                echo -e "\e[1;36mPentru a creea un fisier nou, introduceti numele acestuia, urmat de extensia '.csv':\e[0m"
                read nume

                if [[ $nume =~ $text ]]; then
                    echo -e "\e[1;36mSe creeaza fisierul cu numele: \e[1;35m$nume\e[0m"
                    ./creeaza.sh $nume
                else
                    echo -e "\e[1;31mintroduceti un nume care contine doar text, urmat de extensia .csv!\e[0m"
                fi

                sleep 3
                ;;
            2)
                echo -e "\e[1;36mPentru a afisa un fisier existent, introduceti numele acestuia, urmat de extensia '.csv':\e[0m"
                read nume

                if [[ $nume =~ $text ]]; then
                    echo -e "\e[1;36mSe afiseaza fisierul cu numele: \e[1;35m$nume\e[0m"
                    ./afiseaza.sh $nume
                else
                    echo -e "\e[1;31mintroduceti un nume care contine doar text, urmat de extensia .csv!\e[0m"
                fi

                sleep 3
                ;;
            3)
                echo -e "\e[1;36mPentru a modifica un fisier existent, introduceti numele acestuia, urmat de extensia '.csv':\e[0m"
                read nume

                if [[ $nume =~ $text ]]; then
                    echo -e "\e[1;36mSe modifica fisierul cu numele: \e[1;35m$nume\e[0m"
                    ./modifica.sh $nume
                else
                    echo -e "\e[1;31mintroduceti un nume care contine doar text, urmat de extensia .csv!\e[0m"
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

