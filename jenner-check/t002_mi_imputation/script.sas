/* ==== adapted from "Data manipulation and imputation" (repo root) ====
 * Original imputes a 5-wave (W1..W5) panel read from libname co (co.final,
 * an external SPSS/SAS-Studio path not shipped in the repo). This bundle
 * keeps the wave-1 slice of the same PROC MI structure -- the CLASS list,
 * the FCS DISCRIM/REG method split between categorical and continuous
 * optimism/control items, and the VAR list -- against a small mock sample
 * with realistic missingness, instead of the full 5-wave co.final. */

data final;
  input SurveyID W1_risk W1_gewest $ W1_Gender W1_Age_group W1_Education W1_Household
        W1_Control_Infection W1_Control_Outcome_Neg W1_Control_Outcome_pos
        W1_Self_Infection W1_self_Outcome_Neg W1_self_Outcome_pos
        W1_other_Infection W1_other_Outcome_Neg W1_other_Outcome_pos;
  datalines;
1 2 Wallonie . 1 1 . . 1.54 . 2.34 6.69 3.38 1.28 . 1.71
2 3 Brussel 1 1 3 3 5.66 6.54 2.49 . 2.8 3.06 . 4.07 3.05
3 . Brussel 1 3 2 3 . 2.62 1.39 2.86 5.09 5.3 3.08 3.13 3.96
4 . Vlaanderen 2 . 2 2 5.92 2.67 3.15 6.75 2.06 2.4 4.53 1.02 3.22
5 1 Brussel 1 4 . 3 2.14 . . 4.4 6.69 1.42 3.26 6.73 .
6 2 Wallonie 2 . 3 2 5.15 2.23 3.17 6.48 2.79 1.55 4.11 3.13 4.25
7 3 Vlaanderen 1 2 2 1 5.74 2.16 3.07 5.34 . 1.61 3.03 6.91 1.01
8 2 Vlaanderen 1 2 1 3 5.8 3.38 6.68 . 1.91 . 5.96 4.94 .
9 1 Brussel 1 2 1 . 2.28 5.58 4.27 1.37 6.39 5.89 5.96 1.78 4.06
10 1 Vlaanderen . 1 2 3 . 4.36 2.66 4.05 5.56 3.66 4.03 5.16 4.2
11 1 Wallonie 1 2 2 1 3.57 . 5.66 4.86 . 3.81 1.56 1.98 2.34
12 3 Wallonie 1 1 1 2 1.11 4.74 1.39 5.73 1.63 1.24 . 3.53 5.91
13 1 Brussel 2 1 3 1 . 2.56 2.33 . 6.97 6.49 1.26 6.63 2.57
14 2 Brussel 1 2 1 . 5.4 2.14 . 5.91 3.97 3.36 5.13 3.06 5.24
;
run;

proc mi data=final out=imputed_noco nimpute=5 seed=123;
class
W1_risk
W1_gewest
W1_Gender
W1_Age_group
W1_Education
W1_Household
;
fcs discrim(
W1_risk
W1_gewest
W1_Gender
W1_Age_group
W1_Education
W1_Household
/CLASSEFFECTS=INCLUDE);
fcs reg(
W1_Control_Infection
W1_Control_Outcome_Neg
W1_Control_Outcome_pos
W1_Self_Infection
W1_self_Outcome_Neg
W1_self_Outcome_pos
W1_other_Infection
W1_other_Outcome_Neg
W1_other_Outcome_pos);
var
W1_risk
W1_gewest
W1_Gender
W1_Age_group
W1_Education
W1_Household
W1_Control_Infection
W1_Control_Outcome_Neg
W1_Control_Outcome_pos
W1_Self_Infection
W1_self_Outcome_Neg
W1_self_Outcome_pos
W1_other_Infection
W1_other_Outcome_Neg
W1_other_Outcome_pos;
run;

proc print data=imputed_noco (obs=11);run;
