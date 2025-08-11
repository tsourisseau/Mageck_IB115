#!/bin/bash

################################ Slurm options #################################
### Limit run time "hours:minutes:seconds" (default: 365 days)
#SBATCH --time=12:00:00
#SBATCH -A atacseq
### Specify requirements - Task (default: 1 node, 1 Core, 12.5G mem/cpu)
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=9
#SBATCH --mem-per-cpu=10GB

################################################################################
###sbatch --time=12:00:00 --nodes=1 --ntasks-per-node=10 --mem-per-cpu=20GB run_tobias.sh
################################################################################

begin=`date +%s`


source activate mageckenv

mageck test -k /shared/projects/atacseq/Brunello_gRNA_CRISPR_Screen/data/sample.txt \
            -t HL60.final,KBM7.final \
            -c HL60.initial,KBM7.initial \
            -n demo4 \
            --cnv-norm /shared/projects/atacseq/Brunello_gRNA_CRISPR_Screen/data/CGH_cell_lines/CNV_demo4.txt \
            --cell-line HL60_HAEMATOPOIETIC_AND_LYMPHOID_TISSUE 


conda deactivate
#--control-sgrna /shared/projects/atacseq/Brunello_gRNA_CRISPR_Screen/results_IB115_CNV_NORM/plasmid_NT_KTX_1.count_Non_Targetting_Controls_List.txt \
end=`date +%s`
elapsed=`expr $end - $begin`
echo Time taken: $elapsed