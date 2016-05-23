CREATE TABLE [dbo].[tblchildren] (
    [CustomerID]  INT            IDENTITY (1, 1) NOT NULL,
    [FatherName]       NVARCHAR (50)  NULL,
    [MotherName]       NVARCHAR (50)  NULL,
    [LastName]       NVARCHAR (50)  NULL,
    [FirstName]       NVARCHAR (50)  NULL,
    [Taz]         NVARCHAR (50)  NULL,
    [DOB]         NVARCHAR (50)  NULL,
    [PhoneNumber] NVARCHAR (10)  NULL,
    [MobilePhone] NVARCHAR (50)  NULL,
    [Address]     NVARCHAR (200) NULL,
    [Email]       NVARCHAR (50)  NULL,
    [Klass]       NVARCHAR (50)  NULL,
    [Grade]       NVARCHAR (50)  NULL,
    [School]      NVARCHAR (50)  NULL,
    [HMO]         NVARCHAR (50)  NULL,
    [Office]         NVARCHAR (50)  NULL,
    [Date]         NVARCHAR (50)  NULL,
    [Worker]         NVARCHAR (50)  NULL,
    [IsActive]    BIT            NULL,

    CONSTRAINT [PK_tblchildren] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);

