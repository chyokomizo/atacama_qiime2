rule all_summarized:
    input: 
        
    output:
        
    conda: 
        "../envs/qiime2-2022.2.yml"
    log:

    shell:
        """qiime feature-table summarize \
        --i-table table.qza \
        --o-visualization table.qzv \
        --m-sample-metadata-file sample-metadata.tsv

        qiime feature-table tabulate-seqs \
        --i-data rep-seqs.qza \
        --o-visualization rep-seqs.qzv

        qiime metadata tabulate \
        --m-input-file denoising-stats.qza \
        --o-visualization denoising-stats.qzv"""