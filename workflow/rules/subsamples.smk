rule subsamples_paired:
    input: 
        demuxfull = "results/demultiplex/demux-full.qza",
    output:
        demuxsub = "results/subsamples/demux-subsample.qza",
    conda: 
        "../envs/qiime2-2022.2.yml"
    log:

    shell: 
        "qiime demux subsample-paired"
        " --i-sequences {input.demuxfull}"
        " --p-fraction 0.3"
        " --o-subsampled-sequences {output.demuxsub}"

rule subsamples_summarize:
    input: 
        demuxsub = "results/subsamples/demux-subsample.qza",
    output:
        demuxsumm = "results/subsamples/demux-subsample.qzv",
    conda: 
        "../envs/qiime2-2022.2.yml"
    params: 

    log:
    
    shell: 
        "qiime demux summarize"
        " --i-data {input}"
        " --o-visualization {output}"