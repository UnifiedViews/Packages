#!/bin/bash

URL="http://127.0.0.1:28080/master/api/1/import/dpu/jar"
MASTER_USER=master
MASTER_PASS=commander

echo "---------------------------------------------------------------------"
echo "Installing DPUs.."
echo "..target instance: $URL"
echo "---------------------------------------------------------------------"

install_dpu() {

install_dpu() {
    dpu_path=/usr/share/unifiedviews/dist/plugins/
    dpu_file=$(ls $1)

    echo -n "..installing $dpu_file: "
    outputfile="/tmp/$dpu_file.out"

    # fire cURL and wait until it finishes
    curl --user $MASTER_USER:$MASTER_PASS --fail --silent --output $outputfile -X POST -H "Cache-Control: no-cache" -H "Content-Type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW" -F file=@$dpu_path$dpu_file $URL?force=true 
    wait $!

    # check if the installation went well
    outcontents=`cat $outputfile`
    echo $outcontents
}

install_dpu "uv-e-filesDownload-*.jar”
install_dpu "uv-e-relationalFromSql-*.jar”
install_dpu "uv-l-filesToVirtuoso-*.jar”
install_dpu "uv-l-filesUpload-*.jar”
install_dpu "uv-l-relationalToSql-*.jar”
install_dpu "uv-t-filesFilter-*.jar”
install_dpu "uv-t-filesMerger-*.jar”
install_dpu "uv-t-filesRenamer-*.jar”
install_dpu "uv-t-filesToRdf-*.jar”
install_dpu "uv-t-filterValidXml-*.jar”
install_dpu "uv-t-metadata-*.jar”
install_dpu "uv-t-rdfMerger-*.jar”
install_dpu "uv-t-rdfToFiles-*.jar”
install_dpu "uv-t-relational-*.jar”
install_dpu "uv-t-sparqlConstruct-*.jar”
install_dpu "uv-t-sparqlSelect-*.jar”
install_dpu "uv-t-sparqlUpdate-*.jar”
install_dpu "uv-t-tabular-*.jar”
install_dpu "uv-t-tabularToRelational-*.jar”
install_dpu "uv-t-unzipper-*.jar”
install_dpu "uv-t-xslt-*.jar”
install_dpu "uv-t-zipper-*.jar”