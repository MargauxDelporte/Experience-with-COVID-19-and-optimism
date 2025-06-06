libname co 'C:\Users\u0149006\OneDrive - KU Leuven\KU Leuven\ASSISTENTSCHAP\Projecten\Vera Hoorens\PAPER 4';
libname r 'C:\Users\u0149006\OneDrive - KU Leuven\KU Leuven\ASSISTENTSCHAP\Projecten\Vera Hoorens\PAPER 4';

**data manipulation**;
data co.imputed_final;
set co.imputed4;
if(W1_exp_pers=5)then W1_exp_pers=4;
if(W2_exp_pers=5)then W2_exp_pers=4;
if(W3_exp_pers=5)then W3_exp_pers=4;
if(W4_exp_pers=5)then W4_exp_pers=4;
if(W5_exp_pers=5)then W5_exp_pers=4;
if W1_exp_pers=1 then exp_start=0;
if W1_exp_pers>1 then exp_start=1;
run;

proc print data=co.imputed_final (obs=10);
var W1_exp_pers exp_start;
run;

data co.imputed_final;
set co.imputed_final;
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

data co.imputed_final;
set co.imputed_final;
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
W1_CO_Infection W2_CO_Infection W3_CO_Infection W4_CO_Infection W5_CO_Infection
increase_W2 increase_W3 increase_W4 increase_W5
size_increase_W1 size_increase_W2 size_increase_W3 size_increase_W4 size_increase_W5;
run;
data co.imputed_final;
set co.imputed_final;
timeclass=wave;
time=wave;
CO_Infection=Self_Infection-Other_infection;
CO_Outcome_Neg=Self_Outcome_Neg-Other_Outcome_Neg;
CO_Outcome_Pos=Self_Outcome_Pos-Other_Outcome_Pos;
run;

proc sort data=co.imputed_final;
by _imputation_;run;
proc contents data=co.imputed_final;run;

proc contents data=co.imputed_original;run;

data co.imputed_final;
set co.imputed_final;
keep SurveyID _Imputation_ exp_start gewest risk size_increase time
time_since_exp timeclass wave
CO_Infection CO_Outcome_Neg CO_Outcome_Pos 
Other_Infection Other_Outcome_neg Other_Outcome_pos
Self_Infection Self_Outcome_neg  Self_Outcome_pos
W1_Education W1_Age_group
W1_Gender W1_Household W1_gewest W1_urbanization
Control_Infection
Control_Outcome_Neg
Control_Outcome_Pos;run;

**only experience and demographic variables***;
proc freq data=co.imputed_final;
tables 
W1_Education W1_Age_group
W1_Gender W1_Household W1_urbanization
risk w1_gewest exp_start;
run;

/*proc mixed data=co.imputed_final  maxiter=1000 maxfunc=5000 NOCLPRINT;
class wave surveyid time_since_exp(ref='0')
W1_Education(ref='1.00') W1_Age_group(ref='4.00')
W1_Gender(ref='2.00') W1_Household(ref='2.00')
W1_Urbanization(ref='4.00') risk(ref='1') w1_gewest(ref='Vlaanderen') exp_start(ref='0');
model &var= time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start/solution covb;
repeated wave/subject=surveyid type=un;
ods output solutionf=r.fixed covb=r.covarpm1;
by _imputation_;
run; */


%macro analysis(yvar=);
proc mixed data=co.imputed_final  maxiter=1000 maxfunc=5000 NOCLPRINT;
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
W1_Gender(ref='2.00') W1_Household(ref='2.00')
W1_Urbanization(ref='4.00') risk(ref='1') w1_gewest(ref='Vlaanderen') exp_start(ref='0');
model &yvar= time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start/solution covb;
repeated wave/subject=surveyid type=un;
ods output solutionf=r.fixed covb=r.covarpm1;
by _imputation_;
run; 

proc mianalyze parms=r.fixed;
class time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start;
modeleffects intercept
time_since_exp W1_Education W1_Age_group
W1_Gender W1_Household W1_Urbanization risk w1_gewest
exp_start;
ods output ParameterEstimates=r.combined;
run;
data r.combined2;
set r.combined; 
drop NImpute W1_Education	W1_Age_group	W1_Gender	W1_Household	W1_Urbanization	risk	w1_gewest	exp_start
LCLMean	UCLMean	DF	Min	Max	Theta0;
run;
%mend analysis;

dm 'odsresults; clear';
%analysis(yvar=co_infection)
dm 'odsresults; clear';
proc print data=r.combined2;
title '';
run;

%analysis(yvar=self_infection)
dm 'odsresults; clear';
proc print data=r.combined2;
title '';
run;

%analysis(yvar=other_infection)
dm 'odsresults; clear';
proc print data=r.combined2;
title '';
run;

%analysis(yvar=co_Outcome_Neg)
dm 'odsresults; clear';
proc print data=r.combined2;
title '';
run;

%analysis(yvar=self_Outcome_Neg)
dm 'odsresults; clear';
proc print data=r.combined2;
title '';
run;

%analysis(yvar=other_Outcome_Neg)
dm 'odsresults; clear';
proc print data=r.combined2;
title '';
run;

%analysis(yvar=co_Outcome_Pos)
dm 'odsresults; clear';
proc print data=r.combined2;
title '';
run;

%analysis(yvar=self_Outcome_Pos)
dm 'odsresults; clear';
proc print data=r.combined2;
title '';
run;

%analysis(yvar=other_Outcome_Pos)
dm 'odsresults; clear';
proc print data=r.combined2;
title '';
run;

%analysis(yvar=control_infection)
dm 'odsresults; clear';
proc print data=r.combined2;
title '';
run;

%analysis(yvar=control_Outcome_Pos)
dm 'odsresults; clear';
proc print data=r.combined2;
title '';
run;

%analysis(yvar=control_Outcome_neg)
dm 'odsresults; clear';
proc print data=r.combined2;
title '';
run;


/*calculate the type III test with the F-value*/

DATA dummies;
    SET co.imputed_final;

    /* Dummy variables for time_since_exp (Reference: 0) */
    IF time_since_exp = 1 THEN time_since_exp_1 = 1; ELSE time_since_exp_1 = 0;
    IF time_since_exp = 2 THEN time_since_exp_2 = 1; ELSE time_since_exp_2 = 0;
    IF time_since_exp = 3 THEN time_since_exp_3 = 1; ELSE time_since_exp_3 = 0;
    IF time_since_exp = 4 THEN time_since_exp_4 = 1; ELSE time_since_exp_4 = 0;

    /* Dummy variables for W1_Education (Reference: 1) */
    IF W1_Education = 2 THEN W1_Education_2 = 1; ELSE W1_Education_2 = 0;

    /* Dummy variables for W1_Age_group (Reference: 4) */
    IF W1_Age_group = 1 THEN W1_Age_group_1 = 1; ELSE W1_Age_group_1 = 0;
    IF W1_Age_group = 2 THEN W1_Age_group_2 = 1; ELSE W1_Age_group_2 = 0;
    IF W1_Age_group = 3 THEN W1_Age_group_3 = 1; ELSE W1_Age_group_3 = 0;
    IF W1_Age_group = 5 THEN W1_Age_group_5 = 1; ELSE W1_Age_group_5 = 0;
    IF W1_Age_group = 6 THEN W1_Age_group_6 = 1; ELSE W1_Age_group_6 = 0;

    /* Dummy variables for W1_Gender (Reference: 2) */
    IF W1_Gender = 1 THEN W1_Gender_1 = 1; ELSE W1_Gender_1 = 0;

    /* Dummy variables for W1_Household (Reference: 2) */
    IF W1_Household = 1 THEN W1_Household_1 = 1; ELSE W1_Household_1 = 0;
    IF W1_Household = 3 THEN W1_Household_3 = 1; ELSE W1_Household_3 = 0;
    IF W1_Household = 4 THEN W1_Household_4 = 1; ELSE W1_Household_4 = 0;
    IF W1_Household = 5 THEN W1_Household_5 = 1; ELSE W1_Household_5 = 0;

    /* Dummy variables for W1_Urbanization (Reference: 4) */
    IF W1_Urbanization = 1 THEN W1_Urbanization_1 = 1; ELSE W1_Urbanization_1 = 0;
    IF W1_Urbanization = 2 THEN W1_Urbanization_2 = 1; ELSE W1_Urbanization_2 = 0;
    IF W1_Urbanization = 3 THEN W1_Urbanization_3 = 1; ELSE W1_Urbanization_3 = 0;

    /* Dummy variables for risk (Reference: 1) */
    IF risk = 2 THEN risk_2 = 1; ELSE risk_2 = 0;
    IF risk = 3 THEN risk_3 = 1; ELSE risk_3 = 0;
/* Dummy variables for wave (Reference: 1) */
    IF wave = 2 THEN wave_2 = 1; ELSE wave_2 = 0;
    IF wave = 3 THEN wave_3 = 1; ELSE wave_3 = 0;
	IF wave = 4 THEN wave_4 = 1; ELSE wave_4 = 0;
	IF wave = 5 THEN wave_5 = 1; ELSE wave_5 = 0;
    /* Dummy variables for W1_Gewest (Reference: Vlaanderen) */
    IF W1_Gewest = "Brussel" THEN W1_Gewest_Brussel = 1; ELSE W1_Gewest_Brussel = 0;
    IF W1_Gewest = "Wallonie" THEN W1_Gewest_Wallonie = 1; ELSE W1_Gewest_Wallonie = 0;
RUN;

%macro analysist3(yvar=);
proc mixed data=dummies  maxiter=1000 maxfunc=5000 NOCLPRINT;
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
class wave surveyid ;
model &yvar = 
        time_since_exp_1 time_since_exp_2 time_since_exp_3 time_since_exp_4
        W1_Education_2
        W1_Age_group_1 W1_Age_group_2 W1_Age_group_3 W1_Age_group_5 W1_Age_group_6
        W1_Gender_1
        W1_Household_1 W1_Household_3 W1_Household_4 W1_Household_5
        W1_Urbanization_1 W1_Urbanization_2 W1_Urbanization_3
        risk_2 risk_3
        W1_Gewest_Brussel W1_Gewest_Wallonie
        exp_start/solution covb;
repeated wave/subject=surveyid type=un;
ods output solutionf=r.fixed covb=r.covarpm1;
by _imputation_;
run; 

dm 'odsresults; clear';
ODS PDF FILE = 'C:\Users\u0149006\OneDrive - KU Leuven\KU Leuven\ASSISTENTSCHAP\Projecten\Vera Hoorens\PAPER 4\MNAR Results\analysist3.pdf';

proc mianalyze parms=r.fixed covb(effectvar=rowcol)=r.covarpm1;
modeleffects
        time_since_exp_1 time_since_exp_2 time_since_exp_3 time_since_exp_4
        W1_Education_2
        W1_Age_group_1 W1_Age_group_2 W1_Age_group_3 W1_Age_group_5 W1_Age_group_6
        W1_Gender_1
        W1_Household_1 W1_Household_3 W1_Household_4 W1_Household_5
        W1_Urbanization_1 W1_Urbanization_2 W1_Urbanization_3
        risk_2 risk_3
        W1_Gewest_Brussel W1_Gewest_Wallonie
        exp_start;
test time_since_exp_1, time_since_exp_2, time_since_exp_3, time_since_exp_4/mult;
run;
ODS PDF CLOSE;

%mend analysist3;

dm 'odsresults; clear';
%analysist3(yvar=co_infection)

dm 'odsresults; clear';
%analysist3(yvar=self_infection)

dm 'odsresults; clear';
%analysist3(yvar=other_infection)

dm 'odsresults; clear';
%analysist3(yvar=co_Outcome_Neg)

dm 'odsresults; clear';
%analysist3(yvar=self_Outcome_Neg)

dm 'odsresults; clear';
%analysist3(yvar=other_Outcome_Neg)

dm 'odsresults; clear';
%analysist3(yvar=co_Outcome_Pos)

dm 'odsresults; clear';
%analysist3(yvar=self_Outcome_Pos)

dm 'odsresults; clear';
%analysist3(yvar=other_Outcome_Pos)

dm 'odsresults; clear';
%analysist3(yvar=control_infection)

dm 'odsresults; clear';
%analysist3(yvar=control_Outcome_Pos)

dm 'odsresults; clear';
%analysist3(yvar=control_Outcome_neg)
