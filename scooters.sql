SELECT *
FROM trips

SELECT *
FROM scooters

SELECT DISTINCT costpermin
FROM scooters


SELECT tripduration
FROM scooters
WHERE costpermin = '0.00'
GROUP BY companyname


SELECT
    sum(case when pubtimestamp is null then 1 else 0 end) as pubtimestamp, 
    sum(case when companyname is null then 1 else 0 end) as companyname, 
    sum(case when triprecordnum is null then 1 else 0 end) as triprecordnum,
    sum(case when sumdid is null then 1 else 0 end) as sumdid, 
    sum(case when tripduration is null then 1 else 0 end) as tripduration,
	sum(case when tripduration is null then 1 else 0 end) as tripdistance,
    sum(case when startdate is null then 1 else 0 end) as startdate,
    sum(case when starttime is null then 1 else 0 end) as starttime,
    sum(case when enddate is null then 1 else 0 end) as enddate, 
    sum(case when endtime is null then 1 else 0 end) as endtime, 
    sum(case when startlatitude is null then 1 else 0 end) as startlatitude,
    sum(case when startlongitude is null then 1 else 0 end) as startlongitude,
    sum(case when endlatitude is null then 1 else 0 end) as endlatitude, 
    sum(case when endlongitude is null then 1 else 0 end) as endlongitude, 
    sum(case when triproute is null then 1 else 0 end) as triproute,
    sum(case when create_dt is null then 1 else 0 end) as create_dt 
FROM trips 

SELECT
    sum(case when pubdatetime is null then 1 else 0 end) as pubdatetime, 
    sum(case when latitude is null then 1 else 0 end) as latitude, 
    sum(case when longitude is null then 1 else 0 end) as longitude,
    sum(case when sumdid is null then 1 else 0 end) as sumdid, 
    sum(case when sumdtype is null then 1 else 0 end) as sumdtype, 
    sum(case when chargelevel is null then 1 else 0 end) as chargelevel,
    sum(case when sumdgroup is null then 1 else 0 end) as sumdgroup,
    sum(case when costpermin is null then 1 else 0 end) as costpermin, 
    sum(case when companyname is null then 1 else 0 end) as companyname
FROM scooters

--SCOOTERS time min and max
SELECT MAX(DISTINCT pubdatetime), MIN(DISTINCT pubdatetime)
FROM scooters
-- "2019-07-31 23:59:57"
-- "2019-05-01 00:01:41.247"


--TRIPS time min and max
SELECT MAX(DISTINCT pubtimestamp),MIN(DISTINCT pubtimestamp)
FROM trips
-- 2019-08-01 07:04:00
-- "2019-05-01 00:00:55.423"

SELECT MAX(DISTINCT startdate), MIN(DISTINCT startdate)
FROM trips
-- 2019-07-31
-- 2019-05-01
SELECT MAX(DISTINCT enddate), MIN(DISTINCT enddate)
FROM trips
-- 2019-08-01
-- 2019-05-01
SELECT MAX(DISTINCT create_dt), MIN(DISTINCT create_dt)
FROM trips
-- "2019-08-02 11:30:29.923"
-- 2019-05-02 05:30:23.78
SELECT create_dt
FROM trips


SELECT COUNT( DISTINCT sumdid)
FROM scooters
GROUP BY companyname

"Bird"	3860
"Bolt"	360
"Gotcha" 224
"Jump"	1210
"Lime"	1824
"Lyft"	1735
"Spin"	805

SELECT companyname, COUNT( DISTINCT sumdid)
FROM scooters
WHERE sumdgroup <> 'bicycle'
GROUP BY companyname
"Bird"	3860
"Bolt"	360
"Gotcha" 224
"Jump"	1210
"Lime"	1818
"Lyft"	1735
"Spin"	805

SELECT companyname, AVG(tripduration)
FROM trips
GROUP BY companyname

--  what was i going to use this for 97.443879

SELECT t.pubtimestamp, s.sumdid, s.latitude, s.longitude, t.companyname
FROM trips as t
FULL JOIN scooters as s
USING (sumdid)
WHERE s.sumdgroup <> 'bicycle' AND s.latitude <= 35 AND s.longitude >= -88



SELECT sumdid , pubdatetime, companyname
FROM scooters
WHERE sumdgroup <> 'bicycle
