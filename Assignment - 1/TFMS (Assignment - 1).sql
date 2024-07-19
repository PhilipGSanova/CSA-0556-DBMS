CREATE TABLE [Roads] (
  [RoadID] int PRIMARY KEY,
  [RoadName] nvarchar(255),
  [Length] int,
  [SpeedLimit] int
)
GO

CREATE TABLE [Intersections] (
  [IntersectionID] int PRIMARY KEY,
  [IntersectionName] nvarchar(255),
  [Latitude] float,
  [Longitude] float
)
GO

CREATE TABLE [TrafficSignals] (
  [SignalID] int PRIMARY KEY,
  [IntersectionID] int,
  [SignalStatus] nvarchar(255),
  [Timer] int
)
GO

CREATE TABLE [TrafficData] (
  [TrafficDataID] int PRIMARY KEY,
  [RoadID] int,
  [IntersectionID] int,
  [Timestamp] datetime,
  [Speed] float,
  [CongestionLevel] int
)
GO

ALTER TABLE [TrafficSignals] ADD FOREIGN KEY ([IntersectionID]) REFERENCES [Intersections] ([IntersectionID])
GO

ALTER TABLE [TrafficData] ADD FOREIGN KEY ([RoadID]) REFERENCES [Roads] ([RoadID])
GO

ALTER TABLE [TrafficData] ADD FOREIGN KEY ([IntersectionID]) REFERENCES [Intersections] ([IntersectionID])
GO
