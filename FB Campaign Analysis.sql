SELECT *
FROM FacebookCampaign

-- Checking for duplicate
Select ad_id, Count(*)
From FacebookCampaign
Group by  ad_id
Having Count(*)>1


-- Checking for null values
Select ad_id
From FacebookCampaign
Where ad_id IS NULL

-- Checking for different types of campaign run
Select Distinct xyz_campaign_id
From FacebookCampaign

-- Alter column data type then change campaign names 916,  936, 1178 - Campaign A, Campaign B, Campaign C

ALter Table FacebookCampaign
Alter Column xyz_campaign_id Varchar(30)


Update FacebookCampaign
Set xyz_campaign_id = 'Campaign A'
Where xyz_campaign_id = Cast (916 AS VARCHAR)

Update FacebookCampaign
Set xyz_campaign_id = 'Campaign B'
Where xyz_campaign_id = Cast (936 AS VARCHAR)

Update FacebookCampaign
Set xyz_campaign_id = 'Campaign C'
Where xyz_campaign_id = Cast (1178 AS VARCHAR) 

--- Total number of Ads per campaign
Select xyz_campaign_id As 'Campaign ID', Count (xyz_campaign_id) AS 'No of Ads'
From FacebookCampaign
Group by xyz_campaign_id
Order by 'No of Ads' Desc

-- Age group count
Select Age, Count (Age) AS 'Total'
From FacebookCampaign
Group by Age
Order by 'Total' Desc

-- Gender count
Select Gender, Count (Gender) AS 'Total'
From FacebookCampaign
Group by Gender
Order by 'Total' Desc

-- Gender count by age group
Select Gender, Age, Count (*) As 'Total'
From FacebookCampaign
Group by Age, Gender
Order by 'Total' Desc

-- Gender count by interest
Select Top 10 Gender, Interest, Count (*) As 'Total'
From FacebookCampaign
Group by Interest, Gender
Order by 'Total' Desc

-- Campaign count by Approved Conversion
Select xyz_campaign_id, Approved_Conversion, Count (*) As 'Total'
From FacebookCampaign
Group by xyz_campaign_id, Approved_Conversion
Order by 'Total' Desc

-- Purchase count by Interest
Select Top 10 interest, Approved_Conversion, Count (*) As 'Total'
From FacebookCampaign
Group by interest, Approved_Conversion
Order by 'Total' Desc

-- Total Spent
Select SUM (Spent)
From FacebookCampaign

--Total Spend by campaign
Select xyz_campaign_id, SUM (Spent) As Spend
From FacebookCampaign
Group by xyz_campaign_id
Order by Spend Desc

--Total Spend by Gender
Select Gender, SUM (Spent) As Spend
From FacebookCampaign
Group by Gender
Order by Spend Desc