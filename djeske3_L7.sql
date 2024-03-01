--Query 1
SELECT LastName,
       FirstName,
       COUNT(FlightID) AS TotalFlights
  FROM RemotePilot
       INNER JOIN
       FlightReservation ON (PilotID = remotePilotID) 
 GROUP BY PilotID
 ORDER BY LastName;

--Query 2
SELECT FlightType.description AS FlightType,
       COUNT(TypeID) AS TotalFlights
  FROM FlightReservation
       INNER JOIN
       FlightType USING (
           TypeID
       )
 GROUP BY TypeID;

--Query 3
SELECT DroneID,
       Brand,
       Model,
       COUNT(flightID) AS TotalFlights
  FROM Drone
       INNER JOIN
       Model USING (
           modelID
       )
       INNER JOIN
       FlightReservation USING (
           droneID
       )
 WHERE statusID = 5 OR 
       statusID = 4
 GROUP BY DroneID
 ORDER BY Brand,
          Model,
          TotalFlights;

--Query 4
SELECT GroupID,
       nickname AS GroupNickname,
       Description,
       LastName,
       FirstName
  FROM PassGroup
       INNER JOIN
       PassGroupMember USING (
           GroupID
       )
       INNER JOIN
       Passenger USING (
           PassID
       )
 WHERE GroupID = 9;

--Query 5
SELECT GroupType.description AS GroupType,
       COUNT(PassID) AS GroupMemberCount
  FROM GroupType
       INNER JOIN
       PassGroup USING (
           GroupTypeID
       )
       INNER JOIN
       PassGroupMember USING (
           GroupID
       )
 GROUP BY GroupType;
