rule demux:
    input: 
        for = "../data/emp-paired-end-sequences/forward.fastq.gz",
        rev = "../data/emp-paired-end-sequences/reverse.fastq.gz",
        barcodes = "../data/emp-paired-end-sequences/barcodes.fastq.gz",
    output:
        epairedend = "results/importqza/emp-paired-end-sequences.qza"
    log: 
        "results/logs/emp-paired-end-sequences.qza.log"
    conda: 
        "../envs/qiime2-2022.2.yml"
    shell: 
    "qiime tools import --type EMPPairedEndSequences --input-path {input.for} {input.rev} {input.barcodes} --output-path {output.epairedend}"

