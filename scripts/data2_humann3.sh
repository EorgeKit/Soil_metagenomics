#!/bin/bash
#PBS -l select=2:ncpus=24:mpiprocs=24:mem=120gb
#PBS -N data2_humann3_analysis_optimized
#PBS -q normal
#PBS -P CBBI1470
#PBS -l walltime=8:00:00
#PBS -m abe
#PBS -M eugenemwanza04@gmail.com

eval "$(conda shell.bash hook)"

conda activate biobakery4

##taxonomic and functional profiling with humann3
humann --threads 48 --output-basename data2 \
--metaphlan-options="--stat_q 0.1 --unclassified_estimation" \
--translated-subject-coverage-threshold 0.0 \
--nucleotide-subject-coverage-threshold 0.0 \
--bowtie-options=“–very-sensitive-local” \
--nucleotide-query-coverage-threshold 50.0 \
--translated-query-coverage-threshold 50.0 \
--input /mnt/lustre/users/maloo/euMwanza/data2_filtering_results/S2_S1_L001_concat.fastq \
--output /mnt/lustre/users/maloo/euMwanza/data2_humann3/optimized
