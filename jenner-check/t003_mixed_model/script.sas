/* ==== adapted from "Personal experience.sas" (repo root) ====
 * Original fits this PROC MIXED model against co.imputed_final -- the
 * long-format panel produced by the same script's reshape step, built from
 * the full multiply-imputed 5-wave co.imputed_noco source (not shipped in
 * the repo). This bundle reuses the exact CLASS/MODEL/REPEATED/ODS OUTPUT
 * structure from the source's unconditional model (the one applied
 * directly to co.imputed_final, before the %analysis/%plots macros) against
 * a small mock long-format panel (8 subjects x 2 waves) with the same
 * variable names and the same reference levels (W1_Education ref='1.00',
 * W1_Age_group ref='4.00', W1_Gender ref='2.00', W1_Household ref='2.00',
 * W1_Urbanization ref='4.00', risk ref='1', w1_gewest ref='Vlaanderen',
 * exp_start ref='0'). &var is bound to co_infection here since the source
 * leaves it as an unresolved macro variable at this point in the script. */

data imputed_final;
  input surveyid wave time_since_exp W1_Education $ W1_Age_group $ W1_Gender $
        W1_Household $ W1_Urbanization $ risk w1_gewest $ exp_start co_infection;
  datalines;
1 1 0 2.00 4.00 2.00 3.00 2.00 3 Vlaanderen 1 0.81
1 2 1 2.00 4.00 2.00 3.00 2.00 3 Vlaanderen 1 0.21
2 1 0 2.00 2.00 1.00 3.00 1.00 2 Brussel 1 0.74
2 2 1 2.00 2.00 1.00 3.00 1.00 2 Brussel 1 0.38
3 1 0 1.00 1.00 1.00 1.00 2.00 3 Vlaanderen 0 0.94
3 2 0 1.00 1.00 1.00 1.00 2.00 3 Vlaanderen 0 1.2
4 1 0 1.00 2.00 2.00 2.00 1.00 1 Brussel 1 0.53
4 2 1 1.00 2.00 2.00 2.00 1.00 1 Brussel 1 0.77
5 1 0 1.00 3.00 2.00 1.00 3.00 1 Vlaanderen 0 -0.05
5 2 0 1.00 3.00 2.00 1.00 3.00 1 Vlaanderen 0 -0.51
6 1 0 1.00 1.00 1.00 1.00 1.00 2 Wallonie 1 -0.25
6 2 1 1.00 1.00 1.00 1.00 1.00 2 Wallonie 1 -0.52
7 1 0 3.00 3.00 2.00 1.00 3.00 1 Wallonie 1 0.65
7 2 1 3.00 3.00 2.00 1.00 3.00 1 Wallonie 1 0.88
8 1 0 1.00 1.00 1.00 2.00 4.00 3 Vlaanderen 0 -0.52
8 2 0 1.00 1.00 1.00 2.00 4.00 3 Vlaanderen 0 0.02
;
run;

%let var=co_infection;

proc mixed data=imputed_final maxiter=1000 maxfunc=5000 NOCLPRINT;
class wave surveyid time_since_exp(ref='0')
W1_Education(ref='1.00') W1_Age_group(ref='4.00')
W1_Gender(ref='2.00') W1_Household(ref='2.00')
W1_Urbanization(ref='4.00') risk(ref='1') w1_gewest(ref='Vlaanderen') exp_start(ref='0');
model &var= time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start/solution covb;
repeated wave/subject=surveyid type=un;
ods output solutionf=fixed covb=covarpm1;
run;

proc print data=fixed;run;
