libname l 'C:\Users\u0149006\OneDrive - KU Leuven\KU Leuven\ASSISTENTSCHAP\Projecten\Vera Hoorens\PAPER 4';

proc print data=l.final(obs=10);run;
proc print data=l.imputed(obs=10);run;

proc mi data=l.final nimpute=0 ;
ods select misspattern;
run;

*****************************
**** ORIGINAL IMPUTATION ****
*****************************;
proc mi data=l.final out=imputed_2 nimpute=10 seed=123;
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

proc print data=imputed_2(obs=11);run;

*************************
**** MNAR IMPUTATION ****
*************************;

/*create monotone missingness*/
proc mi data=l.final seed=486048 simple out=mi_monotone nimpute=10;
title 'Montone imputation';
var /*persoonlijk optimisme*/
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
W5_Rim_dis_mean;
mcmc impute=monotone;

run;

proc print data=mi_monotone(obs=11);run;

/*impute categorical variables*/
proc mi data=mi_monotone out=imputed_3 nimpute=1 seed=123;
by _Imputation_;
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
run;

proc print data=imputed_3(obs=11);run;

proc mi data=imputed_3 nimpute=0 ;
var /*persoonlijk optimisme*/
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
W5_Rim_dis_mean;
ods select misspattern;
run;

proc mi data=imputed_3 out=imputed_4 nimpute=1 seed=123;
by _Imputation_;

var /*persoonlijk optimisme*/
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
W5_Rim_dis_mean;

monotone reg;

mnar model (/*persoonlijk optimisme*/



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
W5_Rim_dis_mean / modelobs=ncmv);
run;

data l.imputed4;
set imputed_4;
run; 

proc print data=l.imputed4(obs=10);
run;

proc print data=l.imputed(obs=10);
run;

proc mi data=imputed_4 nimpute=0 ;
var /*persoonlijk optimisme*/
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
W5_Rim_dis_mean;
ods select misspattern;
run;
