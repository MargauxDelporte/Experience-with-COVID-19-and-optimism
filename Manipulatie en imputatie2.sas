/*importing data*/

libname v 'C:\Users\u0118563\OneDrive - KU Leuven\Projecten\Corona Vera Hoorens\Paper 3\data (zeker correct)';
libname vac 'C:\Users\u0118563\OneDrive - KU Leuven\Projecten\Corona Vera Hoorens\Paper 1\Revision 2\Data';
libname co 'C:\Users\u0118563\OneDrive - KU Leuven\Projecten\Corona Vera Hoorens\Paper 4\data';

******************************************************
*data manipulation;
************************************************************;

proc contents data=v.first;run;

proc freq data=v.first;
tables 
W1_Risk;run;
data co.reduced;
set co.first;
keep 
Surveyid
/*demographic*/
W1_Gender
W1_Age_group
W1_Education
W1_Household 
W1_Job
W1_Language
W1_Urbanization
W1_Risk 
W1_Province
/*experience*/
W1_Exp_Pers
W1_exp_pro
W1_Exp_Vic
/*controle*/
W1_Control_Infection
W1_COntrol_Outcome_Neg
W1_COntrol_Outcome_pos
/*persoonlijk optimisme*/
W1_Self_Infection
W1_self_Outcome_Neg
W1_self_Outcome_pos
/*anderen optimisme*/
W1_other_Infection
W1_other_Outcome_Neg
W1_other_Outcome_pos
/*persoonlijk optimisme*/
W1_CO_Infection
W1_CO_Outcome_Neg
W1_CO_Outcome_Pos
/*uitkomst ziekte*/
W1_Rim_dis_mean

/*demographic*/
W2_Gender
W2_Age_group
W2_Education
W2_Household 
W2_Job
W2_Language
W2_Urbanization
W2_Risk 
W2_Province
/*experience*/
W2_Exp_Pers
W2_exp_pro
W2_Exp_Vic
/*controle*/
W2_Control_Infection
W2_COntrol_Outcome_Neg
W2_COntrol_Outcome_pos
/*persoonlijk optimisme*/
W2_Self_Infection
W2_self_Outcome_Neg
W2_self_Outcome_pos
/*anderen optimisme*/
W2_other_Infection
W2_other_Outcome_Neg
W2_other_Outcome_pos
/*persoonlijk optimisme*/
W2_CO_Infection
W2_CO_Outcome_Neg
W2_CO_Outcome_Pos
/*uitkomst ziekte*/
W2_Rim_dis_mean

W3_Gender
W3_Age_group
W3_Education
W3_Household 
W3_Job
W3_Language
W3_Urbanization
W3_Risk 
W3_Province
/*experience*/
W3_Exp_Pers
W3_exp_pro
W3_Exp_Vic
/*controle*/
W3_Control_Infection
W3_COntrol_Outcome_Neg
W3_COntrol_Outcome_pos
/*persoonlijk optimisme*/
W3_Self_Infection
W3_self_Outcome_Neg
W3_self_Outcome_pos
/*anderen optimisme*/
W3_other_Infection
W3_other_Outcome_Neg
W3_other_Outcome_pos
/*persoonlijk optimisme*/
W3_CO_Infection
W3_CO_Outcome_Neg
W3_CO_Outcome_Pos
/*uitkomst ziekte*/
W3_Rim_dis_mean

W4_Gender
W4_Age_group
W4_Education
W4_Household 
W4_Job
W4_Language
W4_Urbanization
W4_Risk 
W4_Province
/*experience*/
W4_Exp_Pers
W4_exp_pro
W4_Exp_Vic
/*controle*/
W4_Control_Infection
W4_COntrol_Outcome_Neg
W4_COntrol_Outcome_pos
/*persoonlijk optimisme*/
W4_Self_Infection
W4_self_Outcome_Neg
W4_self_Outcome_pos
/*anderen optimisme*/
W4_other_Infection
W4_other_Outcome_Neg
W4_other_Outcome_pos
/*persoonlijk optimisme*/
W4_CO_Infection
W4_CO_Outcome_Neg
W4_CO_Outcome_Pos
/*uitkomst ziekte*/
W4_Rim_dis_mean

W5_Gender
W5_Age_group
W5_Education
W5_Household 
W5_Job
W5_Language
W5_Urbanization
W5_Risk 
W5_Province
/*experience*/
W5_Exp_Pers
W5_exp_pro
W5_Exp_Vic
/*controle*/
W5_Control_Infection
W5_COntrol_Outcome_Neg
W5_COntrol_Outcome_pos
/*persoonlijk optimisme*/
W5_Self_Infection
W5_self_Outcome_Neg
W5_self_Outcome_pos
/*anderen optimisme*/
W5_other_Infection
W5_other_Outcome_Neg
W5_other_Outcome_pos
/*persoonlijk optimisme*/
W5_CO_Infection
W5_CO_Outcome_Neg
W5_CO_Outcome_Pos
/*uitkomst ziekte*/
W5_Rim_dis_mean;
run;

data co.reduced;
set co.reduced;
length gewest $15.;
if W1_Province in ('10000' '20001'  '30000' '40000' '70000') then W1_Gewest="Vlaanderen";
else if W1_Province="4000" then W1_Gewest="Brussel";
else if W1_Province in ("20002" "50000" "60000" "80000" "90000") then W1_Gewest="Wallonie";
else W1_Gewest='NA';
if W2_Province in ('10000' '20001'  '30000' '40000' '70000') then W2_Gewest="Vlaanderen";
else if W2_Province="4000" then W2_Gewest="Brussel";
else if W2_Province in ("20002" "50000" "60000" "80000" "90000") then W2_Gewest="Wallonie";
else W2_Gewest='NA';
if W3_Province in ('10000' '20001'  '30000' '40000' '70000') then W3_Gewest="Vlaanderen";
else if W3_Province="4000" then W3_Gewest="Brussel";
else if W3_Province in ("20002" "50000" "60000" "80000" "90000") then W3_Gewest="Wallonie";
else W3_Gewest='NA';
if W4_Province in ('10000' '20001'  '30000' '40000' '70000') then W4_Gewest="Vlaanderen";
else if W4_Province="4000" then W4_Gewest="Brussel";
else if W4_Province in ("20002" "50000" "60000" "80000" "90000") then W4_Gewest="Wallonie";
else W4_Gewest='NA';
if W5_Province in ('10000' '20001'  '30000' '40000' '70000') then W5_Gewest="Vlaanderen";
else if W5_Province="4000" then W5_Gewest="Brussel";
else if W5_Province in ("20002" "50000" "60000" "80000" "90000") then W5_Gewest="Wallonie";
else W5_Gewest='NA';
run;

data co.final;
set co.reduced;
if W1_Gewest ='NA'  then do;
if W5_Gewest='Brussel' then W4_Gewest='Brussel';
if W4_Gewest='Brussel' then W3_Gewest='Brussel';
if W3_Gewest='Brussel' then W2_Gewest='Brussel';
if W2_Gewest='Brussel' then W1_Gewest='Brussel';
if W5_Gewest='Vlaanderen' then W4_Gewest='Vlaanderen';
if W4_Gewest='Vlaanderen' then W3_Gewest='Vlaanderen';
if W3_Gewest='Vlaanderen' then W2_Gewest='Vlaanderen';
if W2_Gewest='Vlaanderen' then W1_Gewest='Vlaanderen';
if W5_Gewest='Wallonie' then W4_Gewest='Wallonie';
if W4_Gewest='Wallonie' then W3_Gewest='Wallonie';
if W3_Gewest='Wallonie' then W2_Gewest='Wallonie';
if W2_Gewest='Wallonie' then W1_Gewest='Wallonie';
end;
run;
proc freq data=co.reduced;
tables W1_Gewest;run;
proc freq data=co.final;
tables W1_Gewest;run;

data co.final;
set co.final;
if W1_Gender =.  then do;
if W5_Gender=1 then W4_Gender=1;
if W4_Gender=1 then W3_Gender=1;
if W3_Gender=1 then W2_Gender=1;
if W2_Gender=1 then W1_Gender=1;
if W5_Gender=2 then W4_Gender=2;
if W4_Gender=2 then W3_Gender=2;
if W3_Gender=2 then W2_Gender=2;
if W2_Gender=2 then W1_Gender=2;
end;
run;

proc freq data=co.final;
tables W1_urbanization;
run;
data co.final;
set co.final;
if W1_urbanization =.  then do;
if W5_urbanization=1 then W4_urbanization=1;
if W4_urbanization=1 then W3_urbanization=1;
if W3_urbanization=1 then W2_urbanization=1;
if W2_urbanization=1 then W1_urbanization=1;
if W5_urbanization=2 then W4_urbanization=2;
if W4_urbanization=2 then W3_urbanization=2;
if W3_urbanization=2 then W2_urbanization=2;
if W2_urbanization=2 then W1_urbanization=2;
if W5_urbanization=3 then W4_urbanization=3;
if W4_urbanization=3 then W3_urbanization=3;
if W3_urbanization=3 then W2_urbanization=3;
if W2_urbanization=3 then W1_urbanization=3;
if W5_urbanization=4 then W4_urbanization=4;
if W4_urbanization=4 then W3_urbanization=4;
if W3_urbanization=4 then W2_urbanization=4;
if W2_urbanization=4 then W1_urbanization=4;
end;
run;

proc freq data=co.final;
tables W1_education;
run;
data co.final;
set co.final;
if W1_education =.  then do;
if W5_education=1 then W4_education=1;
if W4_education=1 then W3_education=1;
if W3_education=1 then W2_education=1;
if W2_education=1 then W1_education=1;
if W5_education=2 then W4_education=2;
if W4_education=2 then W3_education=2;
if W3_education=2 then W2_education=2;
if W2_education=2 then W1_education=2;
end;
run;

proc freq data=co.final;
tables W1_job;
run;
data co.final;
set co.final;
if W1_job =.  then do;
if W5_job=1 then W4_job=1;
if W4_job=1 then W3_job=1;
if W3_job=1 then W2_job=1;
if W2_job=1 then W1_job=1;
if W5_job=2 then W4_job=2;
if W4_job=2 then W3_job=2;
if W3_job=2 then W2_job=2;
if W2_job=2 then W1_job=2;
if W5_job=3 then W4_job=3;
if W4_job=3 then W3_job=3;
if W3_job=3 then W2_job=3;
if W2_job=3 then W1_job=3;
if W5_job=4 then W4_job=4;
if W4_job=4 then W3_job=4;
if W3_job=4 then W2_job=4;
if W2_job=4 then W1_job=4;
if W5_job=5 then W4_job=5;
if W4_job=5 then W3_job=5;
if W3_job=5 then W2_job=5;
if W2_job=5 then W1_job=5;
if W5_job=6 then W4_job=6;
if W4_job=6 then W3_job=6;
if W3_job=6 then W2_job=6;
if W2_job=6 then W1_job=6;
if W5_job=7 then W4_job=7;
if W4_job=7 then W3_job=7;
if W3_job=7 then W2_job=7;
if W2_job=7 then W1_job=7;
if W5_job=8 then W4_job=8;
if W4_job=8 then W3_job=8;
if W3_job=8 then W2_job=8;
if W2_job=8 then W1_job=8;
end;
run;

proc freq data=co.final;
tables W1_household;
run;
data co.final;
set co.final;
if W1_household =.  then do;
if W5_household=1 then W4_household=1;
if W4_household=1 then W3_household=1;
if W3_household=1 then W2_household=1;
if W2_household=1 then W1_household=1;
if W5_household=2 then W4_household=2;
if W4_household=2 then W3_household=2;
if W3_household=2 then W2_household=2;
if W2_household=2 then W1_household=2;
if W5_household=3 then W4_household=3;
if W4_household=3 then W3_household=3;
if W3_household=3 then W2_household=3;
if W2_household=3 then W1_household=3;
if W5_household=4 then W4_household=4;
if W4_household=4 then W3_household=4;
if W3_household=4 then W2_household=4;
if W2_household=4 then W1_household=4;
if W5_household=5 then W4_household=5;
if W4_household=5 then W3_household=5;
if W3_household=5 then W2_household=5;
if W2_household=5 then W1_household=5;
end;
run;
proc freq data=co.final;
tables W1_Age_group;
run;
data co.final;
set co.final;
if W1_Age_group =.  then do;
if W5_age_group=1 then W4_age_group=1;
if W4_age_group=1 then W3_age_group=1;
if W3_age_group=1 then W2_age_group=1;
if W2_age_group=1 then W1_age_group=1;
if W5_age_group=2 then W4_age_group=2;
if W4_age_group=2 then W3_age_group=2;
if W3_age_group=2 then W2_age_group=2;
if W2_age_group=2 then W1_age_group=2;
if W5_age_group=3 then W4_age_group=3;
if W4_age_group=3 then W3_age_group=3;
if W3_age_group=3 then W2_age_group=3;
if W2_age_group=3 then W1_age_group=3;
if W5_age_group=4 then W4_age_group=4;
if W4_age_group=4 then W3_age_group=4;
if W3_age_group=4 then W2_age_group=4;
if W2_age_group=4 then W1_age_group=4;
if W5_age_group=5 then W4_age_group=5;
if W4_age_group=5 then W3_age_group=5;
if W3_age_group=5 then W2_age_group=5;
if W2_age_group=5 then W1_age_group=5;
if W5_age_group=6 then W4_age_group=6;
if W4_age_group=6 then W3_age_group=6;
if W3_age_group=6 then W2_age_group=6;
if W2_age_group=6 then W1_age_group=6;
end;
run;

data co.long;
set co.final;
wave = 1 ;
Surveyid=Surveyid;
Gender=W1_Gender;
Age_group=W1_Age_group;
Education=W1_Education;
Household=W1_Household ;
Job=W1_Job;
Language=W1_Language;
Urbanization=W1_Urbanization;
Regio=W1_Gewest;
Risk=W1_Risk;
/*experience*/
Exp_Pers=W1_Exp_Pers;
exp_pro=W1_exp_pro;
Exp_Vic=W1_Exp_Vic;
/*controle*/
Control_Infection=W1_Control_Infection;
COntrol_Outcome_Neg=W1_COntrol_Outcome_Neg;
COntrol_Outcome_pos=W1_COntrol_Outcome_pos;
/*persoonlijk optimisme*/
Self_Infection=W1_Self_Infection;
self_Outcome_Neg=W1_self_Outcome_Neg;
self_Outcome_pos=W1_self_Outcome_pos;
/*anderen optimisme*/
other_Infection=W1_other_Infection;
other_Outcome_Neg=W1_other_Outcome_Neg;
other_Outcome_pos=W1_other_Outcome_pos;
/*persoonlijk optimisme*/
CO_Infection=W1_CO_Infection;
CO_Outcome_Neg=W1_CO_Outcome_Neg;
CO_Outcome_Pos=W1_CO_Outcome_Pos;
/*uitkomst ziekte*/
Rim_dis_mean=W1_Rim_dis_mean;
output;
wave = 2 ;
Surveyid=Surveyid;
Gender=W1_Gender;
Age_group=W1_Age_group;
Education=W1_Education;
Household=W1_Household ;
Job=W1_Job;
Language=W1_Language;
Urbanization=W1_Urbanization;
Regio=W1_Gewest;
Risk=W2_Risk;
/*experience*/
Exp_Pers=W2_Exp_Pers;
exp_pro=W2_exp_pro;
Exp_Vic=W2_Exp_Vic;
/*controle*/
Control_Infection=W2_Control_Infection;
COntrol_Outcome_Neg=W2_COntrol_Outcome_Neg;
COntrol_Outcome_pos=W2_COntrol_Outcome_pos;
/*persoonlijk optimisme*/
Self_Infection=W2_Self_Infection;
self_Outcome_Neg=W2_self_Outcome_Neg;
self_Outcome_pos=W2_self_Outcome_pos;
/*anderen optimisme*/
other_Infection=W2_other_Infection;
other_Outcome_Neg=W2_other_Outcome_Neg;
other_Outcome_pos=W2_other_Outcome_pos;
/*persoonlijk optimisme*/
CO_Infection=W2_CO_Infection;
CO_Outcome_Neg=W2_CO_Outcome_Neg;
CO_Outcome_Pos=W2_CO_Outcome_Pos;
/*uitkomst ziekte*/
Rim_dis_mean=W2_Rim_dis_mean;
output;
wave = 3 ;
Surveyid=Surveyid;
Gender=W1_Gender;
Age_group=W1_Age_group;
Education=W1_Education;
Household=W1_Household ;
Job=W1_Job;
Language=W1_Language;
Urbanization=W1_Urbanization;
Regio=W1_Gewest;
Risk=W3_Risk;
/*experience*/
Exp_Pers=W3_Exp_Pers;
exp_pro=W3_exp_pro;
Exp_Vic=W3_Exp_Vic;
/*controle*/
Control_Infection=W3_Control_Infection;
COntrol_Outcome_Neg=W3_COntrol_Outcome_Neg;
COntrol_Outcome_pos=W3_COntrol_Outcome_pos;
/*persoonlijk optimisme*/
Self_Infection=W3_Self_Infection;
self_Outcome_Neg=W3_self_Outcome_Neg;
self_Outcome_pos=W3_self_Outcome_pos;
/*anderen optimisme*/
other_Infection=W3_other_Infection;
other_Outcome_Neg=W3_other_Outcome_Neg;
other_Outcome_pos=W3_other_Outcome_pos;
/*persoonlijk optimisme*/
CO_Infection=W3_CO_Infection;
CO_Outcome_Neg=W3_CO_Outcome_Neg;
CO_Outcome_Pos=W3_CO_Outcome_Pos;
/*uitkomst ziekte*/
Rim_dis_mean=W3_Rim_dis_mean;
output;
wave = 4 ;
Surveyid=Surveyid;
Gender=W1_Gender;
Age_group=W1_Age_group;
Education=W1_Education;
Household=W1_Household ;
Job=W1_Job;
Language=W1_Language;
Urbanization=W1_Urbanization;
Regio=W1_Gewest;
Risk=W4_Risk;
/*experience*/
Exp_Pers=W4_Exp_Pers;
exp_pro=W4_exp_pro;
Exp_Vic=W4_Exp_Vic;
/*controle*/
Control_Infection=W4_Control_Infection;
COntrol_Outcome_Neg=W4_COntrol_Outcome_Neg;
COntrol_Outcome_pos=W4_COntrol_Outcome_pos;
/*persoonlijk optimisme*/
Self_Infection=W4_Self_Infection;
self_Outcome_Neg=W4_self_Outcome_Neg;
self_Outcome_pos=W4_self_Outcome_pos;
/*anderen optimisme*/
other_Infection=W4_other_Infection;
other_Outcome_Neg=W4_other_Outcome_Neg;
other_Outcome_pos=W4_other_Outcome_pos;
/*persoonlijk optimisme*/
CO_Infection=W4_CO_Infection;
CO_Outcome_Neg=W4_CO_Outcome_Neg;
CO_Outcome_Pos=W4_CO_Outcome_Pos;
/*uitkomst ziekte*/
Rim_dis_mean=W4_Rim_dis_mean;
output;
wave = 5 ;
Surveyid=Surveyid;
Gender=W1_Gender;
Age_group=W1_Age_group;
Education=W1_Education;
Household=W1_Household ;
Job=W1_Job;
Language=W1_Language;
Urbanization=W1_Urbanization;
Regio=W1_Gewest;
Risk=W5_Risk;
/*experience*/
Exp_Pers=W5_Exp_Pers;
exp_pro=W5_exp_pro;
Exp_Vic=W5_Exp_Vic;
/*controle*/
Control_Infection=W5_Control_Infection;
COntrol_Outcome_Neg=W5_COntrol_Outcome_Neg;
COntrol_Outcome_pos=W5_COntrol_Outcome_pos;
/*persoonlijk optimisme*/
Self_Infection=W5_Self_Infection;
self_Outcome_Neg=W5_self_Outcome_Neg;
self_Outcome_pos=W5_self_Outcome_pos;
/*anderen optimisme*/
other_Infection=W5_other_Infection;
other_Outcome_Neg=W5_other_Outcome_Neg;
other_Outcome_pos=W5_other_Outcome_pos;
/*persoonlijk optimisme*/
CO_Infection=W5_CO_Infection;
CO_Outcome_Neg=W5_CO_Outcome_Neg;
CO_Outcome_Pos=W5_CO_Outcome_Pos;
/*uitkomst ziekte*/
Rim_dis_mean=W5_Rim_dis_mean;
output;
drop
W1_Gender
W1_Age_group
W1_Education
W1_Household 
W1_Job
W1_Language
W1_Urbanization
/*experience
W1_Exp_Pers
W1_exp_pro
W1_Exp_Vic*/
/*controle*/
W1_Control_Infection
W1_CO_Outcome_Neg
W1_CO_Outcome_pos
/*persoonlijk optimisme*/
W1_Self_Infection
W1_self_Outcome_Neg
W1_self_Outcome_pos
/*anderen optimisme*/
W1_other_Infection
W1_other_Outcome_Neg
W1_other_Outcome_pos
/*persoonlijk optimisme*/
W1_CO_Infection
W1_COntrol_Outcome_Neg
W1_COntrol_Outcome_Pos
/*uitkomst ziekte*/
W1_Rim_dis_mean

/*demographic*/
W2_Gender
W2_Age_group
W2_Education
W2_Household 
W2_Job
W2_Language
W2_Urbanization
/*experience*/
W2_Exp_Pers
W2_exp_pro
W2_Exp_Vic
/*controle*/
W2_Control_Infection
W2_CO_Outcome_Neg
W2_CO_Outcome_pos
/*persoonlijk optimisme*/
W2_Self_Infection
W2_self_Outcome_Neg
W2_self_Outcome_pos
/*anderen optimisme*/
W2_other_Infection
W2_other_Outcome_Neg
W2_other_Outcome_pos
/*persoonlijk optimisme*/
W2_CO_Infection
W2_COntrol_Outcome_Neg
W2_COntrol_Outcome_Pos
/*uitkomst ziekte*/
W2_Rim_dis_mean

W3_Gender
W3_Age_group
W3_Education
W3_Household 
W3_Job
W3_Language
W3_Urbanization
/*experience*/
W3_Exp_Pers
W3_exp_pro
W3_Exp_Vic
/*controle*/
W3_Control_Infection
W3_COntrol_Outcome_Neg
W3_COntrol_Outcome_pos
/*persoonlijk optimisme*/
W3_Self_Infection
W3_self_Outcome_Neg
W3_self_Outcome_pos
/*anderen optimisme*/
W3_other_Infection
W3_other_Outcome_Neg
W3_other_Outcome_pos
/*persoonlijk optimisme*/
W3_CO_Infection
W3_CO_Outcome_Neg
W3_CO_Outcome_Pos
/*uitkomst ziekte*/
W3_Rim_dis_mean

W4_Gender
W4_Age_group
W4_Education
W4_Household 
W4_Job
W4_Language
W4_Urbanization
/*experience*/
W4_Exp_Pers
W4_exp_pro
W4_Exp_Vic
/*controle*/
W4_Control_Infection
W4_COntrol_Outcome_Neg
W4_COntrol_Outcome_pos
/*persoonlijk optimisme*/
W4_Self_Infection
W4_self_Outcome_Neg
W4_self_Outcome_pos
/*anderen optimisme*/
W4_other_Infection
W4_other_Outcome_Neg
W4_other_Outcome_pos
/*persoonlijk optimisme*/
W4_CO_Infection
W4_CO_Outcome_Neg
W4_CO_Outcome_Pos
/*uitkomst ziekte*/
W4_Rim_dis_mean

W5_Gender
W5_Age_group
W5_Education
W5_Household 
W5_Job
W5_Language
W5_Urbanization
/*experience*/
W5_Exp_Pers
W5_exp_pro
W5_Exp_Vic
/*controle*/
W5_Control_Infection
W5_COntrol_Outcome_Neg
W5_COntrol_Outcome_pos
/*persoonlijk optimisme*/
W5_Self_Infection
W5_self_Outcome_Neg
W5_self_Outcome_pos
/*anderen optimisme*/
W5_other_Infection
W5_other_Outcome_Neg
W5_other_Outcome_pos
/*persoonlijk optimisme*/
W5_CO_Infection
W5_CO_Outcome_Neg
W5_CO_Outcome_Pos
/*uitkomst ziekte*/
W5_Rim_dis_mean

W1_Province W2_Province W3_Province W4_Province W5_Province
W1_RISK W2_RISK W3_RISK W4_RISK W5_RISK;
run;

******************************************************
*data imputation: comparative is difference so do not include it;
************************************************************;
proc mi data=co.final out=co.imputed_noco nimpute=10 seed=123;
class 
W1_risk
W2_risk
W3_risk
W4_risk
W5_risk
W1_gewest
W1_Gender
W1_Age_group
W1_Education
W1_Household 
W1_Job
W1_Language
W1_Urbanization
W1_Exp_Pers
W1_exp_pro
W1_Exp_Vic
W2_Exp_Pers
W2_exp_pro
W2_Exp_Vic
W3_Exp_Pers
W3_exp_pro
W3_Exp_Vic
W4_Exp_Pers
W4_exp_pro
W4_Exp_Vic
W5_Exp_Pers
W5_exp_pro
W5_Exp_Vic
W1_Control_Infection
W1_COntrol_Outcome_Neg
W1_COntrol_Outcome_pos
W2_Control_Infection
W2_COntrol_Outcome_Neg
W2_COntrol_Outcome_pos
W3_Control_Infection
W3_COntrol_Outcome_Neg
W3_COntrol_Outcome_pos
W4_Control_Infection
W4_COntrol_Outcome_Neg
W4_COntrol_Outcome_pos
W5_Control_Infection
W5_COntrol_Outcome_Neg
W5_COntrol_Outcome_pos
;
fcs discrim(
W1_risk
W2_risk
W3_risk
W4_risk
W5_risk
W1_gewest
W1_Gender
W1_Age_group
W1_Education
W1_Household 
W1_Job
W1_Language
W1_Urbanization
W1_Exp_Pers
W1_exp_pro
W1_Exp_Vic
W2_Exp_Pers
W2_exp_pro
W2_Exp_Vic
W3_Exp_Pers
W3_exp_pro
W3_Exp_Vic
W4_Exp_Pers
W4_exp_pro
W4_Exp_Vic
W5_Exp_Pers
W5_exp_pro
W5_Exp_Vic
W1_Control_Infection
W1_COntrol_Outcome_Neg
W1_COntrol_Outcome_pos
W2_Control_Infection
W2_COntrol_Outcome_Neg
W2_COntrol_Outcome_pos
W3_Control_Infection
W3_COntrol_Outcome_Neg
W3_COntrol_Outcome_pos
W4_Control_Infection
W4_COntrol_Outcome_Neg
W4_COntrol_Outcome_pos
W5_Control_Infection
W5_COntrol_Outcome_Neg
W5_COntrol_Outcome_pos/CLASSEFFECTS=INCLUDE);
fcs reg(
/*persoonlijk optimisme*/
W1_Self_Infection
W1_self_Outcome_Neg
W1_self_Outcome_pos
/*anderen optimisme*/
W1_other_Infection
W1_other_Outcome_Neg
W1_other_Outcome_pos

/*uitkomst ziekte*/
W1_Rim_dis_mean


/*persoonlijk optimisme*/
W2_Self_Infection
W2_self_Outcome_Neg
W2_self_Outcome_pos
/*anderen optimisme*/
W2_other_Infection
W2_other_Outcome_Neg
W2_other_Outcome_pos

/*uitkomst ziekte*/
W2_Rim_dis_mean


/*persoonlijk optimisme*/
W3_Self_Infection
W3_self_Outcome_Neg
W3_self_Outcome_pos
/*anderen optimisme*/
W3_other_Infection
W3_other_Outcome_Neg
W3_other_Outcome_pos

/*uitkomst ziekte*/
W3_Rim_dis_mean


/*persoonlijk optimisme*/
W4_Self_Infection
W4_self_Outcome_Neg
W4_self_Outcome_pos
/*anderen optimisme*/
W4_other_Infection
W4_other_Outcome_Neg
W4_other_Outcome_pos

/*uitkomst ziekte*/
W4_Rim_dis_mean

/*persoonlijk optimisme*/
W5_Self_Infection
W5_self_Outcome_Neg
W5_self_Outcome_pos
/*anderen optimisme*/
W5_other_Infection
W5_other_Outcome_Neg
W5_other_Outcome_pos

/*uitkomst ziekte*/
W5_Rim_dis_mean);

var
W1_risk
W2_risk
W3_risk
W4_risk
W5_risk
W1_gewest
W1_Gender
W1_Age_group
W1_Education
W1_Household 
W1_Job
W1_Language
W1_Urbanization
/*experience*/
W1_Exp_Pers
W1_exp_pro
W1_Exp_Vic
/*controle*/
W1_Control_Infection
W1_COntrol_Outcome_Neg
W1_COntrol_Outcome_pos
/*persoonlijk optimisme*/
W1_Self_Infection
W1_self_Outcome_Neg
W1_self_Outcome_pos
/*anderen optimisme*/
W1_other_Infection
W1_other_Outcome_Neg
W1_other_Outcome_pos

/*uitkomst ziekte*/
W1_Rim_dis_mean

/*experience*/
W2_Exp_Pers
W2_exp_pro
W2_Exp_Vic
/*controle*/
W2_Control_Infection
W2_COntrol_Outcome_Neg
W2_COntrol_Outcome_pos
/*persoonlijk optimisme*/
W2_Self_Infection
W2_self_Outcome_Neg
W2_self_Outcome_pos
/*anderen optimisme*/
W2_other_Infection
W2_other_Outcome_Neg
W2_other_Outcome_pos
/*persoonlijk optimisme*/

/*uitkomst ziekte*/
W2_Rim_dis_mean

/*experience*/
W3_Exp_Pers
W3_exp_pro
W3_Exp_Vic
/*controle*/
W3_Control_Infection
W3_COntrol_Outcome_Neg
W3_COntrol_Outcome_pos
/*persoonlijk optimisme*/
W3_Self_Infection
W3_self_Outcome_Neg
W3_self_Outcome_pos
/*anderen optimisme*/
W3_other_Infection
W3_other_Outcome_Neg
W3_other_Outcome_pos

/*uitkomst ziekte*/
W3_Rim_dis_mean

/*experience*/
W4_Exp_Pers
W4_exp_pro
W4_Exp_Vic
/*controle*/
W4_Control_Infection
W4_COntrol_Outcome_Neg
W4_COntrol_Outcome_pos
/*persoonlijk optimisme*/
W4_Self_Infection
W4_self_Outcome_Neg
W4_self_Outcome_pos
/*anderen optimisme*/
W4_other_Infection
W4_other_Outcome_Neg
W4_other_Outcome_pos

/*uitkomst ziekte*/
W4_Rim_dis_mean

/*experience*/
W5_Exp_Pers
W5_exp_pro
W5_Exp_Vic
/*controle*/
W5_Control_Infection
W5_COntrol_Outcome_Neg
W5_COntrol_Outcome_pos
/*persoonlijk optimisme*/
W5_Self_Infection
W5_self_Outcome_Neg
W5_self_Outcome_pos
/*anderen optimisme*/
W5_other_Infection
W5_other_Outcome_Neg
W5_other_Outcome_pos

/*uitkomst ziekte*/
W5_Rim_dis_mean;
run;

proc print data=co.imputed_noco (obs=11);run;

