*****************************************************************************
*****************************************************************************
*****************************************************************************
* Replication Material: Industrial Employment and Populism in Germany -
* Exploring the Effect of Actual and Looming Decline
* Authors: Michael Bayerlein, Julius Kölzer, and Anne Metten 
* Corresponding Author: Michael Bayerlein (michael.bayerlein@charite.de)
* Version 1.0, Date: 10.02.2025
*****************************************************************************
*****************************************************************************
*****************************************************************************

*****************************************************************************
*****************************************************************************
* Setup of analysis
*****************************************************************************
*****************************************************************************

* Basic settings
version 18
set more off
capture log close
clear all

* Formatting and style
set matsize 11000
set maxvar 11000
set scheme plotplainblind 

* Packages
ssc install spmap
ssc install outreg2

* Loading dataset
use "IndEmp_Data.dta", clear

*****************************************************************************
*****************************************************************************
* Data description and overview 
*****************************************************************************
*****************************************************************************

*******************************
* Figure 01
*******************************

* Decline and current industrial employment
twoway 	(scatter IndShare2021 IndDecline2021 if ID<=400, mcolor(gs8) msymbol(o)) ///
		(lfitci IndShare2021 IndDecline2021 if ID<=400, clcolor(black) clpattern(shortdash) clwidth(thick) ciplot(rline) alpattern(shortdash) alwidth(medium) sort), ///
		title("", size(medium) color(black)) ///
		ytitle("Industrial employment in 2021 (in %)", height(7) size(medlarge)) ///
		xtitle("Decline in industrial employment since 1970 (in %)", height(7) size(medlarge)) ///
		xlabel(, labsize(medlarge)) ///
		ylabel(0 10 to 60, labsize(medlarge) grid glwidth(medium) ///
		glpattern(dot) angle(horizontal)) ///
		legend(order(1 "Individual counties" 2 "95% CI" 3 "Fitted values") rows(1) size(3) region(lwidth(none)) position(6)) ///
		graphregion(color(white)) ysize(6) xsize(12)
graph save "fig1_1", replace

* Historic and current industrial employment
twoway 	(scatter IndShare2021 IndShare1970 if ID<=400, mcolor(gs8) msymbol(o)) ///
		(lfitci IndShare2021 IndShare1970 if ID<=400, clcolor(black) clpattern(shortdash) clwidth(thick) ciplot(rline) alpattern(shortdash) alwidth(medium) sort), ///
		title("", size(medium) color(black)) ///
		ytitle("Industrial employment in 2021 (in %)", height(7) size(medlarge)) ///
		xtitle("Historic industrial employment in 1970 (in %)", height(7) size(medlarge)) ///
		ylabel(, labsize(medlarge)) ///
		xlabel(, labsize(medlarge)) ///
		ylabel(0 10 to 60, labsize(medlarge) grid glwidth(medium) ///
		glpattern(dot) angle(horizontal)) ///
		legend(order(1 "Individual counties" 2 "95% CI" 3 "Fitted values") rows(1) size(3) region(lwidth(none)) position(6)) ///
		graphregion(color(white)) ysize(6) xsize(12)
graph save "fig1_2", replace

* Combining graphs
gr combine  "fig1_1.gph" "fig1_2.gph", rows(1) graphregion(color(white) margin(small)) imargin(1 1 1) ycommon xcommon ysize(6) xsize(12)
graph export "fig1.pdf", as(pdf) replace

* Deleting individual graphs
capture erase "fig1_1.gph" 
capture erase "fig1_2.gph"

*******************************
* Figure 02
*******************************

* Decline and current industrial employment
twoway 	(scatter Substitutability IndDecline2021 if ID<=400, mcolor(gs8) msymbol(o)) ///
		(lfitci Substitutability IndDecline2021 if ID<=400, clcolor(black) clpattern(shortdash) clwidth(thick) ciplot(rline) alpattern(shortdash) alwidth(medium) sort), ///
		title("", size(medium) color(black)) ///
		ytitle("Employees with high substitutability risk (in %)", height(7) size(medlarge)) ///
		xtitle("Decline in industrial employment since 1970 (in %)", height(7) size(medlarge)) ///
		ylabel(, labsize(medlarge)) ///
		xlabel(, labsize(medlarge)) ///
		ylabel(0 10 to 60, grid glwidth(medium) ///
		glpattern(dot) angle(horizontal)) ///
		legend(order(1 "Individual counties" 2 "95% CI" 3 "Fitted values") rows(1) size(3) region(lwidth(none)) position(6)) ///
		graphregion(color(white)) ysize(6) xsize(12)
graph save "fig2_1", replace

* Historic and current industrial employment
twoway 	(scatter Substitutability IndShare1970 if ID<=400, mcolor(gs8) msymbol(o)) ///
		(lfitci Substitutability IndShare1970  if ID<=400, clcolor(black) clpattern(shortdash) clwidth(thick) ciplot(rline) alpattern(shortdash) alwidth(medium) sort), ///
		title("", size(medium) color(black)) ///
		ytitle("Employees with high substitutability risk (in %)", height(7) size(medlarge)) ///
		xtitle("Historic industrial employment in 1970 (in %)", height(7) size(medlarge)) ///
		ylabel(, labsize(medlarge)) ///
		xlabel(, labsize(medlarge)) ///
		ylabel(0 10 to 60, grid glwidth(medium) ///
		glpattern(dot) angle(horizontal)) ///
		legend(order(1 "Individual counties" 2 "95% CI" 3 "Fitted values") rows(1) size(3) region(lwidth(none)) position(6)) ///
		graphregion(color(white)) ysize(6) xsize(12)
graph save "fig2_2", replace

* Combining graphs
gr combine  "fig2_2.gph" "fig2_1.gph", rows(1) graphregion(color(white) margin(small)) imargin(1 1 1) ycommon xcommon ysize(6) xsize(12)
graph export "fig2.pdf", as(pdf) replace

* Deleting individual graphs
capture erase "fig2_1.gph" 
capture erase "fig2_2.gph"

*******************************
* Figure 03
*******************************

* Changing format for legend
format IndDecline2021 %12.1f
format IndShare1970 %12.1f

* Creating maps
spmap 	IndShare1970 using "IndEmp_Map.dta", id(ID) fcolor(Greys) ///
		ndfcolor(black) ndo(black) clnumber(7) ///
		title("Share in 1970", size(medium) color(black)) ///
		legend(position(8) size(2))
graph save "fig3_1", replace

spmap 	IndDecline2021 using "IndEmp_Map.dta", id(ID) fcolor(Greys) ///
		ndfcolor(black) ndo(black) clnumber(7) ///
		title("Decline since 1970", size(medium) color(black)) ///
		legend(position(8) size(2))
graph save "fig3_2", replace

* Changing format back
format IndDecline2021 %10.0g
format IndShare1970 %10.0g

* Combining graphs
gr combine  "fig3_1.gph" "fig3_2.gph", rows(1) graphregion(color(white) margin(small)) imargin(1 1 1) ycommon xcommon
graph export "fig3.pdf", as(pdf) replace

* Deleting individual graphs
capture erase "fig3_1.gph" 
capture erase "fig3_2.gph"

* Removing additional IDs 

*******************************
* Figure 04
*******************************

* Decline and current industrial employment
twoway 	(scatter IndDecline2021 IndShare1970 if East==0 & ID<=400, mcolor(gs8) msymbol(o)) ///
		(lfitci IndDecline2021 IndShare1970 if East==0 & ID<=400, clcolor(black) clpattern(shortdash) clwidth(thick) ciplot(rline) alpattern(shortdash) alwidth(medium) sort), ///
		title("Western Germany", size(medlarge) color(black)) ///
		ytitle("Decline in industrial employment since 1970 (in %)", height(7) size(medlarge)) ///
		xtitle("Historic industrial employment in 1970 (in %)", height(7) size(medlarge)) ///
		ylabel(, labsize(medlarge)) ///
		xlabel(, labsize(medlarge)) ///
		ylabel(, grid glwidth(medium) ///
		glpattern(dot) angle(horizontal)) ///
		legend(order(1 "Individual counties" 2 "95% CI" 3 "Fitted values") rows(1) size(3) region(lwidth(none)) position(6)) ///
		graphregion(color(white)) ysize(6) xsize(12)
graph save "fig4_1", replace

* Historic and current industrial employment
twoway 	(scatter IndDecline2021 IndShare1970 if East==1 & ID<=400, mcolor(gs8) msymbol(o)) ///
		(lfitci IndDecline2021 IndShare1970 if East==1 & ID<=400, clcolor(black) clpattern(shortdash) clwidth(thick) ciplot(rline) alpattern(shortdash) alwidth(medium) sort), ///
		title("Eastern Germany", size(medlarge) color(black)) ///
		ytitle("Decline in industrial employment since 1970 (in %)", height(7) size(medlarge)) ///
		xtitle("Historic industrial employment in 1970 (in %)", height(7) size(medlarge)) ///
		ylabel(, labsize(medlarge)) ///
		xlabel(, labsize(medlarge)) ///
		ylabel(, grid glwidth(medium) ///
		glpattern(dot) angle(horizontal)) ///
		legend(order(1 "Individual counties" 2 "95% CI" 3 "Fitted values") rows(1) size(3) region(lwidth(none)) position(6)) ///
		graphregion(color(white)) ysize(6) xsize(12)
graph save "fig4_2", replace

* Combining graphs
gr combine  "fig4_1.gph" "fig4_2.gph", rows(1) graphregion(color(white) margin(small)) imargin(1 1 1) ycommon xcommon ysize(6) xsize(12)
graph export "fig4.pdf", as(pdf) replace

* Deleting individual graphs
capture erase "fig4_1.gph" 
capture erase "fig4_2.gph"

*******************************
* Figure 05
*******************************

* Changing format for legend
format AfD2021 %12.1f
format DieLinke2021 %12.1f

* Creating maps
spmap 	AfD2021 using "IndEmp_Map.dta", id(ID) fcolor(Greys) ///
		ndfcolor(black) ndo(black) clnumber(7) /// 
		title("AfD", size(medium) color(black)) ///
		legend(position(8) size(2))
graph save "fig5_1", replace

spmap 	DieLinke2021 using "IndEmp_Map.dta", id(ID) fcolor(Greys) ///
		ndfcolor(black) ndo(black) clnumber(7) /// 
		title("Die Linke", size(medium) color(black)) ///
		legend(position(8) size(2))
graph save "fig5_2", replace

* Changing format back
format AfD2021 %10.0g
format DieLinke2021 %10.0g

* Combining graphs
gr combine  "fig5_1.gph" "fig5_2.gph", rows(1) graphregion(color(white) margin(small)) imargin(1 1 1) ycommon xcommon
graph export "fig5.pdf", as(pdf) replace

* Deleting individual graphs
capture erase "fig5_1.gph" 
capture erase "fig5_2.gph"


*****************************************************************************
*****************************************************************************
* Regression analysis
*****************************************************************************
*****************************************************************************

* Preparing data for GLM regression models
foreach var of varlist IndDecline2017 IndDecline2021 IndShare1970 IndShare2021 AfD2021 DieLinke2021 AfD2017 DieLinke2017{
	replace `var'=`var'/100
}

*******************************
* Table 01: Regression Models AfD
*******************************

* Regression models testing Hypothesis 1
glm AfD2021 IndShare1970 IndDecline2021 i.state_id if ID<=400, link(logit) family(binomial) nolog vce(r)
outreg2 using "RegTab1.tex", ///
	tex append addstat(AIC, `e(aic)') bdec(3) sdec(2) noomitted addtext(State Fixed Effects, Yes) drop (i.state_id)	
	
glm AfD2021 IndShare1970 IndDecline2021 Unemployment Women Age65plus Education Inequality East if ID<=400, link(logit) family(binomial) nolog vce(r)
outreg2 using "RegTab1.tex", ///
	tex append addstat(AIC, `e(aic)') bdec(3) sdec(2) noomitted addtext(State Fixed Effects, No) drop (i.state_id)

* Predicted values
margins, at(IndShare1970==(0.5(0.1)0.6) East==0)

margins, at(IndShare1970==(0.5(0.1)0.6) East==1)

margins, at(IndShare1970=(0.225(0.025)0.725) East=(0 1))

marginsplot, ///
		recast(line) plot1opts(lpattern(shortdash)) plotopts(lcolor(black)) recastci(rcap) ciopts(lcolor(gs10) color(gs10)) ///
		title("", size(medium) color(black)) ///
		ytitle("Predicted AfD vote share (in %)", height(7) size(medlarge)) ///
		xtitle("Historic industrial employment (in %)", height(7) size(medlarge)) ///
		ylabel(0 "0" .05 "5" 0.1 "10" 0.15 "15" .20 "20" .25 "25", labsize(medlarge)) ///
		xlabel(0.20 "20" .3 "30" 0.4 "40" .5 "50" 0.6 "60" 0.7 "70" .8 "80", labsize(medlarge)) ///
		graphregion(color(white)) legend(position(6)) ysize(6) xsize(12) ///
		addplot(histogram IndShare1970, frequency  yaxis(2)  ///
           ytitle("Frequency (bars)", axis(2) size(medlarge)) ///
           ylabel(#6, axis(2) format(%8.0g) labsize(medlarge)) ///
           ysc(axis(2) titlegap(7) alt) color(gs10%20) ///
		   legend(order(3 "Western Germany" 4 "Eastern Germany") rows(1) size(3)))
graph export "fig6.pdf", as(pdf) replace	

* Robustness checks with OLS regression without robust standard errors
reg AfD2021 IndShare1970 IndDecline2021 Unemployment Women Age65plus Education Inequality East if ID<=400

* Heteroskedasticity 
estat hettest

* Multicollinearity
estat vif

* Outliers
lvr2plot, mlabel(county_id) mlabsize(tiny) mlabcolor(black)

* Linearity of the IVs
acprplot IndShare1970, mspline
acprplot IndDecline2021, mspline 

* Normal Distribution of errors
predict rstudentAfD, rstudent
kdensity rstudentAfD
drop rstudentAfD 

*******************************
* Table 01: Regression Models Die Linke
*******************************

* Regression models testing Hypothesis 2
glm DieLinke2021 IndShare1970 IndDecline2021 i.state_id if ID<=400, link(logit) family(binomial) nolog vce(r)
outreg2 using "RegTab1.tex", ///
	tex append addstat(AIC, `e(aic)') bdec(3) sdec(2) noomitted addtext(State Fixed Effects, Yes) drop (i.state_id)	

glm DieLinke2021 IndShare1970 IndDecline2021 Unemployment Women Age65plus Education Inequality East if ID<=400, link(logit) family(binomial) nolog vce(r)
outreg2 using "RegTab1.tex", ///
	tex append addstat(AIC, `e(aic)') bdec(3) sdec(2) noomitted addtext(State Fixed Effects, No) drop (i.state_id)
	
* Predicted values
margins, at(IndDecline2021==(0.44(0.18)0.62) East==0)

margins, at(IndDecline2021==(0.44(0.18)0.62) East==1)

margins, at(IndDecline2021=(-0.25(0.05)0.8) East=(0 1))

marginsplot, ///
		recast(line) plot1opts(lpattern(shortdash)) plotopts(lcolor(black)) recastci(rcap) ciopts(lcolor(gs10) color(gs10)) ///
		title("", size(medium) color(black)) ///
		ytitle("Predicted Die Linke vote share (in %)", height(7) size(medlarge)) ///
		xtitle("Decline in industrial employment (in %)", height(7) size(medlarge)) ///
		ylabel(0 "0" 0.02 "2" 0.04 "4" .06 "6" .08 "8" 0.10 "10" 0.12 "12", labsize(medlarge)) ///
		xlabel(-.3 "-30" -.2 "-20" -.1 "-10" 0 "0" .1 "10" .2 "20" 0.3 "30" .4 "40" .5 "50" 0.6 "60" 0.7 "70" .8 "80", labsize(medlarge)) ///
		graphregion(color(white)) legend(position(6)) ysize(6) xsize(12) ///
		addplot(histogram IndDecline2021, frequency  yaxis(2)  ///
           ytitle("Frequency (bars)", axis(2) size(medlarge)) ///
           ylabel(#6, axis(2) format(%8.0g) labsize(medlarge)) ///
           ysc(axis(2) titlegap(7) alt) color(gs10%20) ///
		   legend(order(3 "Western Germany" 4 "Eastern Germany") rows(1) size(3)))
graph export "fig7.pdf", as(pdf) replace	

* Robustness checks with OLS regression without robust standard errors
reg DieLinke2021 IndShare1970 IndDecline2021 Unemployment Women Age65plus Education Inequality East if ID<=400

* Heteroskedasticity 
estat hettest

* Multicollinearity
estat vif

* Outliers
lvr2plot, mlabel(county_id) mlabsize(tiny) mlabcolor(black)

* Linearity of the IVs
acprplot IndShare1970, mspline
acprplot IndDecline2021, mspline

* Normal Distribution of errors
predict rstudentDieLinke, rstudent 
kdensity rstudentDieLinke
drop rstudentDieLinke

*******************************
* Appendix Table 01: Regression Models AfdD
*******************************

glm AfD2017 IndShare1970 IndDecline2017 i.state_id if ID<=400, link(logit) family(binomial) nolog vce(r)
outreg2 using "RegTabA1.tex", ///
	tex append addstat(AIC, `e(aic)') bdec(3) sdec(2) noomitted addtext(State Fixed Effects, Yes) drop (i.state_id)	
	
glm AfD2017 IndShare1970 IndDecline2017 Unemployment Women Age65plus Education Inequality East if ID<=400, link(logit) family(binomial) nolog vce(r)
outreg2 using "RegTabA1.tex", ///
	tex append addstat(AIC, `e(aic)') bdec(3) sdec(2) noomitted addtext(State Fixed Effects, No) drop (i.state_id)

*******************************
* Appendix Table 01: Regression Models Die Linke
*******************************

glm DieLinke2017 IndShare1970 IndDecline2017 i.state_id if ID<=400, link(logit) family(binomial) nolog vce(r)
outreg2 using "RegTabA1.tex", ///
	tex append addstat(AIC, `e(aic)') bdec(3) sdec(2) noomitted addtext(State Fixed Effects, Yes) drop (i.state_id)	
	
glm DieLinke2017 IndShare1970 IndDecline2017 Unemployment Women Age65plus Education Inequality East if ID<=400, link(logit) family(binomial) nolog vce(r)
outreg2 using "RegTabA1.tex", ///
	tex append addstat(AIC, `e(aic)') bdec(3) sdec(2) noomitted addtext(State Fixed Effects, No) drop (i.state_id)

* Deleting txt file
capture erase "RegTab1.txt"
capture erase "RegTabA1.txt"

/*
ATTENTION
SOEP REMOTE ACCESS AND ADDITIONAL DATA PREPARATION NECESSARY BEYOND THIS POINT
CODE FOR DISPLAY PURPOSES ONLY

*******************************
* Appendix Table 02: Regression Models 2021 (SOEP Data)
*******************************

* Removing missing observations
soepkeep if subst!=. & unemployed!=. ///
 & nuts2_c!=. & indempdicper!=. & indsecper!=. /// 
 & women!=. &  age!=. ///
 & educationyears!=. & incomesatisfaction!=.

* AfD 2021
logit afdpartypreference c.subst i.unemployed i.nuts2_c, ///
vce(cluster nuts2_c)

logit afdpartypreference c.subst i.unemployed ///
indempdicper indsecper ///
, vce(cluster nuts2_c)

logit afdpartypreference c.subst i.unemployed ///
indempdicper indsecper women age ///
educationyears incomesatisfaction east, vce(cluster nuts2_c)

* Die Linke 2021
logit linkepartypreference c.subst i.unemployed i.nuts2_c, ///
vce(cluster nuts2)

logit linkepartypreference c.subst i.unemployed  ///
indempdicper indsecper ///
, vce(cluster nuts2_c)

logit linkepartypreference c.subst i.unemployed ///
indempdicper indsecper women age ///
educationyears incomesatisfaction east, vce(cluster nuts2_c)

*******************************
* Appendix Table 03: Regression Models 2017 (SOEP Data)
*******************************

* AfD 2017
logit afdpartypreference c.subst i.unemployed i.nuts2_c, ///
vce(cluster nuts2_c)

logit afdpartypreference c.subst i.unemployed ///
indempdicper indsecper ///
, vce(cluster nuts2_c)

logit afdpartypreference c.subst i.unemployed ///
indempdicper indsecper women age ///
educationyears incomesatisfaction east, vce(cluster nuts2_c)


* Die Linke 2017
logit linkepartypreference c.subst i.unemployed i.nuts2_c, ///
vce(cluster nuts2)

logit linkepartypreference c.subst i.unemployed  ///
indempdicper indsecper ///
, vce(cluster nuts2_c)

logit linkepartypreference c.subst i.unemployed ///
indempdicper indsecper women age ///
educationyears incomesatisfaction east, vce(cluster nuts2_c)

*******************************
* Appendix Table 04: Regression Models with Interaction Terms 2021 (SOEP Data)
*******************************

* AfD 2021
logit afdpartypreference c.subst##c.indsecper ///
i.unemployed##c.indempdicper women age ///
educationyears incomesatisfaction east, vce(cluster nuts2_c)

* Die Linke 2021
logit linkepartypreference c.subst##c.indsecper ///
i.unemployed##c.indempdicper women age ///
educationyears incomesatisfaction east, vce(cluster nuts2_c)

*******************************
* Appendix Table 04: Regression Models with Interaction Terms 2017 (SOEP Data)
*******************************

* AfD 2017
logit afdpartypreference c.subst##c.indsecper ///
i.unemployed##c.indempdicper women age ///
educationyears incomesatisfaction east, vce(cluster nuts2_c)

* Die Linke 2017
logit linkepartypreference c.subst##c.indsecper ///
i.unemployed##c.indempdicper women age ///
educationyears incomesatisfaction east, vce(cluster nuts2_c)



