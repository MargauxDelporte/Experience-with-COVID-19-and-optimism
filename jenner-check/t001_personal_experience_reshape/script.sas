data imputed_noco;
  input SurveyID _Imputation_ W1_Education $ W1_Age_group $ W1_Gender W1_Household W1_Urbanization $ W1_gewest $
        W1_exp_pers W2_exp_pers W3_exp_pers W4_exp_pers W5_exp_pers
        W1_exp_vic W2_exp_vic W3_exp_vic W4_exp_vic W5_exp_vic
        W1_risk W1_Self_Infection W1_Self_Outcome_neg W1_Self_Outcome_pos W1_Other_Infection W1_Other_Outcome_neg W1_Other_Outcome_pos W1_Control_Infection W1_Control_Outcome_Neg W1_Control_Outcome_Pos
        W2_risk W2_Self_Infection W2_Self_Outcome_neg W2_Self_Outcome_pos W2_Other_Infection W2_Other_Outcome_neg W2_Other_Outcome_pos W2_Control_Infection W2_Control_Outcome_Neg W2_Control_Outcome_Pos
        W3_risk W3_Self_Infection W3_Self_Outcome_neg W3_Self_Outcome_pos W3_Other_Infection W3_Other_Outcome_neg W3_Other_Outcome_pos W3_Control_Infection W3_Control_Outcome_Neg W3_Control_Outcome_Pos
        W4_risk W4_Self_Infection W4_Self_Outcome_neg W4_Self_Outcome_pos W4_Other_Infection W4_Other_Outcome_neg W4_Other_Outcome_pos W4_Control_Infection W4_Control_Outcome_Neg W4_Control_Outcome_Pos
        W5_risk W5_Self_Infection W5_Self_Outcome_neg W5_Self_Outcome_pos W5_Other_Infection W5_Other_Outcome_neg W5_Other_Outcome_pos W5_Control_Infection W5_Control_Outcome_Neg W5_Control_Outcome_Pos
  ;
  datalines;
1 1 3.00 1.00 1 3 3.00 Vlaanderen 1 1 1 1 2 1 1 2 3 3 3 5.21 3.52 3.7 2.67 6.22 5.55 1.96 3.54 2.67 1 6.74 3.02 1.56 1.58 6.08 4.62 5.84 5.38 4.22 2 1.47 2.76 4.77 6.31 3.17 2.15 1.42 4.97 5.64 1 6.13 6.2 3.28 3.72 6.0 1.98 3.13 5.02 5.21 3 4.89 4.65 2.03 5.37 1.98 3.28 6.94 4.84 4.34
2 1 3.00 3.00 1 1 1.00 Wallonie 2 3 3 4 4 2 2 2 2 2 3 4.37 2.58 4.51 6.39 3.4 2.32 6.99 4.06 1.55 1 6.17 1.92 1.96 5.08 4.58 3.31 4.58 3.81 2.51 3 6.16 1.07 5.32 5.09 4.22 2.6 4.85 1.67 3.61 2 1.02 5.33 5.32 6.83 5.57 4.05 1.64 4.75 6.05 3 4.65 1.92 5.58 4.24 5.67 4.18 1.0 2.94 1.12
3 1 2.00 3.00 1 1 2.00 Brussel 1 1 1 2 2 1 1 1 1 2 1 6.57 5.53 5.14 5.28 3.39 5.03 3.24 6.4 3.71 1 2.35 3.03 4.53 2.38 2.32 1.43 4.79 2.37 6.43 2 1.43 2.43 5.01 2.29 1.79 6.61 4.43 3.84 5.71 2 2.14 1.58 3.59 3.54 3.8 5.37 5.04 6.9 1.59 2 5.37 5.8 1.66 2.15 4.22 1.84 2.1 3.78 6.25
4 1 1.00 4.00 1 1 1.00 Vlaanderen 1 1 1 2 2 1 1 1 2 2 3 6.74 6.97 4.33 5.31 1.93 2.78 6.81 4.48 4.25 3 2.88 1.3 3.86 6.52 4.19 1.34 4.05 6.11 1.41 1 5.05 2.41 1.72 6.34 2.48 4.57 4.72 3.52 4.5 3 2.9 2.56 5.02 2.89 2.59 1.79 4.87 3.74 6.57 1 1.06 4.73 4.38 1.6 4.23 4.04 1.79 3.09 1.41
5 1 1.00 3.00 2 1 4.00 Brussel 2 2 2 2 2 1 1 2 3 3 1 5.31 2.22 4.81 2.58 3.93 6.43 6.08 1.55 3.54 2 1.26 3.0 1.78 6.88 1.97 3.65 5.23 4.37 1.67 3 6.42 4.27 6.01 4.5 1.89 1.76 2.85 6.39 5.78 1 6.39 2.26 2.5 1.62 5.68 6.3 3.44 4.72 1.93 1 6.19 6.86 5.86 6.29 1.15 5.42 2.99 6.58 5.81
6 1 3.00 2.00 2 1 1.00 Wallonie 1 2 2 2 3 2 2 2 3 4 2 3.11 4.06 5.08 6.06 2.99 1.17 6.26 2.57 4.48 2 1.23 4.58 3.07 5.72 3.62 6.91 1.69 6.4 2.14 1 5.25 1.01 6.55 4.23 5.32 5.45 5.02 3.19 1.42 3 6.52 4.74 4.98 1.75 6.4 4.04 5.0 2.96 5.18 3 1.76 3.52 6.64 5.06 6.42 4.69 2.81 4.29 1.0
7 1 2.00 2.00 2 3 3.00 Wallonie 2 2 2 2 3 2 2 2 2 2 1 5.04 2.35 2.19 1.15 2.47 3.85 6.1 1.44 3.49 3 4.45 5.31 3.3 3.4 1.89 5.13 6.36 6.16 6.31 2 2.31 5.82 5.18 3.79 4.34 6.5 1.73 1.8 3.79 3 6.93 4.57 6.7 6.35 4.68 5.32 4.03 5.98 4.29 1 5.46 3.85 2.56 2.48 4.83 5.59 4.13 4.76 2.65
8 1 1.00 3.00 1 2 3.00 Wallonie 1 2 3 3 3 1 1 2 2 3 3 6.68 1.12 6.28 4.45 3.86 6.66 2.79 3.34 6.35 2 4.23 5.41 5.8 6.39 3.93 2.64 3.91 3.33 5.01 2 5.35 6.04 6.52 6.88 4.2 6.44 4.55 4.98 1.5 2 1.81 3.77 1.3 3.27 2.27 2.96 5.57 3.27 5.51 2 2.51 1.49 1.12 4.24 7.0 3.1 4.9 5.69 4.91
9 1 1.00 2.00 1 1 2.00 Vlaanderen 1 1 2 2 2 2 2 2 3 3 2 1.65 1.15 2.87 5.06 6.75 3.38 5.29 1.46 5.14 3 2.46 5.18 2.81 5.11 5.83 5.78 4.4 1.25 4.2 3 3.22 4.04 3.05 6.1 5.93 1.63 6.76 4.81 5.97 3 1.92 2.06 4.13 4.9 4.7 6.52 5.65 3.79 5.95 3 2.61 6.11 5.98 1.52 6.29 2.46 3.79 4.66 3.27
10 1 1.00 4.00 2 1 4.00 Vlaanderen 2 2 2 3 4 2 2 3 3 3 3 3.86 5.27 3.69 1.1 2.77 3.43 2.46 4.98 3.21 3 4.19 3.55 5.48 2.98 5.22 2.63 2.51 1.72 2.16 1 5.46 6.71 5.14 2.15 5.43 2.66 4.54 5.56 4.58 1 6.0 2.78 3.17 2.81 5.25 1.76 1.27 1.33 2.75 1 4.83 5.52 1.62 1.07 2.71 3.87 3.04 6.79 2.51
11 1 2.00 1.00 1 2 4.00 Vlaanderen 1 2 2 3 3 1 1 1 1 1 2 6.45 2.78 4.53 3.57 4.41 1.36 6.76 1.6 5.58 3 2.27 4.96 1.94 2.04 1.45 1.02 3.7 4.56 2.75 1 2.73 2.7 6.16 1.43 2.4 2.59 5.75 4.54 5.82 1 3.55 4.27 4.89 6.45 5.96 1.43 2.0 2.85 5.49 3 6.53 3.63 3.81 2.82 3.42 2.63 4.24 3.63 4.59
12 1 2.00 3.00 2 1 1.00 Vlaanderen 1 1 2 2 2 2 2 2 3 3 2 3.09 3.0 5.02 6.15 2.98 5.16 2.73 6.67 5.88 3 1.22 1.53 2.51 1.7 5.64 6.19 5.95 1.01 6.22 2 3.48 2.13 3.17 5.54 4.75 5.56 2.22 4.3 6.57 2 6.29 3.91 1.17 4.78 5.8 5.26 2.86 1.08 3.45 1 6.95 6.48 3.77 1.7 5.99 3.99 5.3 4.05 2.64
1 2 2.00 4.00 1 2 2.00 Wallonie 1 1 1 1 1 1 2 2 2 3 3 3.94 1.89 4.23 3.07 4.31 4.26 3.73 2.93 2.13 3 2.43 3.3 6.14 3.46 2.91 3.84 6.48 3.29 6.93 3 6.88 3.97 1.22 4.01 4.54 6.22 6.25 3.64 4.16 2 1.09 1.86 6.23 6.82 1.45 5.69 2.59 4.74 3.38 1 6.11 6.11 6.16 3.28 2.9 5.31 5.56 6.23 1.22
2 2 1.00 2.00 2 1 1.00 Wallonie 1 1 1 1 1 1 1 2 3 4 1 2.02 1.47 6.23 4.72 2.44 6.48 1.86 3.77 2.52 2 5.0 6.39 3.79 2.73 4.28 1.44 6.67 6.93 2.79 2 5.14 3.74 2.81 7.0 6.12 1.64 3.29 3.15 2.78 3 2.77 6.87 4.95 2.65 4.4 5.11 5.47 1.29 4.64 2 6.0 6.42 5.65 2.38 5.81 2.31 2.14 2.5 5.53
3 2 3.00 2.00 1 3 1.00 Wallonie 2 2 3 3 4 1 1 2 3 3 2 5.98 2.54 5.95 3.89 5.84 5.48 3.03 1.69 6.78 1 5.52 2.35 5.06 5.05 3.38 6.07 4.34 1.54 3.37 2 4.22 3.73 5.04 5.03 4.51 5.93 6.64 1.65 2.4 1 4.72 6.66 2.97 4.66 4.89 4.81 3.79 5.21 4.9 1 1.84 6.68 2.83 3.96 1.58 6.32 1.81 3.72 5.02
4 2 3.00 4.00 1 2 1.00 Wallonie 2 3 3 3 3 2 2 2 3 3 2 2.66 6.81 6.69 5.95 1.55 2.27 4.84 6.83 1.3 2 2.46 1.76 4.39 1.41 5.59 2.24 2.3 6.22 2.97 1 5.73 4.58 2.66 6.9 6.93 4.24 5.79 1.66 6.2 1 1.09 5.74 2.43 2.94 2.05 1.31 5.45 4.16 5.47 2 3.69 3.17 4.56 3.71 2.33 4.69 5.36 6.45 4.95
5 2 2.00 4.00 1 1 4.00 Wallonie 2 2 3 3 4 1 1 2 3 3 3 4.18 3.72 4.63 1.6 5.21 6.12 4.91 5.61 5.33 1 3.58 6.33 3.48 5.96 3.39 5.38 2.88 2.88 2.53 1 5.12 3.85 1.55 1.51 3.59 5.47 3.24 1.78 1.36 3 4.37 5.02 3.46 6.24 6.65 3.54 6.5 1.31 2.73 2 3.11 4.47 2.28 4.94 2.35 1.65 6.07 3.21 5.58
6 2 3.00 2.00 2 3 1.00 Brussel 2 3 3 4 4 1 1 1 1 1 1 1.55 4.18 3.26 3.72 1.94 2.87 2.95 6.65 4.58 1 1.93 5.53 1.3 1.49 3.66 3.54 4.64 3.49 2.29 3 1.68 3.58 2.7 5.07 3.92 5.0 1.27 3.37 4.6 1 2.23 6.67 5.6 5.58 2.74 1.72 3.98 3.58 1.78 3 5.22 4.0 6.0 5.84 1.43 6.17 1.25 1.11 6.53
7 2 2.00 4.00 2 3 4.00 Wallonie 1 2 2 2 3 2 2 2 2 2 3 1.47 6.22 5.47 2.33 5.67 1.46 4.8 4.18 2.16 2 3.11 6.75 4.87 1.89 1.62 2.54 2.04 1.92 5.55 1 2.06 5.64 3.96 5.53 5.56 3.69 6.54 4.39 4.81 3 2.94 6.83 2.9 3.64 3.81 4.79 5.78 4.55 3.11 1 2.86 3.71 1.34 5.99 1.46 6.19 6.13 4.69 4.04
8 2 2.00 1.00 2 3 2.00 Wallonie 2 2 2 2 2 1 1 1 2 3 3 4.14 1.95 3.24 2.7 3.45 3.03 4.59 5.74 4.88 1 2.98 4.35 3.32 2.51 6.11 6.79 4.62 1.9 1.49 3 1.85 3.1 6.81 5.19 3.35 4.57 6.63 2.86 3.26 2 5.88 5.02 5.97 5.43 5.11 4.16 4.88 3.54 3.17 2 2.85 6.71 3.05 5.6 2.15 7.0 1.93 2.77 5.73
9 2 3.00 1.00 2 3 2.00 Brussel 2 3 3 4 4 1 1 1 1 1 2 5.51 5.7 2.4 2.44 6.79 5.71 6.42 2.16 5.07 3 6.91 3.77 2.69 3.29 4.16 6.8 5.9 5.81 1.83 2 1.31 3.88 3.23 6.61 5.27 4.1 1.75 1.5 1.96 2 6.43 1.88 3.62 6.68 2.33 3.71 3.1 1.16 1.32 3 3.24 3.32 1.49 2.35 2.91 1.59 5.29 3.01 1.88
10 2 1.00 3.00 2 3 2.00 Brussel 2 2 3 4 4 2 2 3 3 3 1 1.29 3.52 5.76 3.74 1.67 6.43 4.58 1.1 4.09 1 5.31 2.75 1.01 3.12 4.42 2.12 5.01 4.14 3.16 3 4.26 5.72 4.05 1.12 6.24 1.26 3.32 3.24 5.48 2 5.73 3.07 5.4 4.77 5.63 5.41 3.0 1.27 4.28 3 2.05 5.67 3.79 5.17 4.79 5.87 1.38 5.66 3.75
11 2 2.00 2.00 1 1 1.00 Wallonie 2 2 3 4 4 2 2 2 2 2 2 3.62 3.4 3.64 6.74 3.03 2.12 5.15 3.2 5.78 2 5.81 5.36 1.47 4.61 5.93 4.27 2.93 1.48 4.97 2 3.68 5.31 2.0 3.66 3.68 5.36 6.47 4.69 3.61 3 6.88 6.69 1.45 4.83 3.18 5.81 5.08 6.72 1.86 3 5.07 3.63 1.76 2.42 4.87 3.17 6.7 1.19 1.92
12 2 2.00 3.00 2 2 1.00 Brussel 1 1 2 2 2 2 2 3 3 3 2 2.29 4.67 5.16 6.99 2.2 1.81 1.44 2.04 5.28 1 5.86 6.81 6.92 5.01 5.26 4.3 2.74 2.8 1.95 3 6.56 4.83 5.76 4.05 1.73 2.21 1.83 5.74 1.16 3 4.43 3.8 6.9 1.78 6.31 1.39 3.39 5.3 3.87 2 5.61 5.94 1.44 6.83 4.85 3.7 5.08 3.07 6.27
  ;
run;

/* ==== below: adapted from "Personal experience.sas" (repo root) ====
 * Original reads libname co / co.imputed_noco (external multiply-imputed
 * survey panel not shipped in the repo); here it runs against the mock
 * imputed_noco panel built above, which has the same wide W1..W5 column
 * shape the script expects. Logic below is unmodified from the source. */

data imputed_final;
set imputed_noco;
if(W1_exp_pers=5)then W1_exp_pers=4;
if(W2_exp_pers=5)then W2_exp_pers=4;
if(W3_exp_pers=5)then W3_exp_pers=4;
if(W4_exp_pers=5)then W4_exp_pers=4;
if(W5_exp_pers=5)then W5_exp_pers=4;
if W1_exp_pers=1 then exp_start=0;
if W1_exp_pers>1 then exp_start=1;
run;

proc print data=imputed_final (obs=10);
var W1_exp_pers exp_start;
run;

data imputed_final;
set imputed_final;
size_increase_W1=0;
if W1_Exp_Pers<W2_Exp_Pers then do;
increase_W2=1;
size_increase_W2=W2_Exp_Pers-W1_Exp_Pers;
end;
else do;
increase_W2=0; 
size_increase_W2=0;
end;
if W2_Exp_Pers<W3_Exp_Pers then do;
increase_W3=1;
size_increase_W3=W3_Exp_Pers-W2_Exp_Pers;
end;
else do;
increase_W3=0;
size_increase_W3=0;
end;
if W3_Exp_Pers<W4_Exp_Pers then do;
increase_W4=1;
size_increase_W4=W4_Exp_Pers-W3_Exp_Pers;
end;
else do; 
increase_W4=0;
size_increase_W4=0;
end;
if W4_Exp_Pers<W5_Exp_Pers then do;
increase_W5=1;
size_increase_W5=W5_Exp_Pers-W4_Exp_Pers;
end;
else do;
increase_W5=0; 
size_increase_W5=0;
end;
drop W1_Exp_Pers W2_Exp_Pers W3_Exp_Pers W4_Exp_Pers W5_Exp_Pers;
run;

data imputed_final;
set imputed_final;
wave=1;
time_since_exp=0;
size_increase=0;

risk=W1_risk;
Self_Infection=W1_Self_Infection;
Self_Outcome_neg=W1_Self_Outcome_neg;
Self_Outcome_pos=W1_Self_Outcome_pos;
Other_Infection=W1_Other_Infection;
Other_Outcome_neg=W1_Other_Outcome_neg;
Other_Outcome_pos=W1_Other_Outcome_pos;
Control_Infection=W1_Control_Infection;
Control_Outcome_Neg=W1_Control_Outcome_Neg;
Control_Outcome_Pos=W1_Control_Outcome_Pos;
output;
wave=2;
risk=W2_risk;
Self_Infection=W2_Self_Infection;
Self_Outcome_neg=W2_Self_Outcome_neg;
Self_Outcome_pos=W2_Self_Outcome_pos;
Other_Infection=W2_Other_Infection;
Other_Outcome_neg=W2_Other_Outcome_neg;
Other_Outcome_pos=W2_Other_Outcome_pos;
Control_Infection=W2_Control_Infection;
Control_Outcome_Neg=W2_Control_Outcome_Neg;
Control_Outcome_Pos=W2_Control_Outcome_Pos;
if increase_W2=1 then do;
time_since_exp=1;
size_increase=size_increase_W2;
end;
else do; 
time_since_exp=0;
size_increase=0;
end;
output;
wave=3;
if increase_W3=1 then do;
time_since_exp=1;
size_increase=size_increase_W3;
end;
if increase_W2=1 and increase_W3=0 then do;
time_since_exp=2;
size_increase=size_increase_W2;
end;
if increase_W2=0 and increase_W3=0 then do;
time_since_exp=0;
size_increase=0;
end;
risk=W3_risk;
Self_Infection=W3_Self_Infection;
Self_Outcome_neg=W3_Self_Outcome_neg;
Self_Outcome_pos=W3_Self_Outcome_pos;
Other_Infection=W3_Other_Infection;
Other_Outcome_neg=W3_Other_Outcome_neg;
Other_Outcome_pos=W3_Other_Outcome_pos;
Control_Infection=W3_Control_Infection;
Control_Outcome_Neg=W3_Control_Outcome_Neg;
Control_Outcome_Pos=W3_Control_Outcome_Pos;
output;
wave=4;
if increase_W4=1 then do;
time_since_exp=1;
size_increase=size_increase_W4;
end;
if increase_W3=1 and increase_W4=0 then do;
time_since_exp=2;
size_increase=size_increase_W3;
end;
if increase_W2=1 and increase_W3=0 and increase_W4=0 then do;
time_since_exp=3;
size_increase=size_increase_W2;
end;
if increase_W2=0 and increase_W3=0 and increase_W4=0 then do;
time_since_exp=0;
size_increase=0;
end;
risk=W4_risk;
Self_Infection=W4_Self_Infection;
Self_Outcome_neg=W4_Self_Outcome_neg;
Self_Outcome_pos=W4_Self_Outcome_pos;
Other_Infection=W4_Other_Infection;
Other_Outcome_neg=W4_Other_Outcome_neg;
Other_Outcome_pos=W4_Other_Outcome_pos;
Control_Infection=W4_Control_Infection;
Control_Outcome_Neg=W4_Control_Outcome_Neg;
Control_Outcome_Pos=W4_Control_Outcome_Pos;
output;
wave=5;
if increase_W5=1 then do;
time_since_exp=1;
size_increase=size_increase_W5;
end;
if increase_W4=1 and increase_W5=0 then do;
time_since_exp=2;
size_increase=size_increase_W4;
end;
if increase_W3=1 and increase_W4=0 and increase_W5=0 then do;
time_since_exp=3;
size_increase=size_increase_W3;
end;
if increase_W2=1 and increase_W3=0 and increase_W4=0 and increase_W5=0 then do;
time_since_exp=4;
size_increase=size_increase_W2;
end;
if increase_W2=0 and increase_W3=0 and increase_W4=0 and increase_W5=0 then do;
time_since_exp=0;
size_increase=0;
end;
risk=W5_risk;
Self_Infection=W5_Self_Infection;
Self_Outcome_neg=W5_Self_Outcome_neg;
Self_Outcome_pos=W5_Self_Outcome_pos;
Other_Infection=W5_Other_Infection;
Other_Outcome_neg=W5_Other_Outcome_neg;
Other_Outcome_pos=W5_Other_Outcome_pos;
Control_Infection=W5_Control_Infection;
Control_Outcome_Neg=W5_Control_Outcome_Neg;
Control_Outcome_Pos=W5_Control_Outcome_Pos;
output;
drop 
W1_risk W2_risk W3_risk W4_risk W5_risk
increase_W2 increase_W3 increase_W4 increase_W5
size_increase_W2 size_increase_W3 size_increase_W4 size_increase_W5;
run;
data imputed_final;
set imputed_final;
timeclass=wave;
time=wave;
CO_Infection=Self_Infection-Other_infection;
CO_Outcome_Neg=Self_Outcome_Neg-Other_Outcome_Neg;
CO_Outcome_Pos=Self_Outcome_Pos-Other_Outcome_Pos;
run;

proc sort data=imputed_final;
by _imputation_;run;
proc contents data=imputed_final;run;

data imputed_final;
set imputed_final;
keep SurveyID _Imputation_ exp_start W1_gewest risk size_increase time
time_since_exp timeclass wave
CO_Infection CO_Outcome_Neg CO_Outcome_Pos 
Other_Infection Other_Outcome_neg Other_Outcome_pos
Self_Infection Self_Outcome_neg  Self_Outcome_pos
W1_Education W1_Age_group
W1_Gender W1_Household W1_urbanization
Control_Infection
Control_Outcome_Neg
Control_Outcome_Pos;run;

**only experience and demographic variables***;
proc freq data=imputed_final;
tables 
W1_Education W1_Age_group
W1_Gender W1_Household W1_urbanization
risk w1_gewest exp_start;
run;

