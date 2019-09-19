for i in $(ls 00*.sh); do 
    echo "running $i"; bash $i
done

