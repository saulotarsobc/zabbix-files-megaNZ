#! /bin/bash
alert(){
    echo -e "Tente: ./meganz DIRETORIO_NO_MEGA EMAIL_DO_MEGA SENHA_DO_MEGA";
    exit 0;
}
if [ "$1" = "" ]; then alert; fi;

dir=$1; u=$2; p=$3;

reload=$(megals -u $u -p $p --reload ); # recarregar o cache do sistema de arquivos

size=($(megals -u $u -p $p /Root/$dir -l |sed 's/.*\s\s\s//' |sed 's/\s.*//'));
nome=($(megals -u $u -p $p  /Root/$dir -l |sed 's/.*\///'));

ID=0;
echo "id|nome|size";
for i in "${size[@]}"; do
    echo "$ID|${nome[$ID]}|${size[$ID]}";
    let ID=ID+1;
done;