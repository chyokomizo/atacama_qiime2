rule summarize:
    input: 
        
    output:
        
    conda: 
        "../envs/qiime2-2022.2.yml"
    log:

    shell:
        "qiime feature-table summarize "
        "--i-table table.qza "
        "--o-visualization table.qzv "
        "--m-sample-metadata-file sample-metadata.tsv"

rule feature:
    input: 
        
    output:
        
    conda: 
        "../envs/qiime2-2022.2.yml"
    log:

    shell:
        "qiime feature-table tabulate-seqs "
        "--i-data rep-seqs.qza "
        "--o-visualization rep-seqs.qzv"

rule tabulate:
    input: 
        
    output:
        
    conda: 
        "../envs/qiime2-2022.2.yml"
    log:

    shell:
        "qiime metadata tabulate "
        "--m-input-file denoising-stats.qza "
        "--o-visualization denoising-stats.qzv"