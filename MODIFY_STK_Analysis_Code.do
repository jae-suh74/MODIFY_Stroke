
*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*


		* DESCRIPTIVE ANALYSIS - BASELINE CHARACTERISTICS


*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*

* -- 1. Make table1 by "Any stroke" (I60-64) status at baseline (pre-matching)
use "stk_analysis_ready_data.dta", clear

table1_mc, by(EverSTK_STK) percent_n percsign("") nospacelowpercent ///
vars(age contn %9.1f \ age_group cat %9.1f \ Ethnicity_ONS cat %9.1f \ gender_new cat %9.1f \ Unemployed_first cat %9.1f \ ///
phq9_base contn %9.1f \ gad7_base contn %9.1f \ appt_t1_total_WSAS_prorate contn %9.1f \ taking_meds_t1 cat %9.1f \ ltc_case cat %9.1f \ obesity_before cat %9.1f \ diab_before cat %9.1f \ hgc_before cat %9.1f \ htn_before cat %9.1f \ smk_before cat %9.1f \  alc_before cat %9.1f \ hypoth_before cat %9.1f \ hyperth_before cat %9.1f \ /// 
diagnosis_category cat %9.1f \ appt_year cat %9.1f \ reason_end cat %9.1f \ number_sessions contn %9.1f \ weeks_days_ref_ass_w contn %9.1f \ weeks_sec_wait_w contn %9.1f \ imd_quintile cat %9.1f \ EverCCI_HEMP cat %9.1f) ///  
saving("table1.xlsx", sheet("STK_pre_matching") sheetmodify)

* -- 2. Make table1 by "Any stroke" (I60-64) status at baseline (post-matching)
use "stk_analysis_ready_data_psmatch2.dta", clear

table1_mc, by(EverSTK_STK) percent_n percsign("") nospacelowpercent ///
vars(age contn %9.1f \ age_group cat %9.1f \ Ethnicity_ONS cat %9.1f \ gender_new cat %9.1f \ Unemployed_first cat %9.1f \ ///
phq9_base contn %9.1f \ gad7_base contn %9.1f \ appt_t1_total_WSAS_prorate contn %9.1f \ taking_meds_t1 cat %9.1f \ ltc_case cat %9.1f \ obesity_before cat %9.1f \ diab_before cat %9.1f \ hgc_before cat %9.1f \ htn_before cat %9.1f \ smk_before cat %9.1f \  alc_before cat %9.1f \ hypoth_before cat %9.1f \ hyperth_before cat %9.1f \ /// 
diagnosis_category cat %9.1f \ appt_year cat %9.1f \ reason_end cat %9.1f \ number_sessions contn %9.1f \ weeks_days_ref_ass_w contn %9.1f \ weeks_sec_wait_w contn %9.1f \ imd_quintile cat %9.1f) ///  
saving("table1.xlsx", sheet("STK_matched") sheetmodify)

*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*


		* DESCRIPTIVE ANALYSIS - TREATMENT OUTCOMES


*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
use "stk_analysis_ready_data.dta", clear

* -- 1. Treatment outcomes by "Any stroke" (I60-64) status at baseline
table1_mc, by(EverSTK_STK) percent_n percsign("") nospacelowpercent ///
vars(reliable_improve cat %9.1f  \ recovery cat %9.1f \ reliable_recovery cat %9.1f \ deterioration cat %9.1f \ ///
phq9_base contn %9.1f \ phq9_end contn %9.1f \ phq_change contn %9.1f\ gad7_base contn %9.1f \ gad7_end contn %9.1f \ gad_change contn %9.1f\ appt_t1_total_WSAS_prorate contn %9.1f \ wsas_total_change_prorate contn %9.1f \ appt_last_total_WSAS_prorate contn %9.1f) ///  
saving("table2.xlsx", sheet("STK_pre_matching") sheetmodify)

* -- 2. Treatment outcomes by I63 status at baseline
table1_mc, by(EverSTK_I63) percent_n percsign("") nospacelowpercent ///
vars(reliable_improve cat %9.1f  \ recovery cat %9.1f \ reliable_recovery cat %9.1f \ deterioration cat %9.1f \ ///
phq9_base contn %9.1f \ phq9_end contn %9.1f \ phq_change contn %9.1f\ gad7_base contn %9.1f \ gad7_end contn %9.1f \ gad_change contn %9.1f\ appt_t1_total_WSAS_prorate contn %9.1f \ wsas_total_change_prorate contn %9.1f \ appt_last_total_WSAS_prorate contn %9.1f) ///  
saving("table2.xlsx", sheet("I63_pre_matching") sheetmodify)

* -- 3. Treatment outcomes by I61 status at baseline
table1_mc, by(EverSTK_I61) percent_n percsign("") nospacelowpercent ///
vars(reliable_improve cat %9.1f  \ recovery cat %9.1f \ reliable_recovery cat %9.1f \ deterioration cat %9.1f \ ///
phq9_base contn %9.1f \ phq9_end contn %9.1f \ phq_change contn %9.1f\ gad7_base contn %9.1f \ gad7_end contn %9.1f \ gad_change contn %9.1f\ appt_t1_total_WSAS_prorate contn %9.1f \ wsas_total_change_prorate contn %9.1f \ appt_last_total_WSAS_prorate contn %9.1f) ///  
saving("table2.xlsx", sheet("I61_pre_matching") sheetmodify)


*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*


		* MAIN ANALYSIS - TIME SINCE STROKE DIAGNOSIS


*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
use "stk_analysis_ready_data.dta", clear

* Code time since diagnosis
gen years_since_STK = (first_appt_date - FirSTK_STKDateExact)/365.25

recode years_since_STK (min/0.49999 = 1) (0.5/0.9999 = 2) (1/1.9999 = 3) (2/max =4) (.=5), gen(years_since_STK_cat)
tab years_since_STK_cat

* Baseline characteristics table
table1_mc, by(years_since_STK_cat) percent_n percsign("") nospacelowpercent ///
vars(age contn %9.1f \ age_group cat %9.1f \ Ethnicity_ONS cat %9.1f \ gender_new cat %9.1f \ Unemployed_first cat %9.1f \ ///
phq9_base contn %9.1f \ gad7_base contn %9.1f \ appt_t1_total_WSAS_prorate contn %9.1f \ taking_meds_t1 cat %9.1f \ ltc_case cat %9.1f \ obesity_before cat %9.1f \ diab_before cat %9.1f \ hgc_before cat %9.1f \ htn_before cat %9.1f \ smk_before cat %9.1f \  alc_before cat %9.1f \ hypoth_before cat %9.1f \ hyperth_before cat %9.1f \ /// 
diagnosis_category cat %9.1f \ appt_year cat %9.1f \ reason_end cat %9.1f \ number_sessions contn %9.1f \ weeks_days_ref_ass_w contn %9.1f \ weeks_sec_wait_w contn %9.1f \ imd_quintile cat %9.1f) ///  
saving("table1.xlsx", sheet("years_since_STK_cat") sheetmodify)

* Treatment outcomes descriptive table
table1_mc, by(years_since_STK_cat) percent_n percsign("") nospacelowpercent ///
vars(reliable_improve cat %9.1f  \ recovery cat %9.1f \ reliable_recovery cat %9.1f \ deterioration cat %9.1f \ ///
phq9_base contn %9.1f \ phq9_end contn %9.1f \ phq_change contn %9.1f\ gad7_base contn %9.1f \ gad7_end contn %9.1f \ gad_change contn %9.1f\ appt_t1_total_WSAS_prorate contn %9.1f \ wsas_total_change_prorate contn %9.1f \ appt_last_total_WSAS_prorate contn %9.1f) ///  
saving("table2.xlsx", sheet("years_since_STK_cat") sheetmodify)

* Exclude those without a stroke diagnosis
drop if years_since_STK_cat == 5 

* Regression models for primary treatment outcomes
logistic reliable_improve i.years_since_STK_cat

logistic reliable_improve i.years_since_STK_cat i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category 

logistic reliable_improve i.years_since_STK_cat i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category i.EverCCI_HEMP 

logistic reliable_recovery i.years_since_STK_cat

logistic reliable_recovery i.years_since_STK_cat i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category 

logistic reliable_recovery i.years_since_STK_cat i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category i.EverCCI_HEMP


logistic deterioration i.years_since_STK_cat

logistic deterioration i.years_since_STK_cat i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category

logistic deterioration i.years_since_STK_cat i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category i.EverCCI_HEMP 


*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*


		* MAIN ANALYSIS - PROPENSITY SCORE MATCHED SAMPLE


*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
use "stk_analysis_ready_data_psmatch2.dta", clear

* Code CCI according to Royal College of Surgeons definition - minus cerebrovascular disease and hemiplegia ("CCI2")
egen cci_rcs = rowtotal(EverCCI_MI EverCCI_CCF EverCCI_PVD EverCCI_DEM EverCCI_CPD EverCCI_RhD EverCCI_LIV EverCCI_DIAB EverCCI_REN EverCCI_CAN EverCCI_META EverCCI_HIV), missing
replace cci_rcs = 3 if cci_rcs > 3
tab cci_rcs


* -- Model 1
logistic reliable_improve i.EverSTK_STK [fweight=_weight]

logistic reliable_recovery i.EverSTK_STK [fweight=_weight]

logistic deterioration i.EverSTK_STK [fweight=_weight]

regress phq_change i.EverSTK_STK [fweight=_weight]

regress gad_change i.EverSTK_STK [fweight=_weight]

regress wsas_total_change_prorate i.EverSTK_STK [fweight=_weight]

* -- Model 2 
logistic reliable_improve i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category [fweight=_weight]

logistic reliable_recovery i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category [fweight=_weight]

logistic deterioration i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category [fweight=_weight]

regress phq_change i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category [fweight=_weight]

regress gad_change i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category [fweight=_weight]

regress wsas_total_change_prorate i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category [fweight=_weight]

* -- Model 3
logistic reliable_improve i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category i.cci_rcs [fweight=_weight]

logistic reliable_recovery i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category i.cci_rcs [fweight=_weight]

logistic deterioration i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category i.cci_rcs [fweight=_weight]

regress phq_change i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category i.cci_rcs [fweight=_weight]

regress gad_change i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category i.cci_rcs [fweight=_weight]

regress wsas_total_change_prorate i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.imd_quintile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category i.cci_rcs [fweight=_weight]

* -- Model 4
melogit reliable_improve i.EverSTK_STK [fweight=_weight] || use_ccg:, or
estat icc

melogit reliable_recovery i.EverSTK_STK [fweight=_weight] || use_ccg:, or
estat icc

melogit deterioration i.EverSTK_STK [fweight=_weight] || use_ccg:, or
estat icc

mixed phq_change i.EverSTK_STK [fweight=_weight] || use_ccg:
estat icc

mixed gad_change i.EverSTK_STK [fweight=_weight] || use_ccg:
estat icc

mixed wsas_total_change_prorate i.EverSTK_STK [fweight=_weight] || use_ccg:
estat icc

* -- Model 5 
melogit reliable_improve i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.IMD_decile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category   [fweight=_weight] || use_ccg:, or
estat icc

melogit reliable_recovery i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.IMD_decile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category   [fweight=_weight] || use_ccg:, or
estat icc

melogit deterioration i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.IMD_decile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category  [fweight=_weight] || use_ccg:, or
estat icc

mixed phq_change i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.IMD_decile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category   [fweight=_weight] || use_ccg:
estat icc

mixed gad_change i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.IMD_decile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category   [fweight=_weight] || use_ccg:
estat icc

mixed wsas_total_change_prorate i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.IMD_decile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category   [fweight=_weight] || use_ccg:
estat icc

* -- Model 6 
melogit reliable_improve i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.IMD_decile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category i.cci_rcs   [fweight=_weight] || use_ccg:, or
estat icc

melogit reliable_recovery i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.IMD_decile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category i.cci_rcs   [fweight=_weight] || use_ccg:, or
estat icc

melogit deterioration i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.IMD_decile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category i.cci_rcs  [fweight=_weight] || use_ccg:, or
estat icc

mixed phq_change i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.IMD_decile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category i.cci_rcs   [fweight=_weight] || use_ccg:
estat icc

mixed gad_change i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.IMD_decile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category i.cci_rcs   [fweight=_weight] || use_ccg:
estat icc

mixed wsas_total_change_prorate i.EverSTK_STK i.gender_new age i.Ethnicity_ONS i.IMD_decile phq9_base gad7_base i.ltc_case i.appt_year number_sessions i.appt_t1_meds_status weeks_days_ref_ass_w weeks_sec_wait_w  i.diagnosis_category i.cci_rcs   [fweight=_weight] || use_ccg:
estat icc

