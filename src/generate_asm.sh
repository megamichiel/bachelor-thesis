for filename in *.c; do
  gcc -o asm/$filename.s -S -g -fverbose-asm -I../include -I./ $filename
done

