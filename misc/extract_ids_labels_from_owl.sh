# Extract IDs and labels and ids from owl files.
#  input: owlfile
#  output: tsv file with columns: ID label
file_path=$1
grep -E 'Class rdf:about|<rdfs:label>' $file_path  \
    | sed -E 'N; s/.*about="(.+)".*\n.*label>(.*)<.*/\1\t\2/g; P; D' \
    | sed -e '/rdfs:label/d' 
