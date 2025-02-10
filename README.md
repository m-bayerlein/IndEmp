# Replication Material

## Industrial Employment and Populism in Germany - Exploring the Effect of Actual and Looming Decline
**by Michael Bayerlein, Julius Kölzer and Anne Metten** \
**Politische Vierteljahresschrift**

The replication material includes three resources: our dataset (IndEmp_Data.dta), the coordinates used for mapping the data (IndEmp_Map.dta), and our Do-File (IndEmp_DoFile.do). The Do-File was written and executed in Stata 18.0 MP. Please note that part of the analysis was conducted using the SOEP Remote Access. This section of the Do-File is for display purposes only.

The dataset "IndEmp_Data.dta" contains the following variables:
<!DOCTYPE html>
<html>
<body>
    <table>
        <tr>
            <th>Variable</th>
            <th>Storage Type</th>
            <th>Display Format</th>
            <th>Variable Label</th>
        </tr>
        <tr>
            <td>ID</td>
            <td>int</td>
            <td>%12.0g</td>
            <td>Geography ID (maps)</td>
        </tr>
        <tr>
            <td>ARS</td>
            <td>str5</td>
            <td>%9s</td>
            <td>County ID (string)</td>
        </tr>
        <tr>
            <td>county_id</td>
            <td>int</td>
            <td>%10.0g</td>
            <td>County ID</td>
        </tr>
        <tr>
            <td>county_name</td>
            <td>str45</td>
            <td>%15s</td>
            <td>County name</td>
        </tr>
        <tr>
            <td>state_id</td>
            <td>byte</td>
            <td>%10.0g</td>
            <td>State ID</td>
        </tr>
        <tr>
            <td>AfD2021</td>
            <td>double</td>
            <td>%12.0g</td>
            <td>AfD vote share in 2021 in % (Source: Bundeswahlleiter)</td>
        </tr>
        <tr>
            <td>DieLinke2021</td>
            <td>double</td>
            <td>%12.0g</td>
            <td>DieLinke vote share in 2021 in % (Source: Bundeswahlleiter)</td>
        </tr>
        <tr>
            <td>AfD2017</td>
            <td>float</td>
            <td>%9.0g</td>
            <td>AfD vote share in 2017 in % (Source: Bundeswahlleiter)</td>
        </tr>
        <tr>
            <td>DieLinke2017</td>
            <td>float</td>
            <td>%9.0g</td>
            <td>DieLinke vote share in 2017 in % (Source: Bundeswahlleiter)</td>
        </tr>
        <tr>
            <td>IndDecline2021</td>
            <td>double</td>
            <td>%10.0g</td>
            <td>Historic industrial employment decline from 1970 to 2021 in % (Source: Own calculation)</td>
        </tr>
        <tr>
            <td>IndDecline2017</td>
            <td>double</td>
            <td>%10.0g</td>
            <td>Historic industrial employment decline from 1970 to 2017 in % (Source: Own calculation)</td>
        </tr>
        <tr>
            <td>IndShare2021</td>
            <td>double</td>
            <td>%10.0g</td>
            <td>Current industrial employment share in 2021 in % (Source: Destatis)</td>
        </tr>
        <tr>
            <td>IndShare2017</td>
            <td>double</td>
            <td>%10.0g</td>
            <td>Current industrial employment share in 2017 in % (Source: Destatis)</td>
        </tr>
        <tr>
            <td>IndShare1970</td>
            <td>double</td>
            <td>%10.0g</td>
            <td>Historic industrial employment share in 1970 in % (Source: Own calculation)</td>
        </tr>
        <tr>
            <td>Substitutability</td>
            <td>double</td>
            <td>%10.0g</td>
            <td>Employees with high substitutability risk in % (Source: Dengler et al. 2018)</td>
        </tr>
        <tr>
            <td>Unemployment</td>
            <td>double</td>
            <td>%10.0g</td>
            <td>Unemployed as a percentage of the civilian labour force in 2021 (Source: INKAR)</td>
        </tr>
        <tr>
            <td>Women</td>
            <td>double</td>
            <td>%10.0g</td>
            <td>Share of women in the population in % in 2021 (Source: INKAR)</td>
        </tr>
        <tr>
            <td>Age65plus</td>
            <td>double</td>
            <td>%10.0g</td>
            <td>Share of residents aged 65 and over in % of the population in 2021 (Source: INKAR)</td>
        </tr>
        <tr>
            <td>Education</td>
            <td>double</td>
            <td>%10.0g</td>
            <td>Share of higher education qualification students in 2021 (Source: INKAR)</td>
        </tr>
        <tr>
            <td>Inequality</td>
            <td>float</td>
            <td>%9.0g</td>
            <td>Regional spatial inequality (Source: Bayerlein 2022)</td>
        </tr>
        <tr>
            <td>East</td>
            <td>float</td>
            <td>%9.0g</td>
            <td>Eastern Germany dummy variable (1=East, 0=West)</td>
        </tr>
</body>
</html>
