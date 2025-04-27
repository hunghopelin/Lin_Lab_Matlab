
% SAMPLE WORKFLOW: 2D correlation analysis
% Goal: for our pre-selected gene sets, 
%   obtain 2D correlation data (in both x and y direction) as a function of distance
%   and output results as a heatmap.
%   Do this for both wound-boundary (section 1) and control (section 2) data
% Sweep2D is a modified version of the original sweep1D


% SECTION 1: 2D CORRELATOIN FOR WOUND-BOUNDARY DATA
% gene sets in order of:
gene_set_names = ["HALLMARK_EPITHELIAL_MESENCHYMAL_TRANSITION";
    "HALLMARK_TNFA_SIGNALING_VIA_NFKB";
    "HALLMARK_TGF_BETA_SIGNALING";
    "HALLMARK_APICAL_JUNCTION";
    "HALLMARK_GLYCOLYSIS";
    "HALLMARK_INFLAMMATORY_RESPONSE";
    "GOMF_PRIMARY_ACTIVE_TRANSMEMBRANE_TRANSPORTER_ACTIVITY";
    "REACTOME_RESPIRATORY_ELECTRON_TRANSPORT";
    "WP_OXIDATIVE_PHOSPHORYLATION";
    "GOBP_CORTICAL_ACTIN_CYTOSKELETON_ORGANIZATION";
    "GOBP_CORTICAL_CYTOSKELETON_ORGANIZATION";
    "HALLMARK_KRAS_SIGNALING_DN";
    "HALLMARK_OXIDATIVE_PHOSPHORYLATION";
    "HALLMARK_FATTY_ACID_METABOLISM";
    "HALLMARK_INTERFERON_ALPHA_RESPONSE"];

% actual genes in each corresponding gene set
gene_sets = {'ABI3BP ACTA2 ADAM12 ANPEP APLP1 AREG BASP1 BDNF BGN BMP1 CADM1 CALD1 CALU CAP2 CAPG CCN1 CCN2 CD44 CDH11 CDH2 CDH6 COL11A1 COL12A1 COL16A1 COL1A1 COL1A2 COL3A1 COL4A1 COL4A2 COL5A1 COL5A2 COL5A3 COL6A2 COL6A3 COL7A1 COL8A2 COLGALT1 COMP COPA CRLF1 CTHRC1 CXCL1 CXCL12 CXCL6 CXCL8 DAB2 DCN DKK1 DPYSL3 DST ECM1 ECM2 EFEMP2 ELN EMP3 ENO2 FAP FAS FBLN1 FBLN2 FBLN5 FBN1 FBN2 FERMT2 FGF2 FLNA FN1 FOXC2 FSTL1 FSTL3 FUCA1 FZD8 GADD45A GADD45B GAS1 GEM GJA1 GLIPR1 GPC1 GPX7 HTRA1 ID2 IGFBP2 IGFBP3 IGFBP4 IL15 IL32 IL6 INHBA ITGA2 ITGA5 ITGAV ITGB1 ITGB3 ITGB5 JUN LAMA1 LAMA2 LAMA3 LAMC1 LAMC2 LGALS1 LOX LOXL1 LOXL2 LRP1 LRRC15 MAGEE1 MATN2 MATN3 MCM7 MEST MFAP5 MGP MMP1 MMP14 MMP2 MMP3 MSX1 MYL9 MYLK NID2 NNMT NOTCH2 NT5E OXTR P3H1 PCOLCE PCOLCE2 PDGFRB PDLIM4 PFN2 PLAUR PLOD1 PLOD2 PLOD3 PMEPA1 PMP22 POSTN PPIB PTHLH PTX3 PVR QSOX1 RGS4 RHOB SAT1 SCG2 SDC1 SDC4 SERPINE1 SERPINE2 SERPINH1 SFRP1 SFRP4 SGCB SGCD SLC6A8 SLIT2 SLIT3 SNAI2 SNTB1 SPARC SPOCK1 SPP1 TAGLN TFPI2 TGFB1 TGFBI TGFBR3 TGM2 THBS1 THBS2 THY1 TIMP1 TIMP3 TNC TNFAIP3 TNFRSF11B TNFRSF12A TPM1 TPM2 TPM4 VCAN VEGFA VEGFC VIM WIPF1 WNT5A';
             'ABCA1 ACKR3 AREG ATF3 ATP2B1 B4GALT1 B4GALT5 BCL2A1 BCL3 BCL6 BHLHE40 BIRC2 BIRC3 BMP2 BTG1 BTG2 BTG3 CCL2 CCL20 CCL5 CCN1 CCND1 CCNL1 CCRL2 CD44 CD80 CD83 CDKN1A CEBPB CEBPD CFLAR CLCF1 CSF1 CSF2 CXCL1 CXCL10 CXCL11 CXCL2 CXCL3 CXCL6 DENND5A DNAJB4 DRAM1 DUSP1 DUSP2 DUSP4 DUSP5 EDN1 EFNA1 EGR1 EGR2 EGR3 EHD1 EIF1 ETS2 F2RL1 F3 FJX1 FOS FOSB FOSL1 FOSL2 FUT4 G0S2 GADD45A GADD45B GCH1 GEM GFPT2 HBEGF HES1 ICAM1 ID2 IER2 IER3 IER5 IFIH1 IFIT2 IFNGR2 IL12B IL15RA IL18 IL1A IL1B IL23A IL6 IL7R INHBA IRF1 IRS2 JAG1 JUN JUNB KDM6B KLF10 KLF2 KLF4 KLF6 KLF9 KYNU LAMB3 LDLR LIF LITAF MAFF MAP2K3 MAP3K8 MARCKS MCL1 MXD1 MYC NAMPT NFAT5 NFE2L2 NFIL3 NFKB1 NFKB2 NFKBIA NFKBIE NINJ1 NR4A1 NR4A2 NR4A3 OLR1 PANX1 PDE4B PDLIM5 PER1 PFKFB3 PHLDA1 PHLDA2 PLAU PLAUR PLEK PLK2 PLPP3 PMEPA1 PNRC1 PPP1R15A PTGER4 PTGS2 PTPRE PTX3 RCAN1 REL RELA RELB RHOB RIPK2 RNF19B SAT1 SDC4 SERPINB2 SERPINB8 SERPINE1 SGK1 SLC16A6 SLC2A3 SLC2A6 SMAD3 SNN SOCS3 SOD2 SPHK1 SPSB1 SQSTM1 STAT5A TANK TAP1 TGIF1 TIPARP TLR2 TNC TNF TNFAIP2 TNFAIP3 TNFAIP6 TNFAIP8 TNFRSF9 TNFSF9 TNIP1 TNIP2 TRAF1 TRIB1 TRIP10 TSC22D1 TUBB2A VEGFA YRDC ZBTB10 ZC3H12A ZFP36';
             'ACVR1 APC ARID4B BCAR3 BMP2 BMPR1A BMPR2 CDH1 CDK9 CDKN1C CTNNB1 ENG FNTA FURIN HDAC1 HIPK2 ID1 ID2 ID3 IFNGR2 JUNB KLF10 LEFTY2 LTBP2 MAP3K7 NCOR2 NOG PMEPA1 PPM1A PPP1CA PPP1R15A RAB31 RHOA SERPINE1 SKI SKIL SLC20A1 SMAD1 SMAD3 SMAD6 SMAD7 SMURF1 SMURF2 SPTBN1 TGFB1 TGFBR1 TGIF1 THBS1 TJP1 TRIM33 UBE2D3 WWTR1 XIAP';
             'ACTA1 ACTB ACTC1 ACTG1 ACTG2 ACTN1 ACTN2 ACTN3 ACTN4 ADAM15 ADAM23 ADAM9 ADAMTS5 ADRA1B AKT2 AKT3 ALOX15B AMH AMIGO1 AMIGO2 ARHGEF6 ARPC2 ATP1A3 B4GALT1 BAIAP2 BMP1 CADM2 CADM3 CALB2 CAP1 CD209 CD274 CD276 CD34 CD86 CD99 CDH1 CDH11 CDH15 CDH3 CDH4 CDH6 CDH8 CDK8 CDSN CERCAM CLDN11 CLDN14 CLDN15 CLDN19 CLDN4 CLDN6 CLDN7 CLDN9 CNN2 COL16A1 COL17A1 COL9A1 CRAT CRB3 CTNNA1 CTNND1 CX3CL1 DHX16 DLG1 DMP1 DSC3 EGFR EPB41L2 EVL EXOC4 FBN1 FLNC FSCN1 FYB1 GAMT GNAI1 GNAI2 GRB7 GTF2F1 HADH HRAS ICAM1 ICAM2 ICAM4 ICAM5 IKBKG INPPL1 INSIG1 IRS1 ITGA10 ITGA2 ITGA3 ITGA9 ITGB1 ITGB4 JAM3 JUP KCNH2 KRT31 LAMA3 LAMB3 LAMC2 LAYN LDLRAP1 LIMA1 MADCAM1 MAP3K20 MAP4K2 MAPK11 MAPK13 MAPK14 MDK MMP2 MMP9 MPZL1 MPZL2 MSN MVD MYH10 MYH9 MYL12B MYL9 NECTIN1 NECTIN2 NECTIN3 NECTIN4 NEGR1 NEXN NF1 NF2 NFASC NLGN2 NLGN3 NRTN NRXN2 PARD6G PARVA PBX2 PCDH1 PECAM1 PFN1 PIK3CB PIK3R3 PKD1 PLCG1 PPP2R2C PTEN PTK2 RAC2 RASA1 RHOF RRAS RSU1 SDC3 SGCE SHC1 SHROOM2 SIRPA SKAP2 SLC30A3 SLIT2 SORBS3 SPEG SRC STX4 SYK SYMPK TAOK2 TGFBI THBS3 THY1 TIAL1 TJP1 TMEM8B TNFRSF11B TRAF1 TRO TSC1 TSPAN4 TUBG1 VASP VAV2 VCAN VCL VWF WASL WNK4 YWHAH ZYX';
             'ABCB6 ADORA2B AGL AGRN AK4 AKR1A1 ALDH7A1 ALDH9A1 ALDOB ALG1 ANG ANGPTL4 ANKZF1 ARPP19 ARTN AURKA B3GALT6 B3GAT1 B3GAT3 B3GNT3 B4GALT1 B4GALT2 B4GALT4 B4GALT7 BIK BPNT1 CACNA1H CAPN5 CASP6 CD44 CDK1 CENPA CHPF CHPF2 CHST1 CHST12 CHST2 CHST4 CHST6 CITED2 CLDN3 CLDN9 CLN6 COG2 COL5A1 COPB2 CTH CXCR4 CYB5A DCN DDIT4 DEPDC1 DLD DPYSL4 DSC2 ECD EFNA3 EGFR EGLN3 ELF3 ENO1 ENO2 ERO1A EXT1 EXT2 FAM162A FBP2 FUT8 G6PD GAL3ST1 GALE GALK1 GALK2 GAPDHS GCLC GFPT1 GLCE GLRX GMPPA GMPPB GNE GNPDA1 GOT1 GOT2 GPC1 GPC3 GPC4 GPR87 GUSB GYS1 GYS2 HAX1 HDLBP HK2 HMMR HOMER1 HS2ST1 HS6ST2 HSPA5 IDH1 IDUA IER3 IGFBP3 IL13RA1 IRS2 ISG20 KDELR3 KIF20A KIF2A LCT LDHC LHPP LHX9 MDH1 MDH2 ME1 ME2 MED24 MERTK MET MIF MIOX MPI MXI1 NANP NASP NDST3 NDUFV3 NOL3 NSDHL NT5E P4HA1 P4HA2 PAM PAXIP1 PC PDK3 PFKFB1 PFKP PGAM1 PGAM2 PGK1 PGLS PGM2 PHKA2 PKM PKP2 PLOD1 PLOD2 PMM2 POLR3K PPFIA4 PPIA PPP2CB PRPS1 PSMC4 PYGB PYGL QSOX1 RBCK1 RPE RRAGD SAP30 SDC1 SDC2 SDC3 SLC16A3 SLC25A10 SLC25A13 SLC35A3 SLC37A4 SOD1 SOX9 SPAG4 SRD5A3 STC1 STC2 STMN1 TALDO1 TGFA TGFBI TKTL1 TPBG TPST1 UGP2 VCAN VEGFA VLDLR XYLT2 ZNF292';
             'ABCA1 ABI1 ACVR1B ACVR2A ADGRE1 ADM ADORA2B ADRM1 AHR APLNR AQP9 ATP2A2 ATP2B1 ATP2C1 AXL BDKRB1 BEST1 BST2 BTG2 C3AR1 C5AR1 CALCRL CCL2 CCL20 CCL22 CCL24 CCL5 CCR7 CCRL2 CD14 CD40 CD55 CD70 CD82 CDKN1A CHST2 CMKLR1 CSF1 CSF3 CSF3R CX3CL1 CXCL10 CXCL11 CXCL6 CXCL8 CXCR6 CYBB DCBLD2 EBI3 EDN1 EIF2AK2 EMP3 EREG F3 FFAR2 FPR1 FZD5 GABBR1 GCH1 GNA15 GNAI3 GPC3 GPR132 HAS2 HBEGF HIF1A HPN HRH1 ICAM1 ICAM4 IFITM1 IFNAR1 IFNGR2 IL10 IL12B IL15 IL15RA IL18 IL18R1 IL18RAP IL1A IL1B IL1R1 IL2RB IL4R IL6 IL7R INHBA IRAK2 IRF1 IRF7 ITGA5 ITGB3 ITGB8 KCNJ2 KCNMB2 KIF1B KLF6 LAMP3 LCP2 LDLR LIF LPAR1 LTA LY6E LYN MARCO MEFV MEP1A MET MMP14 MXD1 MYC NAMPT NDP NFKB1 NFKBIA NLRP3 NMI NMUR1 NOD2 OLR1 OPRK1 OSM OSMR P2RX4 P2RX7 P2RY2 PCDH7 PDE4B PDPN PIK3R5 PLAUR PROK2 PSEN1 PTAFR PTGER2 PTGER4 PTGIR PTPRE PVR RAF1 RASGRP1 RELA RGS16 RHOG RIPK2 RNF144B ROS1 RTP4 SCARF1 SCN1B SELENOS SELL SEMA4D SERPINE1 SGMS2 SLAMF1 SLC11A2 SLC1A2 SLC31A1 SLC31A2 SLC4A4 SLC7A1 SLC7A2 SPHK1 SRI STAB1 TACR3 TAPBP TIMP1 TLR1 TLR2 TLR3 TNFAIP6 TNFRSF1B TNFRSF9 TNFSF10 TNFSF15 TNFSF9 TPBG';
             'ABCA1 ABCA10 ABCA12 ABCA13 ABCA2 ABCA3 ABCA4 ABCA5 ABCA6 ABCA7 ABCA8 ABCA9 ABCB1 ABCB10 ABCB11 ABCB4 ABCB6 ABCB7 ABCB8 ABCB9 ABCC1 ABCC11 ABCC12 ABCC2 ABCC3 ABCC4 ABCC5 ABCD1 ABCD2 ABCD3 ABCD4 ABCG1 ABCG2 ABCG4 ABCG5 ABCG8 ATP12A ATP13A1 ATP13A2 ATP13A3 ATP13A4 ATP1A1 ATP1A2 ATP1A3 ATP1B1 ATP2A1 ATP2A2 ATP2A3 ATP2B1 ATP2B2 ATP2B3 ATP2B4 ATP2C1 ATP2C2 ATP4A ATP5F1B ATP6V0A1 ATP6V0A2 ATP6V0A4 ATP6V0B ATP6V0C ATP6V0D1 ATP6V0D2 ATP6V0E1 ATP6V0E2 ATP6V1A ATP6V1B1 ATP6V1B2 ATP6V1C1 ATP6V1C2 ATP6V1D ATP6V1E1 ATP6V1E2 ATP6V1F ATP6V1G1 ATP6V1G2 ATP6V1G3 ATP6V1H ATP7A ATP7B ATP8A1 COX15 COX4I1 COX4I2 COX5B COX6B1 COX7A2L COX7B COX8A CYB561A3 CYB561D1 CYB561D2 CYB5A CYBRD1 CYC1 KCNJ11 MT-CO2 MT-CO3 MT-CYB MT-ND1 MT-ND2 MT-ND3 MT-ND4 MT-ND4L MT-ND5 MT-ND6 NDUFA1 NDUFA10 NDUFA12 NDUFA2 NDUFA3 NDUFA4 NDUFA5 NDUFA6 NDUFA7 NDUFA8 NDUFA9 NDUFB1 NDUFB10 NDUFB2 NDUFB3 NDUFB4 NDUFB5 NDUFB6 NDUFB7 NDUFB8 NDUFB9 NDUFC1 NDUFC2 NDUFS1 NDUFS2 NDUFS3 NDUFS4 NDUFS5 NDUFS6 NDUFS7 NDUFS8 NDUFV1 NDUFV2 NDUFV3 RALBP1 SURF1 TAP1 TAP2 TCIRG1 TMEM94 TOMM20 UQCR10 UQCRC1 UQCRFS1 UQCRH';
             'ACAD9 BCS1L CMC1 COA1 COA3 COA5 COQ10A COQ10B COX11 COX14 COX15 COX16 COX17 COX18 COX19 COX20 COX4I1 COX4I2 COX5B COX6A1 COX6A2 COX6B1 COX6B2 COX6C COX7A2 COX7A2L COX7B COX7C COX8A COX8C CYC1 CYCS DMAC1 DMAC2 ECSIT ETFA ETFB ETFDH FOXRED1 FXN GOT1 GOT2 HCCS HIGD1A HIGD1C HIGD2A HSCB HSPA9 ISCU LETM1 LYRM2 LYRM4 LYRM7 MDH1 MDH2 MT-CO2 MT-CO3 MT-CYB MT-ND1 MT-ND2 MT-ND3 MT-ND4 MT-ND5 MT-ND6 NDUFA1 NDUFA10 NDUFA11 NDUFA12 NDUFA13 NDUFA2 NDUFA3 NDUFA4 NDUFA5 NDUFA6 NDUFA7 NDUFA8 NDUFA9 NDUFAB1 NDUFAF1 NDUFAF2 NDUFAF3 NDUFAF4 NDUFAF5 NDUFAF6 NDUFAF7 NDUFAF8 NDUFB1 NDUFB10 NDUFB11 NDUFB2 NDUFB3 NDUFB4 NDUFB5 NDUFB6 NDUFB7 NDUFB8 NDUFB9 NDUFC1 NDUFC2 NDUFS1 NDUFS2 NDUFS3 NDUFS4 NDUFS5 NDUFS6 NDUFS7 NDUFS8 NDUFV1 NDUFV2 NDUFV3 NFS1 NUBPL OXA1L PET100 PET117 PNKD PYURF RAB5IF SCO1 SCO2 SDHA SDHB SFXN4 SLC25A11 SLC25A12 SLC25A13 SLC25A18 SLC25A22 SMIM20 SURF1 TACO1 TIMM21 TIMMDC1 TMEM126A TMEM126B TMEM177 TMEM186 TMEM223 TRAP1 TTC19 UQCC1 UQCC2 UQCC3 UQCR10 UQCR11 UQCRB UQCRC1 UQCRC2 UQCRFS1 UQCRH UQCRQ';
             'ATP5F1A ATP5F1B ATP5F1D ATP5F1E ATP5MC1 ATP5MC2 ATP5MC3 ATP5ME ATP5MF ATP5MG ATP5PB ATP5PD ATP5PF ATP5PO ATP6AP1 ATP6AP2 DMAC2L MT-ATP6 MT-ND1 MT-ND2 MT-ND3 MT-ND4 MT-ND4L MT-ND5 MT-ND6 NDUFA10 NDUFA11 NDUFA2 NDUFA3 NDUFA4 NDUFA4L2 NDUFA5 NDUFA6 NDUFA7 NDUFA8 NDUFA9 NDUFAB1 NDUFB1 NDUFB10 NDUFB2 NDUFB4 NDUFB5 NDUFB6 NDUFB7 NDUFB8 NDUFB9 NDUFC1 NDUFC2 NDUFS1 NDUFS2 NDUFS3 NDUFS4 NDUFS5 NDUFS6 NDUFS7 NDUFS8 NDUFV1 NDUFV2 NDUFV3';
             'AKAP11 ANLN ARF6 CALR CAVIN3 DLG1 ECT2 EHD2 EPB41 EPB41L1 EPB41L2 EPB41L3 EZR FHOD1 FHOD3 FMNL1 FMNL2 FMNL3 IKBKB IQGAP1 IQGAP2 IQGAP3 LCP1 LLGL1 LLGL2 NCKAP1 NCKAP1L PDCD6IP PLEC PLEK PLS1 RAB13 RHOQ ROCK1 ROCK2 RTKN STRIP1 TLN1 TNF VIL1 VPS4A';
             'AKAP11 ANLN ARF6 CALR CAVIN3 DLG1 ECT2 EHD2 EPB41 EPB41L1 EPB41L2 EPB41L3 EZR FHOD1 FHOD3 FMNL1 FMNL2 FMNL3 IKBKB IQGAP1 IQGAP2 IQGAP3 LCP1 LLGL1 LLGL2 NCKAP1 NCKAP1L NLGN1 PAFAH1B1 PDCD6IP PLEC PLEK PLS1 PPP2R3C PTK2B RAB13 RAC1 RAC3 RHOG RHOQ ROCK1 ROCK2 RTKN STRIP1 TLN1 TNF TRPV4 VIL1 VPS4A WDR1';
             'ABCB11 ABCG4 ACTC1 ADRA2C AKR1B10 ALOX12B AMBN ARHGDIG ARPP21 ASB7 ATP4A ATP6V1B1 BARD1 BMPR1B BRDT BTG2 C5 CACNA1F CACNG1 CALCB CALML5 CAMK1D CAPN9 CCDC106 CCNA1 CCR8 CD207 CD40LG CD80 CDH16 CDKAL1 CELSR2 CHRNG CHST2 CKM CLDN16 CLDN8 CLPS CLSTN3 CNTFR COL2A1 COPZ2 COQ8A CPA2 CPB1 CPEB3 CYP11B2 CYP39A1 DCC DLK2 DTNB EDAR EDN1 EDN2 EFHD1 EGF ENTPD7 EPHA5 FGF16 FGF22 FGFR3 FGGY FSHB GAMT GDNF GP2 GPR19 GPR3 GPRC5C GRID2 GTF3C5 HNF1A HSD11B2 HTR1D IDUA IFI44L IFNG IGFBP2 IL12B IL5 INSL5 IRS4 ITGB1BP2 ITIH3 KCND1 KCNE2 KCNMB1 KCNN1 KCNQ2 KLHDC8A KLK7 KLK8 KMT2D KRT1 KRT13 KRT15 KRT4 KRT5 LFNG LGALS7 LYPD3 MAGIX MAST3 MEFV MFSD6 MSH5 MTHFR MX1 MYH7 MYO15A MYOT NGB NOS1 NPHS1 NR4A2 NR6A1 NTF3 NUDT11 OXT P2RX6 PAX3 PAX4 PCDHB1 PDCD1 PDE6B PDK2 PKP1 PLAG1 PNMT PRKN PROP1 PTGFR PTPRJ RGS11 RIBC2 RSAD2 RYR1 RYR2 SCGB1A1 SCN10A SELENOP SERPINA10 SERPINB2 SGK1 SHOX2 SIDT1 SKIL SLC12A3 SLC16A7 SLC25A23 SLC29A3 SLC30A3 SLC38A3 SLC5A5 SLC6A14 SLC6A3 SMPX SNCB SNN SOX10 SPHK2 SPRR3 SPTBN2 SSTR4 STAG3 SYNPO TAS2R4 TCF7L1 TCL1A TENM2 TENT5C TEX15 TFAP2B TFCP2L1 TFF2 TG TGFB2 TGM1 THNSL2 THRB TLX1 TNNI3 TSHB UGT2B17 UPK3B VPREB1 VPS50 WNT16 YBX2 YPEL1 ZBTB16 ZC2HC1C ZNF112';
             'ABCB7 ACAA1 ACAA2 ACADM ACADSB ACADVL ACAT1 ACO2 AFG3L2 AIFM1 ALAS1 ALDH6A1 ATP1B1 ATP5F1A ATP5F1B ATP5F1C ATP5F1D ATP5F1E ATP5MC1 ATP5MC2 ATP5MC3 ATP5ME ATP5MF ATP5MG ATP5PB ATP5PD ATP5PF ATP5PO ATP6AP1 ATP6V0B ATP6V0C ATP6V0E1 ATP6V1C1 ATP6V1D ATP6V1E1 ATP6V1F ATP6V1G1 ATP6V1H BAX BCKDHA BDH2 CASP7 COX10 COX11 COX15 COX17 COX4I1 COX5B COX6A1 COX6B1 COX6C COX7A2 COX7A2L COX7B COX7C COX8A CPT1A CS CYB5A CYB5R3 CYC1 CYCS DECR1 DLAT DLD DLST ECH1 ECHS1 ECI1 ETFA ETFB ETFDH FDX1 FH FXN GLUD1 GOT2 GPI GPX4 GRPEL1 HADHA HADHB HCCS HSD17B10 HSPA9 HTRA2 IDH1 IDH2 IDH3A IDH3B IDH3G IMMT ISCA1 ISCU LDHB LRPPRC MAOB MDH1 MDH2 MFN2 MGST3 MPC1 MTRF1 MTRR MTX2 NDUFA1 NDUFA2 NDUFA3 NDUFA4 NDUFA5 NDUFA6 NDUFA7 NDUFA8 NDUFA9 NDUFAB1 NDUFB1 NDUFB2 NDUFB3 NDUFB4 NDUFB5 NDUFB6 NDUFB7 NDUFB8 NDUFC1 NDUFC2 NDUFS1 NDUFS2 NDUFS3 NDUFS4 NDUFS6 NDUFS7 NDUFS8 NDUFV1 NDUFV2 NNT NQO2 OAT OGDH OPA1 OXA1L PDHA1 PDHB PDHX PDK4 PDP1 PHB2 PHYH PMPCA POLR2F POR PRDX3 RETSAT RHOT1 RHOT2 SDHA SDHB SLC25A11 SLC25A12 SLC25A20 SLC25A4 SLC25A5 SLC25A6 SUCLA2 SUCLG1 SUPV3L1 SURF1 TCIRG1 TIMM10 TIMM13 TIMM17A TIMM50 TIMM8B TIMM9 TOMM22 TOMM70 UQCR10 UQCR11 UQCRB UQCRC1 UQCRC2 UQCRFS1 UQCRH UQCRQ VDAC1 VDAC2 VDAC3';
             'AADAT ACAA1 ACAA2 ACADL ACADM ACADS ACADVL ACAT2 ACO2 ACOT8 ACOX1 ACSL1 ACSL4 ACSL5 ACSM3 ACSS1 ADH1C ADH7 ADIPOR2 ADSL ALAD ALDH1A1 ALDH3A1 ALDH3A2 ALDH9A1 AOC3 APEX1 AQP7 AUH BCKDHB BLVRA BMPR1B BPHL CA2 CA4 CA6 CBR1 CBR3 CD1D CD36 CEL CIDEA CPOX CPT1A CPT2 CRAT CRYZ CYP1A1 CYP4A11 CYP4A22 D2HGDH DECR1 DHCR24 DLD DLST ECH1 ECHS1 ECI1 ECI2 EHHADH ELOVL5 ENO2 ENO3 EPHX1 ERP29 ETFDH FABP1 FABP2 FASN FH FMO1 G0S2 GAD2 GAPDHS GCDH GLUL GPD1 GPD2 GRHPR GSTZ1 HADH HADHB HAO2 HCCS HIBCH HMGCL HMGCS1 HMGCS2 HPGD HSD17B10 HSD17B11 HSD17B4 HSDL2 HSP90AA1 HSPH1 IDH1 IDH3B IDH3G IDI1 IL4I1 INMT KMT5A LGALS1 LTC4S MAOA MCEE MDH1 MDH2 ME1 MGLL MIF MLYCD NBN NCAPH2 NSDHL NTHL1 ODC1 OSTC PCBD1 PDHA1 PDHB PPARA PRDX6 PSME1 PTPRG PTS RAP1GDS1 RDH11 RDH16 REEP6 RETSAT S100A10 SDHA SERINC1 SLC22A5 SMS SUCLA2 SUCLG1 SUCLG2 TDO2 TP53INP2 UBE2L6 UGDH UROD UROS VNN1 YWHAH';
             'ADAR B2M BATF2 BST2 C1S CASP8 CCRL2 CD47 CD74 CMPK2 CMTR1 CNP CSF1 CXCL10 CXCL11 DDX60 DHX58 EIF2AK2 ELF1 EPSTI1 GBP2 GBP4 GMPR HELZ2 HERC6 IFI27 IFI30 IFI35 IFI44 IFI44L IFIH1 IFIT2 IFIT3 IFITM1 IFITM2 IFITM3 IL15 IL4R IL7 IRF1 IRF2 IRF7 IRF9 ISG15 ISG20 LAMP3 LAP3 LGALS3BP LPAR6 LY6E MOV10 MVB12A MX1 NCOA7 NMI NUB1 OAS1 OASL OGFR PARP12 PARP14 PARP9 PLSCR1 PROCR PSMA3 PSMB8 PSMB9 PSME1 PSME2 RIPK2 RNF31 RSAD2 RTP4 SAMD9 SAMD9L SELL SLC25A28 SP110 STAT2 TAP1 TDRD7 TENT5A TMEM140 TRAFD1 TRIM14 TRIM21 TRIM25 TRIM26 TRIM5 TXNIP UBA7 UBE2L6 USP18'};


% finding gene expression for each gene set using .mtx spatial transcriptomics file
% MANUALLY LOAD MATRIX, BARCODES, FEATURES FROM WOUND DEEP-SEQUENCING 8UM FOLDER

for i = 1:length(gene_sets)
    disp(i);

    names = gene_sets{i};
    names_cell = strsplit(names,' ');
    existance = matches(names_cell, features);    % returns logical for genes in list that are in features
    missing = names_cell(existance==0);           % names of missing genes
    names_cell = names_cell(existance==1);
    clear existance names


    disp("finding grid");
    grid = geneSet_eight(names_cell, features, barcodes, matrix);   
        % finds gene expression for 8um gene set data
    grid = normalizationFunction_eight(grid, total);    % normalize to total
    
    save(strcat('uncropped/', gene_set_names(i), '.mat'), "grid");

    str = strsplit(gene_set_names(i), {'_'});
    title_i = join(str(1:length(str)));

    heatmapFunction(grid, title_i);

end


% crop everything so it only includes the wound-boundary area

files = dir('uncropped/*.mat');

for i = 1:length(files)
    name = files(i).name;
    file_name = strcat('uncropped/',name);
    grid = load(file_name);
    grid = struct2cell(grid);
    grid = grid{1};
    grid = cropData(grid, 40,820,370,500);

    title_i = strsplit(name, {'_','.'});
    title_i = title_i(1:length(title_i)-1);
    title_i = strjoin([title_i, {'Wound'}], ' ');

    heatmapFunction(grid, title_i)
    save(strcat('cropped_wound/',name), "grid")
end


% now for 2D correlation: wound boundary data
% MANUALLY LOAD DIST_VECS

files = dir('cropped_wound/*.mat');

for i = 1:length(files)
    
    % loading data 
    name = files(i).name;
    file_name = strcat('cropped_wound/',name);
    grid = load(file_name);
    grid = struct2cell(grid);
    grid = grid{1};

    title_i = strsplit(name, {'_','.'});
    title_i = title_i(1:length(title_i)-1);
    title_i = strjoin([title_i, {'2D Correlation'}], ' ');

    % 2D correlation output
    output = sweep2D(grid, dist_vecs);

    heatmapFunction(output, title_i)

end

% SECTION 2: 2D CORRELATION FOR CONTROL 8UM DEEPER SEQUENCING DATA

files = dir('../task1/grids/*.mat');

for i = 1:length(files)
    name = files(i).name;
    disp(name)

    file_name = strcat('../task1/grids/',name);
    grid = load(file_name);
    grid = struct2cell(grid);
    grid = grid{1};

    title_i = strsplit(name, {'_','.'});
    title_i = title_i(1:length(title_i)-1);
    title_i = strjoin([title_i, {'2D Control Correlation'}], ' ');

    output = sweep2D(grid, dist_vecs);  % correlation data

    heatmapFunction(output, title_i)

end

% key function to this script, mainly based off of sweep1D,
% except instead of it being a function of distance (a scalar)
% it is a function of distance the vector - folded over
function result = sweep2D(grid, dist_vecs)
    maxDist = 20;   % manually set maxDist
    
    % standardize expression
    mean_exp = mean(grid, 'all');
    sd_exp = sqrt(var(grid, 1, 'all'));
    grid = (grid-mean_exp) / sd_exp;
    
    
    coordX = repmat(1:size(grid,2), size(grid,1),1);
    coordY = repmat(1:size(grid,1), size(grid,2),1)';
    logVec = true(size(grid,1), size(grid,2));
    totalVec = grid(logVec);
    coordX = coordX(logVec);
    coordY = coordY(logVec);
    coordinates = [coordX coordY].';
    
    clear mean_exp sd_exp logVec;
    
    
    % CALCULATION FOR EACH DISTANCE 
    output = zeros(maxDist+1, maxDist+1);
    
    for dist = 0:maxDist
    
        vecs = dist_vecs{dist+1};   % get the vectors for this distance
        
        % out of bounds points are zero. There are 3 such out-of-bounds regions
        % the left margin, right margin, and bottom margin (the semicircle is a
        % bottom half of a circle)
        % we create margins that are the size of "dist"
        extendedTotal = zeros(size(grid,1)+dist, size(grid,2)+2*dist);
        extendedTotal(1:size(grid,1), (dist+1):(size(grid,2)+dist)) = grid;
        extendTotalVec = extendedTotal(true(size(extendedTotal,1),size(extendedTotal,2)));
        height = size(extendedTotal,1);
        
        % NOTE: BASED ON ASSUMPTION THAT NO POINT IN TOTAL IS EXACTLY 0, IE. THE MEAN
    
        % directly linearize:
        px = (dist + vecs(:,1) + coordinates(1,:) - 1)*height;
        py = vecs(:,2) + coordinates(2,:);
        linIndex = px + py;
    
    
        % extended expression selected - extracts expression from extended grid
        extExpSel = extendTotalVec(linIndex);

        % SPECIAL CASE WHEN DIST = 0 -- MATLAB REDUCED THE DIMENSIONS!
        
        % now correlation calculation
        if dist == 0
            corrs = extExpSel.' * totalVec;
            corrs = corrs / length(totalVec);
    
            output(1,1) = corrs;
        else
            row_counts = sum(extExpSel ~= 0, 2); % count of within-bound points per ROW
            row_corrs = extExpSel * totalVec;    % matrix multiplication
            
            % folding it onto itself, aligned by vecs structure
            combined_counts = row_counts(1:length(row_counts)/2+1);
            combined_counts(2:length(combined_counts)-1) = combined_counts(2:length(combined_counts)-1) + row_counts(length(row_counts)/2+2:length(row_counts));
            
            combined_corrs_intermediate = row_corrs(1:length(row_counts)/2+1);
            combined_corrs_intermediate(2:length(combined_corrs_intermediate)-1) = combined_corrs_intermediate(2:length(combined_corrs_intermediate)-1) + row_corrs(length(row_corrs)/2+2:length(row_corrs));
            
            % final correlation, aligned by vecs
            corrs = combined_corrs_intermediate ./ combined_counts;
    
            for i = 1:length(corrs)
                row = vecs(i, 2);   % row is y value
                col = vecs(i, 1);   % col is x value
    
                output(row+1, col+1) = corrs(i);       % add 1 because zero is a valid number.
            end
            
        end
    
    end

    result = output;

end


% original 1D correlation function
function final_result = sweep(grid, maxDist, dist_vecs)

    % standardize the grid
    mean_exp = mean(grid, 'all');
    sd_exp = sqrt(var(grid, 1, 'all'));
    grid = (grid-mean_exp) / sd_exp;
    
    
    coordX = repmat(1:size(grid,2), size(grid,1),1);
    coordY = repmat(1:size(grid,1), size(grid,2),1)';
    logVec = true(size(grid,1), size(grid,2));
    totalVec = grid(logVec);
    coordX = coordX(logVec);
    coordY = coordY(logVec);
    coordinates = [coordX coordY].';
    
    clear mean_exp sd_exp logVec;
    
    
    % CALCULATION FOR EACH DISTANCE 
    result = [];
    
    for dist = 0:maxDist
    
        disp(dist);
        vecs = dist_vecs{dist+1};   % get the vectors for this distance
    
        % out of bounds points are zero. There are 3 such out-of-bounds regions
        % the left margin, right margin, and bottom margin (the semicircle is a
        % bottom half of a circle)
        % we create margins that are the size of "dist"
        extendedTotal = zeros(size(grid,1)+dist, size(grid,2)+2*dist);
        extendedTotal(1:size(grid,1), (dist+1):(size(grid,2)+dist)) = grid;
        extendTotalVec = extendedTotal(true(size(extendedTotal,1),size(extendedTotal,2)));
        height = size(extendedTotal,1);
        
        % NOTE: BASED ON ASSUMPTION THAT NO POINT IN TOTAL IS EXACTLY 0, 
        % IE. THE MEAN
    
        % directly linearize:
        px = (dist + vecs(:,1) + coordinates(1,:) - 1)*height;
        py = vecs(:,2) + coordinates(2,:);
        linIndex = px + py;
    
    
        % extended expression selected - extracts expression from extended grid
        extExpSel = extendTotalVec(linIndex);
        % SPECIAL CASE WHEN DIST = 0 -- MATLAB REDUCED THE DIMENSIONS!
        
        % now correlation calculation
        disp("correlation calculation")
        if dist == 0
            corrs = extExpSel.' * totalVec;
            result = [result; (corrs / length(totalVec))];
        else
            count = sum(extExpSel ~= 0, 'all'); % count of within-bound points
            corrs = sum(extExpSel * totalVec, 'all'); 
                % matrix multiplication
                % then sum up all the rows in the single column
            result = [result; (corrs/count)];
        end
    
    end
    
    final_result = result;

end


% function for cropping data
function grid = cropData(originalGrid, top, bottom, left, right)

    tempGrid = zeros(bottom-top+1, right-left+1);
    tempGrid(1:(bottom-top+1), 1:(right-left+1)) = originalGrid(top:bottom, left:right);
    grid = tempGrid;

end


% function to find gene expression map for 8um data, given a set of genes
% highly vectorized, but can be made better still
function result = geneSet_eight(names, features, barcodes, matrix)

    indices = find(ismember(features,names));

    rows_of_mat = find(ismember(matrix(:,1), indices));
    gene_data = zeros(850,850);
    
    for i = 1:length(rows_of_mat)
        coordinate = matrix(rows_of_mat(i),2);
        gene_data(barcodes(coordinate,1)+1, barcodes(coordinate,2)+1) = ...
            matrix(rows_of_mat(i), 3)...
            + gene_data(barcodes(coordinate,1)+1, barcodes(coordinate,2)+1);
    end

    result = gene_data;
end


% NORMALIZATION FUNCTION 8UM
% denominator is what we normalize to
function normalizedGrid = normalizationFunction_eight(numerator, denominator)
    grid1 = numerator;    
    grid2 = denominator;    
    result_grid = zeros(850,850);
    logical = grid2~=0;
    
    result_grid(logical) = grid1(logical) ./ grid2(logical);
        % prevents division by zero
        % leaves points without grid2 expression as zero, 
        %   even if grid1 has expression

    normalizedGrid = result_grid;

end

% for heatmap display
function void = heatmapFunction(data, name)
    % data is object, name is string

    if isequal( class(data), 'cell' )
        
        for i = 1:length(data)
            heatmapFunction(data{i}, name(i));
        end

    else
        figure();
    
        % code
        gene_map = heatmap(data, 'CellLabelColor','none');
        gene_map.Title = name;
        gene_map.XLabel = 'x';
        gene_map.YLabel = 'y';

        % Ax = gca;
        % Ax.XDisplayLabels = nan(size(Ax.XDisplayData));
        % Ax.YDisplayLabels = nan(size(Ax.YDisplayData));
        
        gene_map.GridVisible = 'off';  
        gene_map.CellLabelColor = 'none';
        gene_map.Colormap = turbo;
            % parula turbo
            % turbo best
        
        disp(gene_map)
    
        void = 1;

    end

end

