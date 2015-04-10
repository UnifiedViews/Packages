#!/bin/bash

URL="http://127.0.0.1:18080/master/api/1/import/dpu/jar"
MASTER_USER=user
MASTER_PASS=pass

echo "---------------------------------------------------------------------"
echo "Installing DPUs.."
echo "..target instance: $URL"
echo "---------------------------------------------------------------------"

function install_dpu() {
    dpu_file=$(ls $1)

    echo -n "..installing $dpu_file: "
    outputfile="/tmp/$dpu_file.out"

    # fire cURL and wait until it finishes
    curl --user $MASTER_USER:$MASTER_PASS --fail --silent --output $outputfile -X POST -H "Cache-Control: no-cache" -H "Content-Type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW" -F file=@$dpu_file $URL?name=$2&force=true &>/dev/null
    wait $!

    # check if the installation went well
    outcontents=`cat $outputfile`
    echo $outcontents
}

################################################################################
#           filename of DPU JAR                user-friendly name (urlencoded) #
################################################################################
install_dpu "uv-t-xslt-*.jar"                  "XSLT+transform%C3%A1cia"
install_dpu "uv-t-ocr-*.jar"                   "konverzia+do+textu+%28OCR%29"
install_dpu "uv-t-sparql-*.jar"                "RDF+SPARQL"
install_dpu "uv-t-relational-*.jar"            "SQL+transform%C3%A1cia"
install_dpu "uv-t-rdfMerger-*.jar"             "RDF+merger"
install_dpu "uv-t-filesMerger-*.jar"           "spojenie+%28rdf%29"
install_dpu "uv-l-relationalToCkan-*.jar"      "rela%C4%8Dn%C3%A9+d%C3%A1ta+do+katal%C3%B3gu"
install_dpu "uv-l-relationaldiffToCkan-*.jar"  "rozdielov%C3%A1+anal%C3%BDza"
install_dpu "uv-l-rdfToCkan-*.jar"             "RDF+z%C3%A1znam+do+katal%C3%B3gu"
install_dpu "uv-l-filesUpload-*.jar"           "ulo%C5%BEenie+s%C3%BAborov"
install_dpu "uv-e-filesDownload-*.jar"         "stiahnutie+s%C3%BAborov"
install_dpu "uv-l-filesToCkan-*.jar"           "files+to+CKAN"
install_dpu "uv-e-relationalFromSql-*.jar"     "d%C3%A1ta+z+datab%C3%A1zy"
install_dpu "uv-l-filesToVirtuoso-*.jar"       "RDF+d%C3%A1ta+do+Virtuoso"
install_dpu "uv-l-relationalToSql-*.jar"       "do+datab%C3%A1zy"
install_dpu "uv-t-filesFilter-*.jar"           "filter+s%C3%BAborov"
install_dpu "uv-t-filesRenamer-*.jar"          "premenovanie+s%C3%BAborov"
install_dpu "uv-t-filesToRdf-*.jar"            "na%C4%8D%C3%ADtanie+RDF+zo+s%C3%BAboru"
install_dpu "uv-t-rdfToFiles-*.jar"            "ulo%C5%BEenie+RDF+do+s%C3%BAboru"
install_dpu "uv-t-tabularToRelational-*.jar"   "tabular+to+relational"
install_dpu "uv-t-unzipper-*.jar"              "rozbalenie+s%C3%BAborov"
install_dpu "uv-t-zipper-*.jar"                "zbalenie+s%C3%BAborov"
install_dpu "uv-e-rdfFromSparql-*.jar"         "rdf+from+SPARQL"
