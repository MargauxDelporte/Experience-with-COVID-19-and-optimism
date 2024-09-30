libname co '';
libname r '';


proc freq data=co.imputed_final_v;
tables size_increase;
run;

**data manipulation**;
data co.imputed_final_v;
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

data co.imputed_final_v;
set co.imputed_final_v;
if W1_exp_vic=1 then exp_start=0;
if W1_exp_vic>1 then exp_start=1;
run;

data co.imputed_final_v;
set co.imputed_final_v;
wave=1;
risk=W1_risk;
time_since_exp=0;
size_increase=0;
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
drop W1_CO_Infection W2_CO_Infection W3_CO_Infection W4_CO_Infection W5_CO_Infection
increase_W2 increase_W3 increase_W4 increase_W5
size_increase_W1 size_increase_W2 size_increase_W3 size_increase_W4 size_increase_W5;
run;
data co.imputed_final_v;
set co.imputed_final_v;
timeclass=wave;
time=wave;
CO_Infection=Self_Infection-Other_infection;
CO_Outcome_Neg=Self_Outcome_Neg-Other_Outcome_Neg;
CO_Outcome_Pos=Self_Outcome_Pos-Other_Outcome_Pos;
size_increase_sqrd=size_increase*size_increase;
run;

proc mixed data=co.imputed_final_v  maxiter=1000 maxfunc=5000 NOCLPRINT NOCLPRINT;
class wave surveyid time_since_exp(ref='0')
W1_Education(ref='1.00') W1_Age_group(ref='4.00')
W1_Gender(ref='2.00') W1_Household(ref='2.00') risk(ref='1') 
W1_Urbanization(ref='4.00') w1_gewest(ref='Vlaanderen') exp_start(ref='0');
model &yvar= time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start/solution covb;
repeated wave/subject=surveyid type=un;
ods output solutionf=r.fixed covb=r.covarpm1;
by _imputation_;
run; 

%macro analysis_v(yvar=);
proc mixed data=co.imputed_final_v  maxiter=1000 maxfunc=5000 NOCLPRINT NOCLPRINT;
parms 
(349.55) 
(75.8585) 
(322.38 )
(77.8502)
(90.2547 )
(357.60 )
(44.4099 )
(60.0994 )
(77.1003 )
(355.52 )
(66.8823 )
(59.4733 )
(59.2938 )
(36.4013 )
(417.78 );
class wave surveyid time_since_exp(ref='0')
W1_Education(ref='1.00') W1_Age_group(ref='4.00')
W1_Gender(ref='2.00') W1_Household(ref='2.00') risk(ref='1') 
W1_Urbanization(ref='4.00') w1_gewest(ref='Vlaanderen') exp_start(ref='0');
model &yvar= time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start/solution covb;
repeated wave/subject=surveyid type=un;
ods output solutionf=r.fixed covb=r.covarpm1;
by _imputation_;
run; 

proc mianalyze parms=r.fixed;
class time_since_exp ;
modeleffects intercept
time_since_exp;
ods output ParameterEstimates=r.combined;
run;
%mend analysis_v;

%macro plots_v(yvar=);
proc mixed data=co.imputed_final_v  maxiter=1000 maxfunc=5000 NOCLPRINT;
parms 
(349.55) 
(75.8585) 
(322.38 )
(77.8502)
(90.2547 )
(357.60 )
(44.4099 )
(60.0994 )
(77.1003 )
(355.52 )
(66.8823 )
(59.4733 )
(59.2938 )
(36.4013 )
(417.78 );
class wave surveyid time_since_exp(ref='0')
W1_Education(ref='1.00') W1_Age_group(ref='4.00')
W1_Gender(ref='2.00') W1_Household(ref='2.00') risk(ref='1') 
W1_Urbanization(ref='4.00') w1_gewest(ref='Vlaanderen') exp_start(ref='0');
model &yvar= time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start/solution covb noint;
repeated wave/subject=surveyid type=un;
ods output solutionf=r.pimput;
by _imputation_;
run; 
proc mianalyze parms=r.pimput;
class time_since_exp ;
modeleffects
time_since_exp;
ods output ParameterEstimates=r.v_&yvar;
run;
%mend plots_v;


%analysis_v(yvar=co_infection)
%analysis_v(yvar=self_infection)
%analysis_v(yvar=other_infection)


%analysis_v(yvar=co_Outcome_Neg)
%analysis_v(yvar=self_Outcome_Neg)
%analysis_v(yvar=other_Outcome_Neg)

%analysis_v(yvar=co_Outcome_Pos)
%analysis_v(yvar=self_Outcome_Pos)
%analysis_v(yvar=other_Outcome_Pos)

%analysis_v(yvar=control_infection)
%analysis_v(yvar=control_Outcome_neg)
%analysis_v(yvar=control_Outcome_Pos)

%plots_v(yvar=co_infection)
%plots_v(yvar=self_infection)
%plots_v(yvar=other_infection)


%plots_v(yvar=co_Outcome_Neg)
%plots_v(yvar=self_Outcome_Neg)
%plots_v(yvar=other_Outcome_Neg)


%plots_v(yvar=co_Outcome_Pos)
%plots_v(yvar=self_Outcome_Pos)
%plots_v(yvar=other_Outcome_Pos)

%plots_v(yvar=control_infection)
%plots_v(yvar=control_Outcome_neg)
%plots_v(yvar=control_Outcome_pos)
