libname co 'C:\Users\u0118563\OneDrive - KU Leuven\Projecten\Corona Vera Hoorens\Paper 4\data';
libname r 'C:\Users\u0118563\OneDrive - KU Leuven\Projecten\Corona Vera Hoorens\Paper 4\results';


data vicarious;
set co.imputed_noco;
size_increase_W1=0;
if W1_exp_vic<W2_exp_vic then do;
increase_W2=1;
size_increase_W2=W2_exp_vic-W1_exp_vic;
end;
else do;
increase_W2=0; 
size_increase_W2=0;
end;
if W2_exp_vic<W3_exp_vic then do;
increase_W3=1;
size_increase_W3=W3_exp_vic-W2_exp_vic;
end;
else do;
increase_W3=0;
size_increase_W3=0;
end;
if W3_exp_vic<W4_exp_vic then do;
increase_W4=1;
size_increase_W4=W4_exp_vic-W3_exp_vic;
end;
else do; 
increase_W4=0;
size_increase_W4=0;
end;
if W4_exp_vic<W5_exp_vic then do;
increase_W5=1;
size_increase_W5=W5_exp_vic-W4_exp_vic;
end;
else do;
increase_W5=0; 
size_increase_W5=0;
end;
drop W2_exp_vic W3_exp_vic W4_exp_vic W5_exp_vic;
run;

data vicarious;
set vicarious;
if W1_exp_vic=1 then exp_start=0;
if W1_exp_vic>1 then exp_start=1;
run;

data vicarious;
set vicarious;
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
drop W1_CO_Infection W2_CO_Infection W3_CO_Infection W4_CO_Infection W5_CO_Infection
increase_W2 increase_W3 increase_W4 increase_W5
size_increase_W1 size_increase_W2 size_increase_W3 size_increase_W4 size_increase_W5;
run;

proc print data=vicarious (obs=15);
var wave Control_Infection Control_Infection_p
Control_Infection_P2 Control_Infection_P3;
run;



%macro analysis_v(yvar=,xvar=);
proc mixed data=vicarious  maxiter=1000 maxfunc=5000 NOCLPRINT NOCLPRINT;
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
%mend analysis_v;

%analysis_v(yvar=self_infection,xvar=Control_Infection_p)
%analysis_v(yvar=other_infection,xvar=Control_Infection_p)
%analysis_v(yvar=self_outcome_pos,xvar=Control_pos_p)

%analysis_v(yvar=self_infection,xvar=Control_Infection_p2)
%analysis_v(yvar=other_infection,xvar=Control_Infection_p2)
%analysis_v(yvar=self_outcome_pos,xvar=Control_pos_p2)

%analysis_v(yvar=self_infection,xvar=Control_Infection_p3)
%analysis_v(yvar=other_infection,xvar=Control_Infection_p3)
%analysis_v(yvar=self_outcome_pos,xvar=Control_pos_p3)

proc mixed data=vicarious  maxiter=1000 maxfunc=5000 NOCLPRINT NOCLPRINT;
parms 
(443.25) 
(230.83) 
(455.14) 
(226.93) 
(271.69) 
(489.74) 
(219.15) 
(241.46) 
(265.74) 
(457.34);
class wave surveyid time_since_exp(ref='0')
W1_Education(ref='1.00') W1_Age_group(ref='4.00')
W1_Gender(ref='2.00') W1_Household(ref='2.00') risk(ref='1') 
W1_Urbanization(ref='4.00') w1_gewest(ref='Vlaanderen') exp_start(ref='0');
model self_infection= time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start control_infection_p/solution covb;
repeated wave/subject=surveyid type=un;
ods output solutionf=r.fixed covb=r.covarpm1;
by _imputation_;
run; 
proc mianalyze parms=r.fixed;
class time_since_exp ;
modeleffects intercept
time_since_exp control_infection_p;
ods output ParameterEstimates=r.combined;
run;

proc mixed data=vicarious  maxiter=1000 maxfunc=5000 NOCLPRINT NOCLPRINT;
parms 
(443.25) 
(230.83) 
(455.14) 
(226.93) 
(271.69) 
(489.74) 
(219.15) 
(241.46) 
(265.74) 
(457.34);
class wave surveyid time_since_exp(ref='0')
W1_Education(ref='1.00') W1_Age_group(ref='4.00')
W1_Gender(ref='2.00') W1_Household(ref='2.00') risk(ref='1') 
W1_Urbanization(ref='4.00') w1_gewest(ref='Vlaanderen') exp_start(ref='0');
model other_infection= time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start control_infection_p/solution covb;
repeated wave/subject=surveyid type=un;
ods output solutionf=r.fixed covb=r.covarpm1;
by _imputation_;
run; 
proc mianalyze parms=r.fixed;
class time_since_exp ;
modeleffects intercept
time_since_exp control_infection_p;
ods output ParameterEstimates=r.combined;
run;

proc mixed data=vicarious  maxiter=1000 maxfunc=5000 NOCLPRINT NOCLPRINT;
parms 
(463.90) 
(194.82) 
(449.39) 
(173.76) 
(201.85) 
(474.58);
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



proc mixed data=vicarious  maxiter=1000 maxfunc=5000 NOCLPRINT NOCLPRINT;
parms 
(241.46) 
(265.74) 
(457.34);
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


proc mixed data=vicarious  maxiter=1000 maxfunc=5000 NOCLPRINT NOCLPRINT;
parms 
(241.46) 
(265.74) 
(457.34);
class wave surveyid time_since_exp(ref='0')
W1_Education(ref='1.00') W1_Age_group(ref='4.00')
W1_Gender(ref='2.00') W1_Household(ref='2.00') risk(ref='1') 
W1_Urbanization(ref='4.00') w1_gewest(ref='Vlaanderen') exp_start(ref='0');
model other_infection= time_since_exp W1_Education W1_Age_group
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


