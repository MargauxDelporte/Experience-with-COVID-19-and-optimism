libname co 'C:\Users\u0118563\OneDrive - KU Leuven\Projecten\Corona Vera Hoorens\Paper 4\data';
libname r 'C:\Users\u0118563\OneDrive - KU Leuven\Projecten\Corona Vera Hoorens\Paper 4\results';

**data manipulation**;
data control;
set co.imputed_noco;
if(W1_exp_pers=5)then W1_exp_pers=4;
if(W2_exp_pers=5)then W2_exp_pers=4;
if(W3_exp_pers=5)then W3_exp_pers=4;
if(W4_exp_pers=5)then W4_exp_pers=4;
if(W5_exp_pers=5)then W5_exp_pers=4;
if W1_exp_pers=1 then exp_start=0;
if W1_exp_pers>1 then exp_start=1;
run;
data control;
set control;
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

data control;
set control;
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

Control_Infection_P=W1_Control_Infection;
Control_Neg_p=W1_Control_Outcome_Neg;
Control_Pos_p=W1_Control_Outcome_Pos;

Control_Infection_P2=.;
Control_Neg_p2=.;
Control_Pos_p2=.;

Control_Infection_P3=.;
Control_Neg_p3=.;
Control_Pos_p3=.;

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

Control_Infection_P=W2_Control_Infection;
Control_Neg_p=W2_Control_Outcome_Neg;
Control_Pos_p=W2_Control_Outcome_Pos;

Control_Infection_P2=W1_Control_Infection;
Control_Neg_p2=W1_Control_Outcome_Neg;
Control_Pos_p2=W1_Control_Outcome_Pos;

Control_Infection_P3=.;
Control_Neg_p3=.;
Control_Pos_p3=.;

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

Control_Infection_P=W3_Control_Infection;
Control_Neg_p=W3_Control_Outcome_Neg;
Control_Pos_p=W3_Control_Outcome_Pos;

Control_Infection_P2=W2_Control_Infection;
Control_Neg_p2=W2_Control_Outcome_Neg;
Control_Pos_p2=W2_Control_Outcome_Pos;

Control_Infection_P3=W1_Control_Infection;
Control_Neg_p3=W1_Control_Outcome_Neg;
Control_Pos_p3=W1_Control_Outcome_Pos;


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

Control_Infection_P=W4_Control_Infection;
Control_Neg_p=W4_Control_Outcome_Neg;
Control_Pos_p=W4_Control_Outcome_Pos;

Control_Infection_P2=W3_Control_Infection;
Control_Neg_p2=W3_Control_Outcome_Neg;
Control_Pos_p2=W3_Control_Outcome_Pos;

Control_Infection_P3=W2_Control_Infection;
Control_Neg_p3=W2_Control_Outcome_Neg;
Control_Pos_p3=W2_Control_Outcome_Pos;

output;
drop 
W1_risk W2_risk W3_risk W4_risk W5_risk
W1_CO_Infection W2_CO_Infection W3_CO_Infection W4_CO_Infection W5_CO_Infection
increase_W2 increase_W3 increase_W4 increase_W5
size_increase_W1 size_increase_W2 size_increase_W3 size_increase_W4 size_increase_W5;
run;

proc sort data=control;
by _imputation_;run;


%macro analysis(yvar=,xvar=);
proc mixed data=control  maxiter=1000 maxfunc=5000 NOCLPRINT NOCLPRINT;
class wave surveyid time_since_exp(ref='0')
W1_Education(ref='1.00') W1_Age_group(ref='4.00')
W1_Gender(ref='2.00') W1_Household(ref='2.00') risk(ref='1') 
W1_Urbanization(ref='4.00') w1_gewest(ref='Vlaanderen') exp_start(ref='0');
model &yvar= time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start &xvar/solution covb;
repeated wave/subject=surveyid type=un;
ods output solutionf=r.fixed covb=r.covarpm1;
by _imputation_;
run; 
proc mianalyze parms=r.fixed;
class time_since_exp ;
modeleffects intercept
time_since_exp &xvar;
ods output ParameterEstimates=r.combined;
run;
%mend analysis;


%analysis(yvar=self_infection,xvar=control_infection_p)
%analysis(yvar=self_Outcome_Pos,xvar=Control_Pos_p)

%analysis(yvar=self_infection,xvar=control_infection_p2)
%analysis(yvar=self_Outcome_Pos,xvar=Control_Pos_p2)

%analysis(yvar=self_infection,xvar=control_infection_p3)
%analysis(yvar=self_Outcome_Pos,xvar=Control_Pos_p3)


proc mixed data=control  maxiter=1000 maxfunc=5000 NOCLPRINT NOCLPRINT;
parms 
(477.46) 
(222.44 )
(471.06 )
(182.84 )
(207.70 )
(463.09 )
(177.87 )
(192.73 )
(208.08 )
(477.27 );
class wave surveyid time_since_exp(ref='0')
W1_Education(ref='1.00') W1_Age_group(ref='4.00')
W1_Gender(ref='2.00') W1_Household(ref='2.00') risk(ref='1') 
W1_Urbanization(ref='4.00') w1_gewest(ref='Vlaanderen') exp_start(ref='0');
model self_outcome_pos= time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start control_pos_p/solution covb;
repeated wave/subject=surveyid type=un;
ods output solutionf=r.fixed covb=r.covarpm1;
by _imputation_;
run; 
proc mianalyze parms=r.fixed;
class time_since_exp ;
modeleffects intercept
time_since_exp control_pos_p;
ods output ParameterEstimates=r.combined;
run;


proc mixed data=control  maxiter=1000 maxfunc=5000 NOCLPRINT NOCLPRINT;
parms 
(465.14) 
(209.06) 
(447.73) 
(183.48) 
(197.29) 
(463.27) 
;
class wave surveyid time_since_exp(ref='0')
W1_Education(ref='1.00') W1_Age_group(ref='4.00')
W1_Gender(ref='2.00') W1_Household(ref='2.00') risk(ref='1') 
W1_Urbanization(ref='4.00') w1_gewest(ref='Vlaanderen') exp_start(ref='0');
model self_outcome_pos= time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start control_pos_p2/solution covb;
repeated wave/subject=surveyid type=un;
ods output solutionf=r.fixed covb=r.covarpm1;
by _imputation_;
run; 
proc mianalyze parms=r.fixed;
class time_since_exp ;
modeleffects intercept
time_since_exp control_pos_p2;
ods output ParameterEstimates=r.combined;
run;

proc mixed data=control  maxiter=1000 maxfunc=5000 NOCLPRINT NOCLPRINT;
parms 
(183.48) 
(197.29) 
(463.27) 
;
class wave surveyid time_since_exp(ref='0')
W1_Education(ref='1.00') W1_Age_group(ref='4.00')
W1_Gender(ref='2.00') W1_Household(ref='2.00') risk(ref='1') 
W1_Urbanization(ref='4.00') w1_gewest(ref='Vlaanderen') exp_start(ref='0');
model self_outcome_pos= time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start control_pos_p3/solution covb;
repeated wave/subject=surveyid type=un;
ods output solutionf=r.fixed covb=r.covarpm1;
by _imputation_;
run; 
proc mianalyze parms=r.fixed;
class time_since_exp ;
modeleffects intercept
time_since_exp control_pos_p3;
ods output ParameterEstimates=r.combined;
run;


proc mixed data=control  maxiter=1000 maxfunc=5000 NOCLPRINT NOCLPRINT;
parms 
(444.84) 
(247.67) 
(474.14) 
(235.90) 
(255.40) 
(457.08);
class wave surveyid time_since_exp(ref='0')
W1_Education(ref='1.00') W1_Age_group(ref='4.00')
W1_Gender(ref='2.00') W1_Household(ref='2.00') risk(ref='1') 
W1_Urbanization(ref='4.00') w1_gewest(ref='Vlaanderen') exp_start(ref='0');
model self_infection= time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start control_infection_p2/solution covb;
repeated wave/subject=surveyid type=un;
ods output solutionf=r.fixed covb=r.covarpm1;
by _imputation_;
run; 
proc mianalyze parms=r.fixed;
class time_since_exp ;
modeleffects intercept
time_since_exp control_infection_p2;
ods output ParameterEstimates=r.combined;
run;

proc mixed data=control  maxiter=1000 maxfunc=5000 NOCLPRINT NOCLPRINT;
parms 
(235.90) 
(255.40) 
(457.08);
class wave surveyid time_since_exp(ref='0')
W1_Education(ref='1.00') W1_Age_group(ref='4.00')
W1_Gender(ref='2.00') W1_Household(ref='2.00') risk(ref='1') 
W1_Urbanization(ref='4.00') w1_gewest(ref='Vlaanderen') exp_start(ref='0');
model self_infection= time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start control_infection_p3/solution covb;
repeated wave/subject=surveyid type=un;
ods output solutionf=r.fixed covb=r.covarpm1;
by _imputation_;
run; 
proc mianalyze parms=r.fixed;
class time_since_exp ;
modeleffects intercept
time_since_exp control_infection_p3;
ods output ParameterEstimates=r.combined;
run;
