CREATE TABLE [epic].[rvudata] (
  [rvudata_id] [int] IDENTITY,
  [billarea_billarea_id] [int] NOT NULL DEFAULT (-1),
  [wrvu] [decimal](19, 4) NULL DEFAULT (0.00),
  [billingprovider_provider_id] [varchar](15) NOT NULL DEFAULT ('-1'),
  [billingprovider_providertype_id] [int] NULL,
  [calendarperiod] [int] NULL,
  [postdate_fiscalyear] [int] NULL,
  [fiscalperiod] [int] NULL,
  [serviceprovider_provider_id] [varchar](15) NOT NULL DEFAULT ('-1'),
  [serviceprovider_providertype_id] [int] NULL,
  [placeofservice_location_id] [int] NOT NULL DEFAULT (-1),
  [placeofservice_type_id] [int] NOT NULL DEFAULT (-1),
  [placeofservice_group_id] [int] NOT NULL DEFAULT (-1),
  [placeofservice_servicearea_id] [int] NOT NULL DEFAULT (-1),
  [chargeamount] [decimal](19, 4) NULL DEFAULT (0.00),
  [chargecount] [int] NULL DEFAULT (0.00),
  [postchargeamount] [decimal](19, 4) NULL DEFAULT (0.00),
  [rvufeeschedule] [decimal](19, 4) NULL DEFAULT (0.00),
  [voidchargeamount] [decimal](19, 4) NULL DEFAULT (0.00),
  [createdby] [nvarchar](255) NOT NULL DEFAULT (original_login()),
  [createddate] [datetime2] NOT NULL DEFAULT (sysutcdatetime()),
  [lastupdatedby] [nvarchar](255) NULL,
  [lastupdated] [datetime2](2) NULL,
  [rowguid] [uniqueidentifier] NOT NULL DEFAULT (newsequentialid()) ROWGUIDCOL,
  [versionnumber] [timestamp],
  [validfrom] [datetime2](2) NOT NULL DEFAULT (sysutcdatetime()),
  [validto] [datetime2](2) NOT NULL DEFAULT (CONVERT([datetime2](2),'9999-12-31 12:00:00')),
  CONSTRAINT [PK_epic_rvudata] PRIMARY KEY CLUSTERED ([rvudata_id])
)
ON [PRIMARY]
GO

ALTER TABLE [epic].[rvudata]
  ADD FOREIGN KEY ([billarea_billarea_id]) REFERENCES [epic].[billarea_billarea] ([billarea_billarea_id])
GO

ALTER TABLE [epic].[rvudata]
  ADD FOREIGN KEY ([billingprovider_provider_id]) REFERENCES [epic].[providers] ([provider_id])
GO

ALTER TABLE [epic].[rvudata]
  ADD FOREIGN KEY ([billingprovider_providertype_id]) REFERENCES [epic].[provider_providertype] ([provider_providertype_id])
GO

ALTER TABLE [epic].[rvudata]
  ADD FOREIGN KEY ([placeofservice_location_id]) REFERENCES [epic].[placeofservice_location] ([placeofservice_location_id])
GO

ALTER TABLE [epic].[rvudata]
  ADD FOREIGN KEY ([placeofservice_type_id]) REFERENCES [epic].[placeofservice_type] ([placeofservice_type_id])
GO

ALTER TABLE [epic].[rvudata]
  ADD FOREIGN KEY ([placeofservice_group_id]) REFERENCES [epic].[placeofservice_group] ([placeofservice_group_id])
GO

ALTER TABLE [epic].[rvudata]
  ADD FOREIGN KEY ([placeofservice_servicearea_id]) REFERENCES [epic].[placeofservice_servicearea] ([placeofservice_servicearea_id])
GO

ALTER TABLE [epic].[rvudata]
  ADD FOREIGN KEY ([serviceprovider_provider_id]) REFERENCES [epic].[providers] ([provider_id])
GO

ALTER TABLE [epic].[rvudata]
  ADD FOREIGN KEY ([serviceprovider_providertype_id]) REFERENCES [epic].[provider_providertype] ([provider_providertype_id])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', 'EPIC wRVU Data', 'SCHEMA', N'epic', 'TABLE', N'rvudata'
GO