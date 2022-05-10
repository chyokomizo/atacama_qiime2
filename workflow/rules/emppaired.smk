rule emppaired:
    input: 
        forw = "data/emp-paired-end-sequences/forward.fastq.gz",
        rev = "data/emp-paired-end-sequences/reverse.fastq.gz",
        barcodes = "data/emp-paired-end-sequences/barcodes.fastq.gz",
    output:
        epairedend = "results/importqza/emp-paired-end-sequences.qza"
    #log: 
        #"results/logs/emp-paired-end-sequences.qza.log"
    conda: 
        "../envs/qiime2-2022.2.yml" #aqui volta uma pasta
    shell: 
        #2>&1 {log} envia erro e prints da tela para o log 
        "qiime tools import " 
        "--type EMPPairedEndSequences "
        "--input-path data/emp-paired-end-sequences/ "
        "--output-path {output.epairedend}"

