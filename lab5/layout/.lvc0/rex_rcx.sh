set -e
set -x

rex -dp_comm_string 1,vlsilab-client57.eced.svnit.ac.in,44853 -V -m -pd -I# -tech /tools/cadence/FOUNDRY/analog/180nm/pv/assura/rcx_RF -map p2elayermapfile -N NET -e2 -Ply np_rPOLYterm -rP res.mod -mp mprexaz0GiPc np_rM1term::mt1_cut - rVia1,1,x rPSDcont,1,t rPOLYcont,1,T rNSDcont,1,t - L1T0,1,I

rex -dp_comm_string 2,vlsilab-client57.eced.svnit.ac.in,44853 -V -m -pd -I# -tech /tools/cadence/FOUNDRY/analog/180nm/pv/assura/rcx_RF -map p2elayermapfile -N NET -e2 -Ply np_rPOLYterm -rP res.mod -mp mprexa3hWgku np_rPOLYterm::poly_cut - PMOS_MOS_27_mgvia,1,z NMOS_MOS_21_mgvia,1,z rPOLYcont,1,x

rex -dp_comm_string 3,vlsilab-client57.eced.svnit.ac.in,44853 -V -m -pd -I# -tech /tools/cadence/FOUNDRY/analog/180nm/pv/assura/rcx_RF -map p2elayermapfile -N NET -e2 -Ply np_rPOLYterm -rP res.mod -mp mprexa2WIK9w np_rM2term::mt2_cut - rVia1,1,T

rexmerge -V -N NET -n mprexa3hWgku,mprexaz0GiPc,mprexa2WIK9w -b np_rPOLYterm::Rnp_rPOLYterm.dev2,np_rM1term::Rnp_rM1term.dev2,np_rM2term::Rnp_rM2term.dev2 -l ,L1T0, np_rPOLYterm.res,np_rM1term.res,np_rM2term.res

