#TODO : log estava impedindo de rodar, precisa consertar isso

rule demux:
    input: 
        epairedend = "results/importqza/emp-paired-end-sequences.qza",
    output:
        demuxfull = "results/demultiplex/demux-full.qza", 
        demuxdet = "results/demultiplex/demux-details.qza",
    conda: 
        "../envs/qiime2-2022.2.yml"
    shell: 
        "qiime demux emp-paired" 
        " --m-barcodes-file data/sample-metadata.tsv"
        " --m-barcodes-column barcode-sequence"
        " --p-rev-comp-mapping-barcodes"
        " --i-seqs {input.epairedend}"
        " --o-per-sample-sequences {output.demuxfull}"
        " --o-error-correction-details {output.demuxdet}"
    