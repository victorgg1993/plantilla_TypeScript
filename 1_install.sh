# Notes:
# --save-dev  = guardes el paquet en modo desarrollo ( quan encara no està llest ).

# --save = guardes el paquet en modo release ( ja està llest per a entregar.
#          Empaqueta totes les dependències en un sol paquet,
#          i podries fer el npm install _nom_del_teu_paquet )



npm install npm-add-script
npm install ts-node  --save-dev # Instal·lem el ts-node en la carpeta local ( afegeix -g per a global ).
npm install typescript --save-dev # Instal·lem el parser de typescript en local.
npm init -y  # Creem una aplicació amb npm. Ens generarà el package.json.


#------------------------------------------------------------<aquest codi afegeix scripts en el package.json>
input="./package.json"
sortida=""

while IFS= read -r line
do
    if [[ $line == *"\"scripts\":"* ]]; then
        
        sortida+="$line"
        sortida+=$'\n\r'

         #nou script que volem
        sortida+=$' "script_magic_que_crida_al_typescript": "node -r ./node_modules/ts-node/register ./principal.ts", '
        sortida+=$'\n\r'

    else
        sortida+="$line"
        sortida+=$'\n\r'
    fi

done < "$input"

echo $sortida > $input
#------------------------------------------------------------</aquest codi afegeix scripts en el package.json>

