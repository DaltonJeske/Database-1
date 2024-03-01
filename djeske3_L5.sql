--Query 1
SELECT DroneID,
       ROUND( (AVG(costPerMile) ), 2) AS AvgCostPerMile
  FROM FlightReservation
 WHERE statusID = 5
 GROUP BY DroneID
 ORDER BY AvgCostPerMile;

--Query 2
SELECT *
  FROM FlightReservation
 ORDER BY dropOffLat DESC
 LIMIT 3;

--Query 3
SELECT state,
       COUNT(passID) AS NumPassengers
  FROM Passenger
 GROUP BY state
 ORDER BY NumPassengers;

--Query 4
SELECT MIN(TopSpeed) AS Slowest,
       AVG(TopSpeed) AS Average,
       Max(TopSpeed) AS Fastest
  FROM Model
 WHERE typeID = 1 OR 
       typeID = 3;

--Query 5
SELECT flightID,
       COUNT(passID) AS PassCount
  FROM ManifestPassenger
 GROUP BY flightID
 ORDER BY PassCount DESC,
          flightID;
