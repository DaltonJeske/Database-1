--Query 1
SELECT FlightID,
       PassID,
       firstName,
       lastName
  FROM ManifestPassenger
       INNER JOIN
       Passenger USING (
           PassID
       )
 WHERE flightID = 79
 ORDER BY lastName;

--Query 2
SELECT FlightID,
       PickUpTime,
       ROUND(SUM(seatPrice), 2) AS TotalSeatPrice,
       CostPerMile
  FROM FlightReservation
       INNER JOIN
       ManifestPassenger USING (
           flightID
       )
 GROUP BY flightID
 ORDER BY TotalSeatPrice DESC;
 
--Query 3
SELECT FirstName,
       LastName,
       FlightID,
       PickUpTime,
       SeatPrice
  FROM Passenger
       INNER JOIN
       ManifestPassenger USING (
           passID
       )
       INNER JOIN
       FlightReservation USING (
           flightID
       )
 WHERE firstName LIKE "%Cody%" AND 
       lastName LIKE "%Black%"
 ORDER BY PickUpTime;

--Query 4
SELECT FlightID,
       PickUpTime,
       ActDropOffTime,
       PackageID,
       Length,
       Width,
       Height,
       Weight
  FROM ManifestPackage
       INNER JOIN
       FlightReservation USING (
           flightID
       )
       INNER JOIN
       Package USING (
           packageID
       )
 WHERE flightID = 10;

--Query 5
SELECT DroneID,
       Color,
       AddedOn,
       Model,
       Description
  FROM Model
       LEFT JOIN
       Drone USING (
           modelID
       )
 ORDER BY model;

--Query 6 with USING
SELECT LastName,
       FirstName,
       FlightID
  FROM FlightReservation
       LEFT JOIN
       RemotePilot USING (
           remotePilotID
       )
 GROUP BY remotePilotID
 ORDER BY LastName,
          FirstName,
          FlightID;

--Query 6 with ON
SELECT LastName,
       FirstName,
       FlightID
  FROM FlightReservation
       LEFT JOIN
       RemotePilot ON remotePilotID = pilotID
 GROUP BY remotePilotID
 ORDER BY LastName,
          FirstName,
          FlightID;

--Query 7 I couldn't get the description to show even after swapping foreign key to description
SELECT FlightID,
       PickUpTime,
       EstDropOffTime,
       CostPerMile,
       PickUpLat,
       PickUpLong,
       DropOffLat,
       DropOffLong,
       typeID AS Type,
       statusID AS Status,
       firstName AS PilotFirstName,
       lastName AS PilotLastName
  FROM FlightReservation
       INNER JOIN
       FlightType USING (
           typeID
       )
       INNER JOIN
       FlightStatus USING (
           statusID
       )
       INNER JOIN
       RemotePilot ON remotePilotID = pilotID
 WHERE flightID = 78;
