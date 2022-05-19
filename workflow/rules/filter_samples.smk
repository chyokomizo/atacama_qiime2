rule tools_export:
    input: 
        demuxsumm = "results/subsamples/demux-subsample.qzv",
    output:
        "results/demux-subsample/per-sample-fastq-counts.tsv",
    conda: 
        "../envs/qiime2-2022.2.yml"
    params: 
        prefix=lambda wc, output: os.path.dirname(output[0])
    shell:
        "qiime tools export " 
        "--input-path {input.demuxsumm} "
        "--output-path {params.prefix}"

rule filter_samples:
    input: 
        tsv = "results/demux-subsample/per-sample-fastq-counts.tsv",
        demuxsub = "results/subsamples/demux-subsample.qza",
    output:
        demuxqza = "results/demux-subsample/demux.qza",
    conda: 
        "../envs/qiime2-2022.2.yml"
    shell:
        "qiime demux filter-samples"
        " --i-demux {input.demuxsub}"
        " --m-metadata-file {input.tsv}"
        " --p-where 'CAST([forward sequence count] AS INT) > 100'"
        " --o-filtered-demux {output.demuxqza}"