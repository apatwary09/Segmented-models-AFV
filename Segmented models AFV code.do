import delimited "C:\Users\User\OneDrive - University of Tennessee\2022 _ Research Progress\Puget Sound Surveys\Household Level\N_analysis\New folder (2)\ForPyUse_station.csv", case(preserve) 

/*Disadvantaged*/
logit AFV hhsize i.Veh_multi i.income_fourCate i.seattle_home i.HomeOwn i.car_share Public_AFVstations i.EquityDis i.EnviroDis i.OverallDis
gen LL_Full = -839.79265

logit AFV hhsize i.Veh_multi i.income_fourCate i.seattle_home i.HomeOwn i.car_share Public_AFVstations i.EquityDis i.EnviroDis i.OverallDis if Transpor_1 ==1
gen LL_EqDis=-258.74933
logit AFV hhsize i.Veh_multi i.income_fourCate i.seattle_home i.HomeOwn i.car_share Public_AFVstations i.EquityDis i.EnviroDis i.OverallDis if Transpor_1 ==0
gen LL_EqNotDis=-567.84071
gen LL_test = -2*( LL_Full - LL_EqDis - LL_EqNotDis )
di "chi2(22) =" LL_test
di "Prob>chi2="chi2tail(12, LL_test)

*Highly Disadvantaged - TransDis
logit AFV hhsize i.Veh_multi i.income_fourCate i.seattle_home i.HomeOwn i.car_share Public_AFVstations i.EqDis_60th i.EnvDis_60th i.Overall_60th if TrDis_60th ==0
gen LL_EqNotDis=-752.3597
logit AFV hhsize i.Veh_multi i.income_fourCate i.seattle_home i.HomeOwn i.car_share Public_AFVstations i.EqDis_60th i.EnvDis_60th i.Overall_60th if TrDis_60th ==1
gen LL_EqDis=-79.6027562
logit AFV hhsize i.Veh_multi i.income_fourCate i.seattle_home i.HomeOwn i.car_share Public_AFVstations i.EqDis_60th i.EnvDis_60th i.Overall_60th
gen LL_Full=-841.21655
gen LL_test = -2*( LL_Full - LL_EqDis - LL_EqNotDis )
di "chi2(12) =" LL_test
di "Prob>chi2="chi2tail(12, LL_test)

*Highly Disadvantaged - EcoDis
logit AFV hhsize i.Veh_multi i.income_fourCate i.seattle_home i.HomeOwn i.car_share Public_AFVstations i.EqDis_60th i.EnvDis_60th i.Overall_60th if EcoDis_60th ==0
gen LL_EqNotDis=-640.32192
logit AFV hhsize i.Veh_multi i.income_fourCate i.seattle_home i.HomeOwn i.car_share Public_AFVstations i.EqDis_60th i.EnvDis_60th i.Overall_60th if EcoDis_60th ==1
gen LL_EqDis=-193.07722
logit AFV hhsize i.Veh_multi i.income_fourCate i.seattle_home i.HomeOwn i.car_share Public_AFVstations i.EqDis_60th i.EnvDis_60th i.Overall_60th
gen LL_Full=-841.21655
gen LL_test = -2*( LL_Full - LL_EqDis - LL_EqNotDis )
di "chi2(12) =" LL_test
di "Prob>chi2="chi2tail(12, LL_test)