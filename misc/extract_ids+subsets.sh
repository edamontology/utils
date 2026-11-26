# Extracts owl:Class IDs and known (hardcoded) inSubset declarations.
#  Input: OWL file in RDF/XML.
#  Outputs: <subset>.tsv file for each hardcoded subset, with 2 columns:
#    * ID
#    * subset tag (present or missing)

file_path=$1

grep -E 'Class rdf:about|oboInOwl:inSubset rdf:resource="http://edamontology.org/bio' $file_path  \
    | sed -E 'N; s/.*about="(.+)".*\n.*inSubset rdf:resource="http:\/\/edamontology\.org\/(.+)".*/\1\t\2/g; P; D'  \
    | sed -E 's/.*about="(.+)".*/\1/g'  \
    > bio.tsv

grep -E 'Class rdf:about|oboInOwl:inSubset rdf:resource="http://edamontology.org/imaging' $file_path  \
    | sed -E 'N; s/.*about="(.+)".*\n.*inSubset rdf:resource="http:\/\/edamontology\.org\/(.+)".*/\1\t\2/g; P; D'  \
    | sed -E 's/.*about="(.+)".*/\1/g'  \
    > imaging.tsv

grep -E 'Class rdf:about|oboInOwl:inSubset rdf:resource="http://edamontology.org/data' $file_path  \
    | sed -E 'N; s/.*about="(.+)".*\n.*inSubset rdf:resource="http:\/\/edamontology\.org\/(.+)".*/\1\t\2/g; P; D'  \
    | sed -E 's/.*about="(.+)".*/\1/g'  \
    > data.tsv

grep -E 'Class rdf:about|oboInOwl:inSubset rdf:resource="http://edamontology.org/format' $file_path  \
    | sed -E 'N; s/.*about="(.+)".*\n.*inSubset rdf:resource="http:\/\/edamontology\.org\/(.+)".*/\1\t\2/g; P; D'  \
    | sed -E 's/.*about="(.+)".*/\1/g'  \
    > formats.tsv

grep -E 'Class rdf:about|oboInOwl:inSubset rdf:resource="http://edamontology.org/topic' $file_path  \
    | sed -E 'N; s/.*about="(.+)".*\n.*inSubset rdf:resource="http:\/\/edamontology\.org\/(.+)".*/\1\t\2/g; P; D'  \
    | sed -E 's/.*about="(.+)".*/\1/g'  \
    > topics.tsv

grep -E 'Class rdf:about|oboInOwl:inSubset rdf:resource="http://edamontology.org/operation' $file_path  \
    | sed -E 'N; s/.*about="(.+)".*\n.*inSubset rdf:resource="http:\/\/edamontology\.org\/(.+)".*/\1\t\2/g; P; D'  \
    | sed -E 's/.*about="(.+)".*/\1/g'  \
    > operations.tsv
