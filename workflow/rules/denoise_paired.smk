rule denoise_paired:
    input: 
        demuxqza = "results/demux-subsample/demux.qza",
    output:
        table = "results/table.qza",
        repseq = "results/rep-seqs.qza",
        denstats = "results/denoising-stats.qza",
    conda: 
        "../envs/qiime2-2022.2.yml"
    log:

    shell:
        "qiime dada2 denoise-paired"
        " --i-demultiplexed-seqs {input.demuxqza}"
        " --p-trim-left-f 13"
        " --p-trim-left-r 13"
        " --p-trunc-len-f 150"
        " --p-trunc-len-r 150"
        " --o-table {output.table}"
        " --o-representative-sequences {output.repseq}"
        " --o-denoising-stats {output.denstats}"
