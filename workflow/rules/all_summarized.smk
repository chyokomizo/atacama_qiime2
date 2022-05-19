rule summarize:
    input: 
        table = "results/table.qza",
    output:
        "results/summarized/table.qzv",
    conda: 
        "../envs/qiime2-2022.2.yml"
    log:

    shell:
        "qiime feature-table summarize "
        "--i-table {input.table} "
        "--o-visualization {output} "
        "--m-sample-metadata-file data/sample-metadata.tsv"

rule feature:
    input: 
        repseq = "results/rep-seqs.qza",
    output:
        "results/summarized/rep-seqs.qzv",
    conda: 
        "../envs/qiime2-2022.2.yml"
    log:

    shell:
        "qiime feature-table tabulate-seqs "
        "--i-data {input.repseq} "
        "--o-visualization {output}"

rule tabulate:
    input: 
        denstats = "results/denoising-stats.qza",
    output:
        "results/summarized/denoising-stats.qzv",
    conda: 
        "../envs/qiime2-2022.2.yml"
    log:

    shell:
        "qiime metadata tabulate "
        "--m-input-file {input.denstats} "
        "--o-visualization {output}"