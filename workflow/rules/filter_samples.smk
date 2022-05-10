rule tools_export:
    input: 
        demuxsumm = "results/subsamples/demux-subsample.qzv",
    output:
        demuxmeta = "results/demux-subsample/per-sample-fastq-counts.tsv",
    conda: 
        "../envs/qiime2-2022.2.yml"
    shell:
        "qiime tools export" 
        " --input-path {input.demuxsumm}"
        " --output-path results/demux-subsample/"

"""rule filter_samples:
    input: 
        demuxsub = "results/subsamples/demux-subsample.qza",
    output:
        demuxqza = "results/demux.qza",
    conda: 
        "../envs/qiime2-2022.2.yml"
    log:
        "results/logs/demux.qza.log"
    shell:
        "qiime demux filter-samples"
        " --i-demux {input.demuxsub}"
        " --m-metadata-file results/demux-subsample/per-sample-fastq-counts.tsv"
        " --p-where 'CAST([forward sequence count] AS INT) > 100'"
        " --o-filtered-demux {output.demuxqza}"""