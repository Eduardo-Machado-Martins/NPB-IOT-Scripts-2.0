prog=("EP" "MG" "CG" "FT" "IS" "BT" "SP" "LU")
export f1=4
f3=8
cont=0
vet=()

for ((i=0; i<$f3; i++));do
    for ((j=1; j<=$f1; j++));do
        grep "Time in seconds =" $HOME/Desktop/T2-Pratica-C/Logs-FOR-C-RSPI4/out-"${prog[$i]}"-"$j".txt | awk '{print $5}' >> $HOME/Desktop/T2-Pratica-C/Logs-FOR-C-RSPI4/time-"${prog[$i]}"-"$j".txt
        while read linha;do
            vet[$cont]=$linha
            cont=$(($cont+1))
        done < $HOME/Desktop/T2-Pratica-C/Logs-FOR-C-RSPI4/time-"${prog[$i]}"-"$j".txt
        cont=0
        rm $HOME/Desktop/T2-Pratica-C/Logs-FOR-C-RSPI4/time-"${prog[$i]}"-"$j".txt
        python3 PRINT.py ${vet[@]} $j >> $HOME/Desktop/T2-Pratica-C/zFOR-"${prog[$i]}".txt

        grep "Time in seconds =" $HOME/Desktop/T2-Pratica-C/Logs-CPP-C-RSPI4/out-"${prog[$i]}"-"$j".txt | awk '{print $5}' >> $HOME/Desktop/T2-Pratica-C/Logs-CPP-C-RSPI4/time-"${prog[$i]}"-"$j".txt
        while read linha;do
            vet[$cont]=$linha
            cont=$(($cont+1))
        done < $HOME/Desktop/T2-Pratica-C/Logs-CPP-C-RSPI4/time-"${prog[$i]}"-"$j".txt
        cont=0
        rm $HOME/Desktop/T2-Pratica-C/Logs-CPP-C-RSPI4/time-"${prog[$i]}"-"$j".txt
        python3 PRINT.py ${vet[@]} $j >> $HOME/Desktop/T2-Pratica-C/zCPP-"${prog[$i]}".txt
    done
done